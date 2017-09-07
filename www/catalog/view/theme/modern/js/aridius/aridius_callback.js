$(document).ready(function() {
	$(document).on("click touchstart", "#call-order-submit", function (e) {
		$('.mfp-content').append('<div class="loader"><div class="bag_quickview"></div></div>');
		$.ajax({
url: 'index.php?route=extension/module/aridiuscallback/write',
type: 'post',
dataType: 'json',
data: $('input[name=\'aridiuscallback_contact\'],input[name=\'aridiuscallback_firstname\'],input[name=\'aridiuscallback_email\'],input[name=\'aridiuscallback_timein\'],input[name=\'aridiuscallback_timeoff\'],textarea[name=\'aridiuscallback_comment\']'),
success: function (data) {
				if (data['error']) {
					$("div.loader").remove();
					$('.aridiuscallback .error').remove();
					if (data['error']['firstname']) {
						$('.aridiuscallback_errorfirstname').html('<span class="text-danger">'+data['error']['firstname']+'</span>').show();
					} else {
						$('.aridiuscallback_errorfirstname').hide().empty();
					}
					if (data['error']['contact']) {
						$('.aridiuscallback_errorcontact').html('<span class="text-danger">'+data['error']['contact']+'</span>').show();
					} else {
						$('.aridiuscallback_errorcontact').hide().empty();
					}
					if (data['error']['email']) {
						$('.aridiuscallback_erroremail').html('<span class="text-danger">'+data['error']['email']+'</span>').show();
					} else {
						$('.aridiuscallback_erroremail').hide().empty();
					}
				}
				if (data['success']) {
					$("div.loader").remove();
					setTimeout(function() {
						$.magnificPopup.close();
					}, 5500);
					$.magnificPopup.open({
items: {
src: 'index.php?route=extension/module/aridiuscallback/success'
						},
type: 'ajax'
					});
				}
			}
		});
	});
	$('.call-order').bind('click', function(){
		$.magnificPopup.close();
		$.magnificPopup.open({
items: {
src: 'index.php?route=extension/module/aridiuscallback/getForm'
			},
type: 'ajax'
		});
	});

});
