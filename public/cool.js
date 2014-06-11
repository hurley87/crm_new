


$(document).ready(function() {

	$('.box').find('.other_info').hide();

	$('.quick_delete').on("mouseover", function() {
			var div = $(this).closest('.box');
			div.css("border", "none");
			$(this).on("mouseout", function() {
				$(this).closest('.box').css("border", "1px solid white");
			});
	});

	$('.box').on('mouseover', function() {
			$(this).find('.other_info').show(500);
	});
	$('.box').on('mouseleave', function() {
			$(this).find('.other_info').hide(500);
	});
	
});