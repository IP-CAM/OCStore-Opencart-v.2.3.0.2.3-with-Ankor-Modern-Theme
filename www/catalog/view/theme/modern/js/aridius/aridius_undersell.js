$(document).ready(function() {
$(document).on("click touchstart", "#undersell-order-submit", function (e) {
	$('.mfp-content').append('<div class="loader"><div class="bag_quickview"></div></div>');
		$.ajax({
			url: 'index.php?route=extension/module/aridiusundersell/write',
			type: 'post',
			dataType: 'json',
			data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea,input[name=\'aridiusundersell_contact\'],input[name=\'aridiusundersell_firstname\'],input[name=\'aridiusundersell_email\'],textarea[name=\'aridiusundersell_comment\'],input[name=\'aridiusundersell_link\'],input[name=\'fo_total_price\']'),			
			success: function (data) {
				if (data['error']) {
					$("div.loader").remove();
					$('.aridiusundersell .error').remove();
					if (data['error']['firstname']) {
						$('.aridiusundersell_errorfirstname').html('<span class="text-danger">'+data['error']['firstname']+'</span>').show();
					} else {
                   $('.aridiusundersell_errorfirstname').hide().empty();
                           }
					if (data['error']['quantity']) {
						$('.aridiusundersell_errorquantity').html('<span class="text-danger">'+data['error']['quantity']+'</span>').show();
					} else {
                   $('.aridiusundersell_errorquantity').hide().empty();
                           }
					if (data['error']['contact']) {
						$('.aridiusundersell_errorcontact').html('<span class="text-danger">'+data['error']['contact']+'</span>').show();
					} else {
                   $('.aridiusundersell_errorcontact').hide().empty();
                           }
					if (data['error']['email']) {
						$('.aridiusundersell_erroremail').html('<span class="text-danger">'+data['error']['email']+'</span>').show();
					} else {
                   $('.aridiusundersell_erroremail').hide().empty();
                           }
					if (data['error']['link']) {
						$('.aridiusundersell_errorlink').html('<span class="text-danger">'+data['error']['link']+'</span>').show();
					} else {
                   $('.aridiusundersell_errorlink').hide().empty();
                           }
				}
				if (data['success']) {
				    $("div.loader").remove();
						setTimeout(function() {		
					$.magnificPopup.close();
						 }, 5500);	
					$.magnificPopup.open({
				  items: {
					src: 'index.php?route=extension/module/aridiusundersell/success'
				  },
				  type: 'ajax'
				});
				}
			}
		});
	});
$('#undersell-order').on('click', function() {
	$.ajax({
		url: 'index.php?route=extension/module/aridiusundersell/validOrder',
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
				var formated_special=$('.autocalc-product-special').html();
				if (typeof formated_special == 'undefined'){
					formated_special=$('.autocalc-product-price').html();
				}
					var formated_price=$('.autocalc-product-price').html();
				if (typeof formated_price == 'undefined'){
					formated_price=$('.autocalc-product-special').html();
				}
				$.magnificPopup.open({
				  items: {
					src: 'index.php?route=extension/module/aridiusundersell/getForm&product_id='+$('input[name=product_id]').val()+'&formated_special='+formated_special+'&quantity='+$('input[name=quantity]').val()+'&formated_price='+formated_price+'&quantity='+$('input[name=quantity]').val()
				  },
				  type: 'ajax'
				});
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
});