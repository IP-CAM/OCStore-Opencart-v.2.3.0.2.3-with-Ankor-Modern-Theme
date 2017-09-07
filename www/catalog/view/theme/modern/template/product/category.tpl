<?php echo $header; ?>
<div class="container" >
<div class="row">
<div id="cont" class="col-sm-12">
<?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
	<?php $class = 'col-sm-6'; ?>
	<?php } elseif ($column_left || $column_right) { ?>
	<?php $class = 'col-aridius'; ?>
	<?php } else { ?>
	<?php $class = 'col-sm-12'; ?>
	<?php } ?>
<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
<ul class="breadcrumb col-sm-12">
<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
	<li><?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { ?><?php echo $breadcrumb['text']; ?><?php } ?></li>
	<?php } ?>
</ul>
<h1 class="title_style col-sm-12"><?php echo $heading_title; ?></h1>
<?php if ($modern_description_top_or_bot !=1) { ?>
<?php if ($thumb || $description) { ?>
<div class="row desc-cat_top">
<?php if ($thumb) { ?>
<div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
<?php } ?>
<?php if ($description) { ?>
<?php if ($modern_description_length !=1 && strlen($description) > 2200 ) { 
if ($thumb) { ?><div class="col-sm-10"><?php } else { ?><div class="col-sm-12"><?php } ?>
<div class="block_desc">
<?php echo $description; ?>
</div>
<a class="button_sh"><?php echo $text_show_desc; ?></a>
</div>
<?php } else { 
if ($thumb) { ?><div class="col-sm-10"><?php } else { ?><div class="col-sm-12"><?php } ?><?php echo $description; ?></div>
<?php } ?>
<?php } ?>
</div>
<?php } ?>
	<?php } ?>
<?php if ($categories) { ?>
	<div class="col-sm-12">
	<hr>
	<div class="category2lv-center">
	<div class="row">
	<?php foreach ($categories as $category) { ?>
		<div class="cat_clear col-xs-4 col-sm-3 col-md-2 col-lg-2 catpr-all">
		<?php if ($modern_categories_2lv !=1 && (!empty($category['thumb']))) { ?>
			<a class="catpr" href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" class="img-responsive opacityhv" /></a>
			<?php } ?>
		<a class="catpr2" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
		</div>
		<?php } ?>
	</div>
	</div>
	</div>
	<?php } ?>
