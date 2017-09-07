<?php if ($colleft != 1 ) { ?>
	<hr><h3 class="title_h title_center"><?php echo $heading_title; ?></h3>
	<div class="padding-carusel row">
	<div id="viewed_carusel<?php echo $module; ?>" class="owl-carousel">
	<?php foreach ($products as $key => $product) { ?>
		<div class="product-layoutcatnew">
		<div class="border product-thumb">
		<div id="imgCarousel-viewed<?php echo $key ?>" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner" role="listbox">
		<div class="item active">
		<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive center-add_img" /></a>
		</div>
		<?php $html = '';?>
		<?php $img_key = 1;?>
		<?php $html .= '<li data-target="#imgCarousel-viewed' . $key . '" data-slide-to="0" class="active"></li>'; ?>
		<?php foreach ($product['images'] as $image) { ?>
			<div class="item">
			<a href="<?php echo $product['href']; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive center-add_img" /></a>
			</div>
			<?php $html .= '<li data-target="#imgCarousel-viewed' . $key . '" data-slide-to="' . $img_key . '"></li>'; ?>
			<?php $img_key++ ;?>
			<?php } ?>
		<?php if ($img_key > 1) { ?>
			<ol class="carousel-indicators">
			<?php echo $html;?>
			</ol>
			</div>
			<a class="left carousel-control" href="#imgCarousel-viewed<?php echo $key ?>" role="button" data-slide="prev">
			<i class="fa fa-caret-left"></i>
			</a>
			<a class="right carousel-control" href="#imgCarousel-viewed<?php echo $key ?>" role="button" data-slide="next">
			<i class="fa fa-caret-right"></i>
			</a>
			<?php } else { ?>
			</div>
			<?php } ?>
		</div>
		<script>
		$('#imgCarousel-viewed<?php echo $key ?>').carousel({
        interval: false
		})
		</script>
		<div class="positionsticker">
		<!-- special -->
		<?php if ($modern_sticker_sale_product_auto !=1 && $product['special'] && $product['price_sticker'] != 0) { ?>
			<?php  $percent = round(100 - ($product['special_sticker'] / $product['price_sticker']) * 100); ?>
			<div class="stickers-special">-<?php echo $percent; ?>%</div>
			<?php } ?>
		<!-- special END -->
		<!-- new -->
		<?php
		$startDate1 = strtotime(mb_substr($product['dateadded'], 0, 10));
		$endDate2 = strtotime(date("Y-m-d"));
		$days = ceil(($endDate2 / 86400)) - ceil(($startDate1 / 86400));
		?>
		<?php if($modern_sticker_new_product_auto !=1 && $days < $modern_sticker_product_new_day || $modern_sticker_new_product_auto !=0 && $product['stickers'] == 1) { ?>
			<div class="stickers-new"><?php echo $modern_name_sticker_product_new[$language_id]; ?></div>
			<?php } ?>
		<!-- new END -->
		<!-- top -->
		<?php if ($modern_sticker_top_product_auto !=1 && $modern_sticker_product_top_ratinr == 1 && $product['rating'] == $modern_sticker_product_top_rating || $modern_sticker_top_product_auto !=1 && $modern_sticker_product_top_ratinr == 2 && $product['viewed'] >  $modern_sticker_product_top_viewed || $modern_sticker_top_product_auto !=0 && $product['stickers'] == 2 ) { ?>
			<div class="stickers-top"><?php echo $modern_name_sticker_product_top[$language_id]; ?></div>
			<?php } ?>
		<!-- top END -->
		</div>
		<div>
		<div class="caption">
		<div class="rating">
		<?php if ($rat && $product['rating']) { ?>
			<?php for ($i = 1; $i <= 5; $i++) { ?>
				<?php if ($product['rating'] < $i) { ?>
					<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
					<?php } else { ?>
					<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
					<?php } ?>
				<?php } ?>
			<?php } ?>
		</div>
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
			<p class="price">
			<?php if (!$product['special']) { ?>
				<?php echo $product['price']; ?>
				<?php } else { ?>
				<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
				<?php } ?>
			<?php if ($product['tax']) { ?>
				<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
				<?php } ?>
			</p>
			<?php } ?>
		<?php if ($desc) { ?>
			<hr>
			<p class="description_cat"><?php echo $product['description']; ?></p>
			<?php } ?>
		<?php if($product['attribute_groups'] && $attribute) { ?>
			<hr>
			<div class="attribute_cat">
	<?php if($product['attribute_groups'] && $attribute) { ?>
		<hr>
		<div class="attribute_cat">
		<?php $v = 0 ?>
		<?php foreach($product['attribute_groups'] as $attribute_group) { ?>
			<?php foreach($attribute_group['attribute'] as $key => $attribute) { ?>
				<?php $v++; ?>
				<?php if($v > $modern_attribute_see) break; ?>
			<?php echo $attribute['name']; ?> - <?php echo $attribute['text']; ?> <?php if($v < $modern_attribute_see) { ?>  / <?php } ?>
				<?php } ?>
				<?php if($v > $modern_attribute_see) break; ?>
			<?php } ?>
		</div>
		<?php } ?>
			</div>
			<?php } ?>
		<div class="cart">
		<?php if ($product['quantity'] <= 0 && $aridiusinstock_status ) { ?>
			<button type="button" class="btn-instock" onclick="instock.add('<?php echo $product['product_id']; ?>');" data-product-id="<? echo $product['product_id']; ?>"><?php echo $button_instock; ?></button>
			<?php } else { ?>
			<button type="button" class="btn-cartpr" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
			<?php } ?>
		</div>
		<div class="effect-hover">
		<?php if ($wish) { ?>
			<a class="wishlist" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-heart"></i></a>
			<?php } ?>
		<?php if ($comp) { ?>
			<a class="compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-exchange"></i></a>
			<?php } ?>
		<?php if ($aridius_qckview_status) { ?>
			<a class="quickview" data-toggle="tooltip" title="<?php echo $button_quickview; ?>" onclick="quickview_open('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-search"></i></a>
			<?php } ?>
		</div>
		</div>
		</div>
		</div>
		</div>
		<?php } ?>
	</div>  </div>
<script>
$(document).ready(function() {
$('#viewed_carusel<?php echo $module; ?>').owlCarousel({
items: <?php echo $items; ?>,
itemsDesktop: [1599,4],
itemsDesktopSmall: [1199,3],
itemsTablet: [768,2],
itemsMobile: [479,1],
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
	<?php } else { ?>
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
	<?php } ?>