<?php echo $content_mail; ?>
<?php if ($modern_show_logo_footer !=1 || $modern_show_itext_footer !=1) { ?>
	<div class="footer">
	<div class="container">
	<div class="row">
	<?php if ($modern_show_logo_footer !=1) { ?>
		<div class="col-sm-12">
		<div id="logo_footer">
		<?php if ($logo) { ?>
			<img src="<?php echo $footer_logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
			<?php } ?>
		</div>
		</div>
		<?php } ?>
		<?php if ($modern_show_itext_footer !=1 && $home == $og_url) { ?>
		<div class="col-xs-12 text_cent">
		<div class="footer_h5"><?php echo $text_footer_aboutus; ?></div>
		<div class="aboutus_footer">
		<?php echo html_entity_decode($modern_description[$language_id]); ?>
		</div>
		</div>
		<?php } ?>
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text_cent copyrightf">
	<?php echo html_entity_decode($modern_license_text[$language_id]); ?>
	</div>
	</div>
	</div>
	</div>
	<?php } ?>
<?php if ($modern_show_fluid_map_footer == '0') { ?>
	<div  id="map123">
	<a class="img_map"><img  class="img-responsive img_map2" alt="marker" title="marker" src="catalog/view/theme/modern/image/shablon/map_icon.png" ><span class="text_map"><?php echo $text_footer_map; ?></span></a>
	<div id="map-canvas2" >
	<?php if ($modern_show_contactblock == '0') { ?>
		<div class="block-contacts2 ">
		</div>
		<div class="container footer_cont">
		<div class="block-contacts ">
		<div class="info-block">
		<div class="footer_contacts">
		<?php echo $text_footer_contacts; ?>
		</div>
		<ul class="fa-ul">
		<?php if (!empty($modern_telephone_footer[$language_id])) { ?>
			<li><i class="fa-li fa fa-phone"></i><a href="tel:<?php echo $modern_telephone_footer[$language_id]; ?>"><?php echo $modern_telephone_footer[$language_id]; ?></a></li>
			<?php } ?>
		<?php if (!empty($modern_telephone1_footer[$language_id])) { ?>
			<li><i class="fa-li fa fa-phone"></i><a href="tel:<?php echo $modern_telephone1_footer[$language_id]; ?>"><?php echo $modern_telephone1_footer[$language_id]; ?></a></li>
			<?php } ?>
		<?php if (!empty($modern_telephone2_footer[$language_id])) { ?>
			<li><i class="fa-li fa fa-phone"></i><a href="tel:<?php echo $modern_telephone2_footer[$language_id]; ?>"><?php echo $modern_telephone2_footer[$language_id]; ?></a></li>
			<?php } ?>
		<?php if (!empty($modern_skype_footer[$language_id])) { ?>
			<li><i class="fa-li fa fa-skype"></i><a href="callto:<?php echo $modern_skype_footer[$language_id]; ?>"><?php echo $modern_skype_footer[$language_id]; ?></a></li>
			<?php } ?>
		<?php if (!empty($modern_mail_footer[$language_id])) { ?>
			<li><i class="fa-li fa fa-envelope-o "></i><a onClick="javascript:window.open('mailto:<?php echo $modern_mail_footer[$language_id];?>', 'Mail');event.preventDefault()" href="<?php echo $modern_mail_footer[$language_id];?>"><?php echo $modern_mail_footer[$language_id];?></a></li>
			<?php } ?>
		<?php if (!empty($modern_addres_footer[$language_id])) { ?>
			<li class="li_top"><i class="fa-li fa fa-home launch-show"></i><?php echo $modern_addres_footer[$language_id];?></li>
			<?php } ?>
		<?php if (!empty($modern_time_footer[$language_id])) { ?>
			<li><i class="fa-li fa fa-check-circle-o "></i><?php echo $modern_time_footer[$language_id]; ?></li>
			<?php } ?>
		</ul>
		</div>
		</div>
		</div>
		<?php } ?>
	</div>
	<div class="filter_map">
	<div id="map_canvas" class="mapc_footer"></div>
	</div>
	</div>
	<?php } ?>
<footer class="footer">
<div class="container">
<!--<div class="row line_foot">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
<h5><?php echo $text_information; ?></h5>
<ul class="list-unstyled">
<?php foreach ($informations as $information) { ?>
	<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
	<?php } ?>
