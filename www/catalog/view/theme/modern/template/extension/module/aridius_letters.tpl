<form class="form_mail" action="#" method="post">
<div class="container">
<div class="row">
<div class="col-xs-offset-0 col-sm-offset-2 col-lg-offset-2 col-lg-8 col-md-9 col-sm-9 col-xs-12 all_mailblock">
<div class="inline_email hidden-xs"><img src="catalog/view/theme/modern/image/shablon/mail_letter.png" alt="Mail_pic" ></div>
<div class="inline_email head_letter"><?php echo $heading_title; ?></div>
	<div class="mailletters input-group">
	  <input type="email" name="mail_letters" id="mail_letters" value="" placeholder="<?php echo $aridius_letters_placeholder[$language_id]; ?>" class="form-control input-lg" />
	  <button type="submit" class="btn btn-send btn-lg button_email" onclick="return subscribe();" ><span class=""><?php echo $aridius_letters_pl[$language_id]; ?></span></button>
	</div>
	<div class="message_email"></div>	
      <div class="message_compare"></div>	
	  <div class="message_success"></div>
	  
	  			<?php if ($aridius_lettersdes_status == '1') { ?>	
<?php echo html_entity_decode($aridius_letters_description[$language_id]); ?>	
<?php } ?>	
	  
	</div>
	

	
	</div>
	

	</div>
	
</form>

	 	



