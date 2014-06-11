


$(document).ready(function() {


	//index page
	$('#user_name').focus();
	$('#message').hide();
	var d = new Date();

	$('#user_name').bind("enterKey",function(e){
   			$('#message').show(2000);
   			$(this).hide();
   			$('.question').hide();
   			$('.name').text($('#user_name').val());
		});
		$('#user_name').keyup(function(e){
		    if(e.keyCode == 13)
		    {
		        $(this).trigger("enterKey");
		    }
		});

	var month = d.getMonth()+1;
	var day = d.getDate();

	var output = d.getFullYear() + '/' +
    (month<10 ? '0' : '') + month + '/' +
    (day<10 ? '0' : '') + day;

    $('.date').text(output);
    $('h1').on("load", function() {

    	$(this).fadeIn(3000);
    });

	var num = 75;
	$( "#progressbar").progressbar({
		  value: num
		});



	
});