<div id="mailModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      </div>
      <div class="modal-body">
	<?php echo html_entity_decode($aridius_popupmail_img[$language_id]); ?>
<form action="#" method="post">
	<div class="mailletters input-group">
	  <input type="email" name="mail_letters_popup" id="mail_letters_popup" value="" placeholder="<?php echo $aridius_popupmail_placeholder[$language_id]; ?>" class="form-control input-lg" />
	  <span class="input-group-btn">
	  <button type="submit" class="btn btn-send btn-lg" onclick="return subscribe_popup();" ><span class="visible-xs"><i class="fa fa-envelope"></i></span> <span class="hidden-xs"><?php echo $aridius_popupmail_pl[$language_id]; ?></span></button>
	  </span>
	  <div class="message_email_popup"></div>	
      <div class="message_compare_popup"></div>	
	  <div class="message_success_popup"></div>	
	  	  <?php if ($aridius_popupmaildes_status == '1') { ?>	
<?php echo html_entity_decode($aridius_popupmail_description[$language_id]); ?>	
	  <?php } ?>	
	</div>
</form>
      </div>
    </div>
  </div>
</div>
<script>
// 1 min = 1000ms*60s*60min = 60000ms
$(function() {
  var dateModalShow = localStorage.getItem("dateModalShow");
  var currentDate = new Date().toString();
  var currentDate2 = new Date();
  var currentDay = currentDate2.getDay();
  var period = (((new Date(currentDate)).getTime())- ((new Date(dateModalShow)).getTime()))/60000;
  if ( ((dateModalShow==null) || (period><?php echo $aridius_popupmail_time; ?>))
  <?php if ($aridius_popupmail_day == '0') { ?>
	 && ((currentDay==0) || (currentDay==1) || (currentDay==2) || (currentDay==3) || (currentDay==4) || (currentDay==5) || (currentDay==6))
	<?php } elseif ($aridius_popupmail_day == '2') { ?>
	 && ((currentDay==1) || (currentDay==2) || (currentDay==3) || (currentDay==4) || (currentDay==5))
	<?php } elseif ($aridius_popupmail_day == '3') { ?>
     && ((currentDay==0) || (currentDay==6))
  <?php } ?>
  ) {
setTimeout(function(){	
    $("#mailModal").modal('show');
// save date open popup modal in LocalStorage
    localStorage.setItem("dateModalShow", currentDate);
},<?php echo $aridius_popupmail_delay; ?>*1000);	
  }
});
</script>