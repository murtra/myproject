/* ==========================================================================
   JS Scripts For Achieving Custom Functionalities On Certain Pages
   ========================================================================== */

/* Positioning Back to top Link
   ========================================================================== */
var setUpScrollingLink = function() {
	var length = $('.back-to-top').height() - $('.back-to-top a').height() + $('.back-to-top').offset().top;
	$('.back-to-top a').css('margin-top',$(window).height() - 100);

	$(window).scroll(function () {
		var scroll = $(this).scrollTop();
		var height = $('.back-to-top a').height() + 'px';

		if (scroll < $('.back-to-top').offset().top) {
			$('.back-to-top a').css({
				'position': 'absolute',
				'top': '0',
				'margin-top': $(window).height()-100
			});
		} else if (scroll > length-($(window).height()-100)) {
			$('.back-to-top a').css({
				'position': 'absolute',
				'bottom': '0',
				'top': 'auto',
				'margin-top': $(window).height()-100
			});
		} else {
			$('.back-to-top a').css({
				'position': 'fixed',
				'top': '0',
				'height': height
			});
		}
	});
	
	$('.back-to-top a').click(function(event) {
        event.preventDefault();
        $('html, body').animate({scrollTop: 0}, 400);
        return false;
    })
}