function subscribe()
{
	$.ajax({
url: 'index.php?route=extension/module/aridius_letters/add_email',
type: 'post',
data: 'email=' + $('#mail_letters').val(),
dataType: 'json',
success: function(data) {
			if (data['error']) {
				$('.textsuccess').remove();
				if (data['error']['email']) {
					$('.message_email').html('<span class="textdanger">'+data['error']['email']+'</span>').show();
				} else {
					$('.message_email').hide().empty();
				}
				if (data['error']['compare_email']) {
					$('.message_compare').html('<span class="textdanger">'+data['error']['compare_email']+'</span>').show();
				} else {
					$('.message_compare').hide().empty();
				}
			}
			if (data['success']) {
				$('.textdanger').remove();
				$('.message_success').html('<span class="textsuccess">'+data['success_email']+'</span>');
			}
		}
	});
	return false;
}