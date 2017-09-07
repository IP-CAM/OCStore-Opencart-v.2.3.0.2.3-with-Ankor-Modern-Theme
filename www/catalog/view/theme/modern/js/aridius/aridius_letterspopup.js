function subscribe_popup()
{
	$.ajax({
url: 'index.php?route=extension/module/aridius_popupmail/add_email',
type: 'post',
data: 'email=' + $('#mail_letters_popup').val(),
dataType: 'json',
success: function(data) {
			if (data['error']) {
				$('.textsuccess').remove();
				if (data['error']['email']) {
					$('.message_email_popup').html('<span class="textdanger">'+data['error']['email']+'</span>').show();
				} else {
					$('.message_email_popup').hide().empty();
				}
				if (data['error']['compare_email']) {
					$('.message_compare_popup').html('<span class="textdanger">'+data['error']['compare_email']+'</span>').show();
				} else {
					$('.message_compare_popup').hide().empty();
				}
			}
			if (data['success']) {
				setTimeout(function() {		
					$('#mailModal').modal('hide');
				}, 5500);	
				$('.textdanger').remove();
				$('.message_success_popup').html('<span class="textsuccess">'+data['success_email']+'</span>');
			}
		}
	});
	return false;
}
