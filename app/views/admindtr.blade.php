@extends("layout")
@section("content")


<head>
    <title>Reports | Time and Electronic Attendance Monitoring System</title>
</head>

<h1>Daily Time Records</h1>

<div class='col-md-4'>
{{ Form::open(array('url' => 'report/dtr', 'method' => 'get')) }}
<h3>Select an Employee</h3>
     {{ Form::select('employs_id', $employs_id, Input::get('employs_id'));}}<br><br>
</div>

<div class='col-md-4'>
<h3>Select a Month</h3>

     {{ Form::selectMonth('month', Input::get('month'));}}<br><br>
</div>

<div class='col-md-4'>
<h3>Select a Year</h3>

     {{ Form::selectYear('year', 2015, 1960)}}<br><br>
</div>

{{ Form::submit('Generate PDF', array('class' => 'btn btn-success')) }}

{{ Form::close() }}

<?php


require('fpdf.php');

class PDF extends FPDF
{
// Page header
function Header()
{
        
        $month = Session::get('month_query', 'default');
        $year = Session::get('year_query', 'default');
        $employee = Session::get('emp_query', 'default'); 
        $lname = Session::get('emp_lname', 'default');
        $fname = Session::get('emp_fname', 'default');
        $monthName = date("F", mktime(0, 0, 0, $month, 10));
        
    // Logo
    // Arial bold 15
    $this->SetFont('Arial','B',10);
	// Move to the right
    $this->Cell(80);
    // Title
    $this->Cell(20,10,'Daily Time Record','C');
    // Line break
    $this->Ln();
    $this->SetFont('Arial','',10);
    // Move to the right
    $this->Cell(55);
    // Title
    $this->Cell(20,10,$lname .', '. $fname,'C');    
    
    $this->Ln(2);

    $this->SetFont('Arial','',15);
    // Move to the right
    $this->Cell(52);
    // Title
    $this->Cell(20,10,'_______________________________','C');

    $this->Ln(5);

    $this->SetFont('Arial','',10);
    // Move to the right
    $this->Cell(90);
    // Title
    $this->Cell(20,10,'Name','C');

    $this->Ln(8);

    $this->SetFont('Arial','',11);
    // Move to the right
    $this->Cell(65);
    // Title
    $this->Cell(20,10,'For the month of ' . $monthName . ' ' . $year ,'C');

    $this->Ln(4);
    // Move to the right
    $this->Cell(61);
    // Title
    $this->Cell(20,10,'Official Hours of Arrival and Departure','C');
    $this->Ln();
}
                
function BasicTable($header)
    {
                $emp_id = Session::get('emp_query', 'default'); 
                $month = Session::get('month_query', 'default');
                $year = Session::get('year_query', 'default');
                $get_year = Session::get('year_query', 'default');
                $start_date = $year.'/'.$month.'/01';
                $end_date = $year.'/'.$month.'/31'; 
                
            
                $time_ins = DB::table('punches')
                    ->join('punchstatus', 'punches.id', '=', 'punchstatus.time_in_punch_id')
                    ->where('punches.employee_id', '=', $emp_id)
                    ->where('punchstatus.time_in', 'NOT like', 'Absent%')
                    ->get();

                $time_outs = DB::table('punches')
                    ->join('punchstatus', 'punches.id', '=', 'punchstatus.time_out_punch_id')
                    ->where('punches.employee_id', '=', $emp_id)
                    //->where('punchstatus.time_in', 'NOT like', 'Absent%')
                    ->get();
                $punch_days = DB::table('punchstatus')
                    ->select(DB::raw('DAY(date) as day, id'))
                    ->where('punchstatus.employee_id', '=', $emp_id)
                    //->where('punchstatus.time_in', 'NOT like', 'Absent%')
                    ->where( DB::raw('MONTH(punchstatus.date)'), '=', $month)
                    ->where( DB::raw('YEAR(punchstatus.date)'), '=', $get_year)
                    ->lists('day', 'id');
                    
                $this->Cell(50);
                foreach ($header as $col)
                {
                        if($col == 'Day')   
                            $this->Cell(10,5,$col,1,0,'L');
                        else if ($col == 'Arrival')
                            $this->Cell(20,5,$col,1,0,'L');
                        else if ($col == 'Status')
                            $this->Cell(20,5,$col,1,0,'L');
                        else if ($col == 'Departure')
                            $this->Cell(20,5,$col,1,0,'L');
                        else if ($col == 'Status')
                            $this->Cell(20,5,$col,1,0,'L');
                                                       
                }
                $this->Ln();
                $this->SetFont('Arial','',9); 


                for($date = 1; $date <= 31; $date++)
                {

                    $curr_date = $year.'-'.date("m", mktime(0, 0, 0, $month, $month)).'-'.date("d", mktime(0, 0, 0, $month, $date));
                    //dd($curr_date);
                    $this->Cell(50);
                    $this->Cell(10,5,$date,1,0,'L');

                    $hasTimeIn = false;
                    $hasStatusIn = false;
                    $hasTimeOut = false;
                    $hasStatusOut = false;

                    /*TIME-IN*/
                    foreach($time_ins as $time_in)
                    {   
                        if($curr_date == $time_in->date)
                        {
                            $this->Cell(20,5,$time_in->time,1,0,'L'); //time-in    
                            $hasTimeIn = true;
                            $this->Cell(20,5,$time_in->time_in,1,0,'L'); //time-in status
                            $hasStatusIn = true;
                        }
                    }
                    if($hasTimeIn == false)
                    {
                        $this->Cell(20,5,' ',1,0,'L'); //time-in    
                    }
                    if($hasStatusIn == false)
                    {
                        $this->Cell(20,5,' ',1,0,'L');   
                    }

                    /*TIME-OUT*/
                    foreach($time_outs as $time_out)
                    {   
                        if($curr_date == $time_out->date)
                        {
                            $this->Cell(20,5,$time_out->time,1,0,'L'); //time-out
                            $hasTimeOut = true;
                            $this->Cell(20,5,$time_out->time_out,1,0,'L'); //time-out status
                            $hasStatusOut = true;
                        }
                    }
                    if($hasTimeOut == false)
                    {
                        $this->Cell(20,5,' ',1,0,'L'); //time-out
                    }                    
                    if($hasStatusOut == false)
                    {
                        $this->Cell(20,5,' ',1,0,'L');   
                    }

                    $this->Ln();
                }
    }



// Page footer
function Footer()
{
    // Position at 1.5 cm from bottom
    $this->SetY(-15);
    // Arial italic 8
    $this->SetFont('Arial','I',8);
    // Page number
    $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
}

}
// Instanciation of inherited class
$employee = Session::get('emp_query', 'default'); 
$lname = Session::get('emp_lname', 'default');
$fname = Session::get('emp_fname', 'default');
        
$pdf = new PDF();
$header = array('Day', 'Arrival', 'Status', 'Departure', 'Status');
$pdf->AliasNbPages();
$pdf->SetFont('Arial','',9);
$pdf->AddPage();
$pdf->BasicTable($header);
$dynamic_name = $employee.$lname.$fname;
$filename='reports/'.$dynamic_name.'dtr.pdf';
$pdf->Output($filename);

?>

<br><br><iframe src="../reports/<?=$dynamic_name?>dtr.pdf" title="downloads"  height= "450" width="100%"  frameborder="0" margin-left= "100px" target="Message"></iframe>

<script type="text/javascript">
    $(function(){
    $(".dropdown").hover(            
            function() {
                $('.dropdown-menu', this).stop( true, true ).fadeIn("fast");
                $(this).toggleClass('open');
                $('b', this).toggleClass("caret caret-up");                
            },
            function() {
                $('.dropdown-menu', this).stop( true, true ).fadeOut("fast");
                $(this).toggleClass('open');
                $('b', this).toggleClass("caret caret-up");                
            });
    });
    
</script>

@stop