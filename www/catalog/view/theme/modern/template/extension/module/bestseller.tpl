<h3 class="title_h title_center"><?php echo $heading_title; ?></h3>
<div class="row">
<?php foreach ($products as $product) { ?>
	<div class="product-layout changebr  col-lg-3 col-md-3 col-sm-6 col-xs-12">
	<div class="product-thumbleft transition">
	<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
<div class="positionsticker">
<!-- special -->
<?php if ($modern_sticker_sale_product_auto !=1 && $product['special'] && $product['price_sticker'] != 0) { ?>
<?php  $percent = round(100 - ($product['special_sticker'] / $product['price_sticker']) * 100); ?>
<div class="stickers-special"><span class="diamont_st">-<?php echo $percent; ?>%</span></div>
<?php } ?>
<!-- special END -->
<!-- new -->	
<?php
$startDate1 = strtotime(mb_substr($product['dateadded'], 0, 10));
$endDate2 = strtotime(date("Y-m-d"));
$days = ceil(($endDate2 / 86400)) - ceil(($startDate1 / 86400));
?>
<?php if($modern_sticker_new_product_auto !=1 && $days < $modern_sticker_product_new_day || $modern_sticker_new_product_auto !=0 && $product['stickers'] == 1) { ?>
<div class="stickers-new"><span class="diamont_st"><?php echo $modern_name_sticker_product_new[$language_id]; ?></span></div>
<?php } ?>
<!-- new END -->	
<!-- top -->
<?php if ($modern_sticker_top_product_auto !=1 && $modern_sticker_product_top_ratinr == 1 && $product['rating'] == $modern_sticker_product_top_rating || $modern_sticker_top_product_auto !=1 && $modern_sticker_product_top_ratinr == 2 && $product['viewed'] >  $modern_sticker_product_top_viewed || $modern_sticker_top_product_auto !=0 && $product['stickers'] == 2 ) { ?> 
<div class="stickers-top"><span class="diamont_st"><?php echo $modern_name_sticker_product_top[$language_id]; ?></span></div>
<?php } ?>
<!-- top END -->
</div>
	<div class="caption sixe_price">
	<h4><a href="<?php echo $product['href']; ?>">
	<?php  
	if( strlen($product['name'] ) < $modern_limit_symbolst) { 
		echo $product['name']; 
	} 
	else {
		echo mb_substr( $product['name'],0,$modern_limit_symbolst,'utf-8' )."..."; } 
	?>
	</a></h4>
	<?php if ($product['price']) { ?>
		<?php if (!$product['special']) { ?>
			<p class="price" >
			<?php echo $product['price']; ?>
			<?php } else { ?>
			<p class="price pr_bottom">
			<span class="price-new"><?php echo $product['special']; ?></span><br /> <span class="price-old"><?php echo $product['price']; ?></span>
			<?php } ?>
		<?php if ($product['tax']) { ?>
			<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
			<?php } ?>
		</p>
		<?php } ?>
	</div>
	<div class="cart">
	<button type="button" class="btn-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
	</div>
	</div>
	</div>
	<?php } ?>
</div>