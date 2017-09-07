$(document).on("click touchstart", "#instock-order-submit", function (e) {
	$('.mfp-content').append('<div class="loader"><div class="bag_quickview"></div></div>');
	var product_id = $(this).data('productId');
	var aridiusinstock_contact = $("input[name=aridiusinstock_contact]").val();
	var aridiusinstock_firstname = $("input[name=aridiusinstock_firstname]").val();
	var aridiusinstock_email = $("input[name=aridiusinstock_email]").val();
	$.ajax({
url: 'index.php?route=extension/module/aridiusinstock/write',
type: 'post',
dataType: 'json',
data: {product_id:product_id,aridiusinstock_contact:aridiusinstock_contact,aridiusinstock_firstname:aridiusinstock_firstname,aridiusinstock_email:aridiusinstock_email},
success: function (data) {
			if (data['error']) {
				$("div.loader").remove();
				$('.aridiusinstock .error').remove();
				if (data['error']['firstname']) {
					$('.aridiusinstock_errorfirstname').html('<span class="text-danger">'+data['error']['firstname']+'</span>').show();
				} else {
					$('.aridiusinstock_errorfirstname').hide().empty();
				}
				if (data['error']['contact']) {
					$('.aridiusinstock_errorcontact').html('<span class="text-danger">'+data['error']['contact']+'</span>').show();
				} else {
					$('.aridiusinstock_errorcontact').hide().empty();
				}
				if (data['error']['email']) {
					$('.aridiusinstock_erroremail').html('<span class="text-danger">'+data['error']['email']+'</span>').show();
				} else {
					$('.aridiusinstock_erroremail').hide().empty();
				}
			}
			if (data['success']) {
				$("div.loader").remove();
				setTimeout(function() {
					$.magnificPopup.close();
				}, 5500);
				$.magnificPopup.open({
items: {
src: 'index.php?route=extension/module/aridiusinstock/success'
					},
type: 'ajax'
				});
			}
		}
	});
});

var instock = {
	'add': function(product_id) {
		$.ajax({
url: 'index.php?route=extension/module/aridiusinstock/validOrder',
type: 'post',
data: 'product_id=' + product_id,
dataType: 'json',
success: function(json) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');
				$.magnificPopup.close(); 
				$.magnificPopup.open({
items: {
src: 'index.php?route=extension/module/aridiusinstock/getForm&product_id='+ product_id
					},
type: 'ajax'
				});
			},
error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function() {
	}
}
