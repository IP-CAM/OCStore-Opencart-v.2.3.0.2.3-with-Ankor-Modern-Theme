<script type="text/javascript" src="catalog/view/theme/modern/js/jquery/owl-carousel/owl.carousel.min.js"></script>
<link href="catalog/view/theme/modern/js/jquery/owl-carousel/owl.carousel.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/modern/js/jquery/owl-carousel/owl.transitions.css" rel="stylesheet" type="text/css" />
<div class="pagcolor">
<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
  <?php if ($banner['description']) { ?>
    <div class="visible-md visible-lg"><?php echo htmlspecialchars_decode($banner['description']);?></div>
  <?php } ?>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive scaleslide" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive scaleslide" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
</div>
<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	<?php if ($transitionStyle != '0') { ?>	  
	transitionStyle : <?php if ($transitionStyle == '1') { ?>"fade",<?php } ?><?php if ($transitionStyle == '2') { ?>"fadeUp",<?php } ?><?php if ($transitionStyle == '3') { ?>"backSlide",<?php } ?><?php if ($transitionStyle == '4') { ?>"goDown",<?php } ?>		
    <?php } ?>	
	autoPlay: 5000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true,
	stopOnHover: true,
	addClassActive : true,
    <?php if ($banner['description']) { ?>	
	afterAction: function(){
	$('.owl-item').find('.text-slider1').removeClass('ef-slider1');
	$('.owl-item.active').find('.text-slider1').addClass('ef-slider1');
	$('.owl-item').find('.text-slider2').removeClass('ef-slider2');
	$('.owl-item.active').find('.text-slider2').addClass('ef-slider2');
	$('.owl-item').find('.text-slider3').removeClass('ef-slider3');
	$('.owl-item.active').find('.text-slider3').addClass('ef-slider3');
	$('.owl-item').find('.text-slider4').removeClass('ef-slider4');
	$('.owl-item.active').find('.text-slider4').addClass('ef-slider4');
	}
	<?php } ?>	
	});
--></script>