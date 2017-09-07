<hr>
<h3 class="title_h title_center"><?php echo $heading_title; ?></h3>
<div class="padding-carusel row">
<div id="rev_carusel<?php echo $module; ?>" class="owl-carousel">
<?php foreach ($products as $product) { ?>
	<div class="product-layout_rew">
	<div class="product-thumb_rew transition">
	<div class="image prrewiev"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
	<div class="caption">
	<h4><a href="<?php echo $product['href']; ?>">
	<?php
	if( strlen($product['name'] ) < $modern_limit_symbolst) {
		echo $product['name'];
	}
	else {
		echo mb_substr( $product['name'],0,$modern_limit_symbolst,'utf-8' )."..."; }
	?>
	</a></h4>
	<?php if ($rat) { ?>
		<div class="rew rating">
		<?php for ($i = 1; $i <= 5; $i++) { ?>
			<?php if ($product['rating'] < $i) { ?>
				<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
				<?php } else { ?>
				<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
				<?php } ?>
			<?php } ?>
		</div>
		<?php } ?>
	<p class = "text-color"><?php echo $product['text']; ?></p>
	</div>
	</div>
	</div>
	<?php } ?>
</div>  </div>
<script>
$(document).ready(function() {
$('#rev_carusel<?php echo $module; ?>').owlCarousel({
items : <?php echo $items; ?>,
itemsDesktop : [1600,3], //3 изображений на ширину между 1201px
itemsDesktopSmall : [1200,2], // 2 изображения между 781px и 1200px
itemsTablet: [780,1], //1 изображения между 0 и 780;
<?php if ($items == '1') { ?>
itemsTablet: [1199,1],
<?php } ?>
autoPlay: <?php echo $autoplay; ?>,
<?php if ($navigation) { ?>
navigation: true,
<?php } ?>
<?php if (!$pagination) { ?>
pagination: false,
<?php } ?>
navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
<?php if ($stophover) { ?>
stopOnHover: true,
<?php } ?>
paginationSpeed: <?php echo $pag_speed; ?>,
rewindSpeed: <?php echo $rew_speed; ?>
});
});
</script>