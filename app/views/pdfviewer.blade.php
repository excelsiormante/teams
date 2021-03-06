@extends("layout_employee")
@section("content")

<head>
    <title>Form | Time and Electronic Attendance Monitoring System</title>
</head>

<div class="col-md-12" style="margin-bottom:30px">
   <br><br><br> <h1>View Form</h1>

</div>

  @foreach($downloads as $download)
<div class="col-md-6">  
    <div class="col-md-12" style="padding:5px">
      <div class="col-md-4" >
          <img style = "height:100px; width:100px;" src="{{ URL::asset('img/Department.png') }}">
      </div>
      <div class="col-md-8" style="margin-left:0px">
       <p style="color:white; font-size:30px"> <strong>{{$download->file_name}}</strong></p>
        <a href="{{ URL::to('employee/downloads/') }}" onclick="" class="btn btn-warning">Return to Downloadable Forms</a>
       </div>
     </div>
     </div>
      <div class="col-md-6"></div>

<br><br>
  <div class="col-md-12">
     <hr style="display: block;
    margin-top: 0.5em;
    margin-bottom: 0.5em;
    margin-left: auto;
    margin-right: auto;
    border-style: inset;
    border-width: 1px;">
   
     <iframe src="../<?= $download->path ?>" title="downloads"  height= "450" width="100%"  frameborder="0" margin-left= "100px" target="Message"></iframe>
     </div>
    
   
     </div>
    @endforeach

     </div>
    </div>

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
