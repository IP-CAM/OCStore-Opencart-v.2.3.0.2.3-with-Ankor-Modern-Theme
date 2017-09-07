$(document).ready(function() {
	$(document).on("click touchstart", "#fast-order-submit", function (e) {
		$('.mfp-content').append('<div class="loader"><div class="bag_quickview"></div></div>');
		$.ajax({
url: 'index.php?route=extension/module/aridiusfastorder/write',
type: 'post',
dataType: 'json',
data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea,input[name=\'aridiusfastorder_contact\'],input[name=\'aridiusfastorder_firstname\'],input[name=\'aridiusfastorder_email\'],textarea[name=\'aridiusfastorder_comment\'],input[name=\'fo_total_price\']'),
success: function (data) {
				if (data['error']) {
					$("div.loader").remove();
					$('.aridiusfastorder .error').remove();
					if (data['error']['firstname']) {
						$('.aridiusfastorder_errorfirstname').html('<span class="text-danger">'+data['error']['firstname']+'</span>').show();
					} else {
						$('.aridiusfastorder_errorfirstname').hide().empty();
					}
					if (data['error']['quantity']) {
						$('.aridiusfastorder_errorquantity').html('<span class="text-danger">'+data['error']['quantity']+'</span>').show();
					} else {
						$('.aridiusfastorder_errorquantity').hide().empty();
					}
					if (data['error']['contact']) {
						$('.aridiusfastorder_errorcontact').html('<span class="text-danger">'+data['error']['contact']+'</span>').show();
					} else {
						$('.aridiusfastorder_errorcontact').hide().empty();
					}
					if (data['error']['email']) {
						$('.aridiusfastorder_erroremail').html('<span class="text-danger">'+data['error']['email']+'</span>').show();
					} else {
						$('.aridiusfastorder_erroremail').hide().empty();
					}
				}
				if (data['success']) {
					$("div.loader").remove();
					setTimeout(function() {
						$.magnificPopup.close();
					}, 5500);
					$.magnificPopup.open({
items: {
src: 'index.php?route=extension/module/aridiusfastorder/success'
						},
type: 'ajax'
					});
				}
			}
		});
	});
	$('#fast-order').on('click', function() {
		$.ajax({
url: 'index.php?route=extension/module/aridiusfastorder/validOrder',
type: 'post',
data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
dataType: 'json',
beforeSend: function() {
				$('#fast-order').button('loading');
			},
complete: function() {
				$('#fast-order').button('reset');
			},
success: function(json) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');
				if (json['error']) {
					if (json['error']['option']) {
						for (i in json['error']['option']) {
							var element = $('#input-option' + i.replace('_', '-'));
							if (element.parent().hasClass('input-group')) {
								element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
							} else {
								element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
							}
						}
					}
					if (json['error']['recurring']) {
						$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
					}
					$('.text-danger').parent().addClass('has-error');
				}
				if (json['success']) {
					var formated_special=$('.autocalc-product-special').html();
					if (typeof formated_special == 'undefined'){
						formated_special=$('.autocalc-product-price').html();
					}
					var formated_price=$('.autocalc-product-price').html();
					if (typeof formated_price == 'undefined'){
						formated_price=$('.autocalc-product-special').html();
					}
					$.magnificPopup.close();
					$.magnificPopup.open({
items: {
src: 'index.php?route=extension/module/aridiusfastorder/getForm&product_id='+$('input[name=product_id]').val()+'&formated_special='+formated_special+'&quantity='+$('input[name=quantity]').val()+'&formated_price='+formated_price+'&quantity='+$('input[name=quantity]').val()
						},
type: 'ajax'
					});
				}
			},
error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});