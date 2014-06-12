


$(document).ready(function() {

	$('.box').find('.other_info').hide();
	$('.quick_delete').hide();

	$('.quick_delete').on("mouseover", function() {
			var div = $(this).closest('.box');
			div.css("border", "none");
			$(this).on("mouseout", function() {
				$(this).closest('.box').css("border", "1px solid white");
			});
	});

	$('.box').on('mouseover', function() {
			$(this).find('.other_info').show();
			$(this).find('.quick_delete').show();
			$(this).find('.name_info').hide();

	});
	$('.box').on('mouseleave', function() {
			$(this).find('.other_info').hide();
			$(this).find('.quick_delete').hide();
			$(this).find('.name_info').fadeIn();
	});
	
});