</ul>
</div>
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
<h5><?php echo $text_service; ?></h5>
<ul class="list-unstyled">
<?php if ($modern_sitemap_footer !=1) { ?><li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li><?php } ?>
<?php if ($modern_return_footer !=1) { ?><li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li><?php } ?>
<?php if ($modern_contact_footer !=1) { ?><li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li><?php } ?>
</ul>
</div>
<div class="clearfix visible-xs"></div>
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
<h5><?php echo $text_account; ?></h5>
<ul class="list-unstyled">
<?php if ($modern_account_footer !=1) { ?><li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li><?php } ?>
<?php if ($modern_order_footer !=1) { ?><li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li><?php } ?>
<?php if ($modern_wishlist_footer !=1) { ?><li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li><?php } ?>
<?php if ($modern_newsletter_footer !=1) { ?><li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li><?php } ?>
</ul>
</div>
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
<h5><?php echo $text_extra; ?></h5>
<ul class="list-unstyled" >
<?php if ($modern_manufacturer_footer !=1) { ?><li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li><?php } ?>
<?php if ($modern_voucher_footer !=1) { ?><li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li><?php } ?>
<?php if ($modern_affiliate_footer !=1) { ?><li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li><?php } ?>
<?php if ($modern_special_footer !=1) { ?> <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li><?php } ?>
</ul>
</div>
<div class="clearfix visible-xs"></div>
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
<?php if ($modern_top_links2 ) { ?>
	<div class="footer_add">
	<div class="footer_socialpay"><?php echo $text_footer_social; ?></div>
	<div class="setifooter_ico">
	<?php foreach ($modern_top_links2 as $modern_top_link2) { ?>
		<a <?php if ($modern_top_link2['link_top']) { ?> href="<?php echo $modern_top_link2['link_top']; ?>" target="_blank" <?php } ?>><div data-toggle="tooltip" title="<?php echo $modern_top_link2['tooltipseti']; ?>" class="setifooter"><i class="diamont_seti <?php echo $modern_top_link2['faicons_top']; ?>"></i></div></a>
		<?php } ?>
	</div>
	</div>
	<?php } ?>
<div class="clearfix"></div>
<?php if (!empty($footer_pay)) { ?>
	<div class="footer_socialpay"><?php echo $text_footer_pay; ?></div>
	<img class="img-responsive rigimg" alt="payment" title="payment" src="<?php echo $footer_pay; ?>">
	<?php } ?>
</div>
<div class="clearfix"></div>
<span class="col-sm-12 counter-footer">
<?php echo html_entity_decode($modern_counter); ?>
</span>
<div class="clearfix"></div>
</div>-->
    <div class="footer_copyright"> <br><br>
        <div class="footer_copyright_1">© 2017, АНКОР КРЫМ</div>
	    <div class="footer_copyright_2">Все права защищены </div>
    </div>  <br>
	<div class="footer_desinger">Сайт разработан и поддерживается "Место для лого WEDO"</div> <br>
</div>
</footer>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->
<!--код tooltip-->
<script type="text/javascript"><!--
$(document).ready(function(){
$(".tooltip-examples a").tooltip();
$(".tooltip-examples button").tooltip();
});
//--></script>
<?php if ($modern_show_fluid_map_footer == '0') { ?>
<script src="https://maps.googleapis.com/maps/api/js?key=<?php echo $modern_fluid_map_key; ?>" type="text/javascript"></script>
<script type="text/javascript"><!--
function initialize() {
var latlng = new google.maps.LatLng(<?php echo $modern_latitude_fluid_map[$language_id]; ?>, <?php echo $modern_longitude_fluid_map[$language_id]; ?>);
var settings = {
zoom: <?php echo $modern_fluid_map_zoom; ?>,
center: {lat: -13, lng: 121},
center: latlng,
zoomControl: true,
scrollwheel: false,
mapTypeControl: false,
navigationControl: true,
navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
mapTypeId: google.maps.MapTypeId.ROADMAP,
streetViewControlOptions: {
position: google.maps.ControlPosition.BOTTOM_CENTER
},
zoomControlOptions: {
position: google.maps.ControlPosition.BOTTOM_CENTER
},
};
var map = new google.maps.Map(document.getElementById("map_canvas"), settings);
var contentString = '<div id="content">'+
'<div id="siteNotice">'+
'</div>'+
'<div id="bodyContent">'+
'<?php echo html_entity_decode($modern_description_map_logo[$language_id]); ?>'+
'</div>'+
'</div>';
var infowindow = new google.maps.InfoWindow({
content: contentString
});
var companyImage = new google.maps.MarkerImage('<?php echo $map_img; ?>',
new google.maps.Size(80,80),
new google.maps.Point(0,0),
new google.maps.Point(50,50)
);
var companyMarker = new google.maps.Marker({
position: latlng,
map: map,
icon: companyImage,
zIndex: 3});
<?php if ($modern_show_info_marker_block !=1) { ?>
google.maps.event.addListener(companyMarker, 'mouseover', function() {
infowindow.open(map,companyMarker);
});
<?php } ?>
}
google.maps.event.addDomListener(window, 'load', initialize);
//--></script>
<?php } ?>
<script>
var speed=1000,
originalHeight=50,
hoverHeight=320;
function map_slide() {
if ($(window).width() < 750) {
$('#map123').css({height:hoverHeight});
$('*').removeClass('filter_map');
$('*').remove('.img_map');
$('*').remove('.block-contacts2');
} else {
$('.img_map').click(function(){
$('#map123').stop().animate({height:hoverHeight},speed);
$('*').removeClass('filter_map');
$('*').remove('.img_map');
$('*').remove('.block-contacts2');
var height= $("body").height();
$("html,body").animate({"scrollTop":height},speed);
});
$('.footer_contacts').click(function(){
$('#map123').stop().animate({height:hoverHeight},speed);
$('*').removeClass('filter_map');
$('*').remove('.img_map');
$('*').remove('.block-contacts2');
var height= $("body").height();
$("html,body").animate({"scrollTop":height},speed);
});
}
}
map_slide();
$(window).resize(map_slide);
</script>
</body></html>