<?php if ($products) { ?>
	<div class="clearfix">	</div>
	<div class="col-sm-12 catfl">
	<div class="row">
	<div class="col-sm-3">
	<div class="btn-group hidden-xs">
	<button type="button" id="list-view" class="btn btn-default2" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
	<button type="button" id="grid-view" class="btn btn-default2" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
	</div>
	</div>
	<div class="col-sm-9">
	<div class="col-xs-12 col-sm-7 col-md-5 col-lg-4 navright">
	<?php if ($modern_sort_cat !=1) { ?>
		<div class="form-group input-group input-group-sm">
		<label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
		<select id="input-sort" class="form-control" onchange="location = this.value;">
		<?php foreach ($sorts as $sorts) { ?>
			<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
				<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
				<?php } ?>
			<?php } ?>
		</select>
		</div>
		<?php } ?>
	</div>
	<div class="col-xs-12 col-sm-5 col-md-4 col-lg-3 navright">
	<?php if ($modern_count_cat !=1) { ?>
		<div class="form-group input-group input-group-sm">
		<label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
		<select id="input-limit" class="form-control" onchange="location = this.value;">
		<?php foreach ($limits as $limits) { ?>
			<?php if ($limits['value'] == $limit) { ?>
				<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
				<?php } ?>
			<?php } ?>
		</select>
		</div>
		<?php } ?>
	</div>
	</div>
	</div>
	</div>
	<div class="row">
	<div class="col-xs-12">
	<?php foreach ($products as $key => $product) { ?>
		<div class="product-layoutcat product-list col-xs-12 ">
		<div class="product-layout2">
		<div class="product-thumb">
		<div id="imgCarousel-category<?php echo $key ?>" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner" role="listbox">
		<div class="item active">
		<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive center-add_img" /></a>
		</div>
		<?php $html = '';?>
		<?php $img_key = 1;?>
		<?php $html .= '<li data-target="#imgCarousel-category' . $key . '" data-slide-to="0" class="active"></li>'; ?>
		<?php foreach ($product['images'] as $image) { ?>
			<div class="item">
			<a href="<?php echo $product['href']; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive center-add_img" /></a>
			</div>
			<?php $html .= '<li data-target="#imgCarousel-category' . $key . '" data-slide-to="' . $img_key . '"></li>'; ?>
			<?php $img_key++ ;?>
			<?php } ?>
		<?php if ($img_key > 1) { ?>
			<ol class="carousel-indicators">
			<?php echo $html;?>
			</ol>
			</div>
			<a class="left carousel-control" href="#imgCarousel-category<?php echo $key ?>" role="button" data-slide="prev">
			<i class="fa fa-caret-left"></i>
			</a>
			<a class="right carousel-control" href="#imgCarousel-category<?php echo $key ?>" role="button" data-slide="next">
			<i class="fa fa-caret-right"></i>
			</a>
			<?php } else { ?>
			</div>
			<?php } ?>
		</div>
		<script>
		$('#imgCarousel-category<?php echo $key ?>').carousel({
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
		<div class="list_ch">
		<div class="caption">
		<div class="rating">
		<?php if ($modern_rating_cat !=1 && $product['rating']) { ?>
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
		<p class="desc_list"><?php echo $product['description']; ?></p>
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
		<div class="cart">
		<?php if ($product['quantity'] <= 0 && $aridiusinstock_status ) { ?>
			<button type="button" class="btn-instock" onclick="instock.add('<?php echo $product['product_id']; ?>');" data-product-id="<? echo $product['product_id']; ?>"><?php echo $button_instock; ?></button>
			<?php } else { ?>
			<button type="button" class="btn-cartpr" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
			<?php } ?>
		</div>
		<div class="effect-hover">
		<?php if ($modern_wishlist_cat !=1) { ?>
			<a class="wishlist" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-heart"></i></a>
			<?php } ?>
		<?php if ($modern_compare_cat !=1) { ?>
			<a class="compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-exchange"></i></a>
			<?php } ?>
		<?php if ($aridius_qckview_status) { ?>
			<a class="quickview" data-toggle="tooltip" title="<?php echo $button_quickview; ?>" onclick="quickview_open('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-search"></i></a>
			<?php } ?>
		</div>
		<?php if($product['attribute_groups'] && $modern_atribute !=1) { ?>
			<div class="atr_grid">
			<?php if($product['attribute_groups'] && $modern_atribute !=1 ) { ?>
				<div class="hrline">
				<hr>
				</div>
		<?php $v = 0 ?>
		<?php foreach($product['attribute_groups'] as $attribute_group) { ?>
			<?php foreach($attribute_group['attribute'] as $key => $attribute) { ?>
				<?php $v++; ?>
				<?php if($v > $modern_attribute_see) break; ?>
			<?php echo $attribute['name']; ?> - <?php echo $attribute['text']; ?> <?php if($v < $modern_attribute_see) { ?>  / <?php } ?>
				<?php } ?>
				<?php if($v > $modern_attribute_see) break; ?>
			<?php } ?>
				<?php } ?>
			</div>
			<?php } ?>
			<?php if($modern_description_cat !=1 ) { ?>
			<div class="hrline"><hr></div>
			<p class="description_cat"><?php echo $product['description']; ?></p>
			<?php } ?>
		</div>
		</div>
		</div>
		</div>
		</div>
		<?php } ?>
	</div>
	</div>
	<div class="row">
	<div class="col-sm-12">
	<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
	<div class="col-sm-6 text-right"><?php echo $results; ?></div>
	</div>
	</div>
	<?php } ?>
<?php if (!$categories && !$products) { ?>
	<p><?php echo $text_empty; ?></p>
	<div class="buttons">
	<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn-cart"><?php echo $button_continue; ?></a></div>
	</div>
	<?php } ?>
<br />
<?php if ($modern_description_top_or_bot !=0) { ?>
	<div class="row">
	<div class="col-sm-12">
<?php if ($thumb || $description) { ?>
<div class="row desc-cat_top">
<?php if ($thumb) { ?>
<div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
<?php } ?>
<?php if ($description) { ?>
<?php if ($modern_description_length !=1 && strlen($description) > 2200 ) { 
if ($thumb) { ?><div class="col-sm-10"><?php } else { ?><div class="col-sm-12"><?php } ?>
<div class="block_desc">
<?php echo $description; ?>
</div>
<a class="button_sh"><?php echo $text_show_desc; ?></a>
</div>
<?php } else { 
if ($thumb) { ?><div class="col-sm-10"><?php } else { ?><div class="col-sm-12"><?php } ?><?php echo $description; ?></div>
<?php } ?>
<?php } ?>
</div>
<?php } ?>
	</div>
	</div>
	<?php } ?>
<?php echo $content_bottom; ?></div></div>
<?php echo $column_right; ?></div>
</div>
<script>	
$(document).ready(function(){
    $('.button_sh').click(function(){
        $(this).toggleClass('active');
        $('.block_desc').toggleClass('opener');
        if (!$(this).data('status')) {
            $(this).data('status', true).html('<?php echo $text_hide_desc; ?>');
        } else {
            $(this).data('status', false).html('<?php echo $text_show_desc; ?>');
        }
    });
});	
</script>
<?php echo $footer; ?>