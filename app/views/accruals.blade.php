@extends("layout_employee")
@section("content")

	<br><br><br>
	<div class = "container">
		<div class = "row">
			<div class = "col-md-1" style = "margin-top:20px;">
				<img src="{{ URL::asset('img/home.png') }}">
			</div>
			<div class = "col-md-9" >
				<h1 style = "color:white;">Accrual Balance</h1>
			</div>
		</div>

		<br>
		<br>
			<div id="raleway" class="row">

				
			<table class = "table table-bordered">
				<thead>
					<td style="color:white">Accrual Account</td>
					<td style="color:white">Balance (Hours)</td>
				</thead>

				<tr>
					<td style="color:white">Vacation Leave</td>
					<td style="color:white">8</td>
				</tr>
				<tr>
					<td style="color:white">Sick Leave</td>
					<td style="color:white">24</td>
				</tr>
			</table>

		</div>


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