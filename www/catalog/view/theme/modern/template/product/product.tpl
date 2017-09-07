<?php echo $header; ?>
<div class="container">
<div class="row">
<div id="cont" class="col-sm-12" itemscope itemtype="http://schema.org/Product">
<?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
	<?php $class = 'col-sm-6'; ?>
	<?php } elseif ($column_left || $column_right) { ?>
	<?php $class = 'col-aridius'; ?>
	<?php } else { ?>
	<?php $class = 'col-sm-12'; ?>
	<?php } ?>
<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
<ul class="breadcrumb" itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
	<li><?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url" ><?php echo $breadcrumb['text']; ?></a><?php } else { ?><span itemprop="title"><?php echo $breadcrumb['text']; ?></span><?php } ?></li>
	<?php } ?>
</ul>
<h1 class="title_h title_center" itemprop="name"><?php echo $heading_title; ?></h1>
<ul class="nav nav-tabs tabs-aridius mod fixzoom">
<li class="active col-xs-12 tab_padding"><a data-toggle="tab" href="#product_tab"><?php echo $tab_description; ?> <i class="fa fa-caret-down hidden"></i></a></li>
<?php if ($attribute_groups) { ?>
	<li class="col-xs-12 tab_padding"><a data-toggle="tab" href="#attribute_tab"><?php echo $tab_attribute; ?> <i class="fa fa-caret-down hidden"></i></a></li>
	<?php } ?>
<?php if ($review_status) { ?>
	<li class="col-xs-12 tab_padding"><a data-toggle="tab" href="#review_tab"><?php echo $tab_review; ?> <i class="fa fa-caret-down hidden"></i></a></li>
	<?php } ?>
<?php if ($products) { ?>
	<li class="col-xs-12 tab_padding"><a data-toggle="tab" href="#accessories_tab"><?php echo $text_related; ?> <i class="fa fa-caret-down hidden"></i></a></li>
	<?php } ?>
<!-- custom_tabs -->
<?php if ($custom_tabs) { ?>
<?php foreach ($custom_tabs as $key => $custom_tab) { ?>
<?php if ($custom_tab['title']) { ?><li class="col-xs-12 tab_padding"><a href="#custom_tabs-<?php echo $key?>" data-toggle="tab"><?php echo $custom_tab['title']; ?></a></li><?php } ?>
<?php } ?>
<?php } ?>	
<!-- custom_tabs -->
<?php if ($modern_top_links7 ) { ?>
<?php foreach ($modern_top_links7 as $key => $modern_top_link7) { ?>
<?php if ($modern_top_link7['title'][$language_id]) { ?> <li class="col-xs-12 tab_padding"><a href="#other_tab-<?php echo $key ?>" data-toggle="tab"><?php echo $modern_top_link7['title'][$language_id]; ?> <i class="fa fa-caret-down hidden"></i></a></li><?php } ?>
<?php } ?>
<?php } ?>
<!-- custom_tabs -->
</ul>
<div class="tab-content">
<div id="product_tab" class="tab-pane fade in active">
<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
<div class="row">
<?php if (($column_left || $column_right) && ($modern_top_links9)) { ?>
	<?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12 thumbnails-fix'; ?>
	<?php } else { ?>
	<?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12 thumbnails-fix'; ?>
	<?php } ?>
<div class="<?php echo $class; ?>" >
<?php if ((!empty($column_left) ||$modern_product_show_infoblock ==1) && ($special && $special_date_end > $special_date_start)&&($modern_product_timer !=1)) { ?>
	<div class="special-timer-all">
	<div class = "text-time"><?php echo $text_end_stock; ?></div>
	<div class = "special-timere-zone">
	<div id = "time_out_pr"></div>
	</div>
	</div>
	<?php } ?>
<div class="prmain">
<div class="positionsticker">
<!-- special -->
<?php if ($modern_sticker_sale_product_auto !=1 && $special) { ?>
	<div class="stickers-special"><span class="diamont_st">-<?php echo $saving_product; ?>%</span></div>
	<?php } ?>
<!-- special END -->
<!-- new -->
<?php
$startDate1 = strtotime(mb_substr($dateadded, 0, 10));
$endDate2 = strtotime(date("Y-m-d"));
$days = ceil(($endDate2 / 86400)) - ceil(($startDate1 / 86400));
?>
<?php if($modern_sticker_new_product_auto !=1 && $days < $modern_sticker_product_new_day || $modern_sticker_new_product_auto !=0 && $stickers == 1) { ?>
	<div class="stickers-new"><span class="diamont_st"><?php echo $modern_name_sticker_product_new[$language_id]; ?></span></div>
	<?php } ?>
<!-- new END -->
<!-- top -->
<?php if ($modern_sticker_top_product_auto !=1 && $modern_sticker_product_top_ratinr == 1 && $rating == $modern_sticker_product_top_rating || $modern_sticker_top_product_auto !=1 && $modern_sticker_product_top_ratinr == 2 && $viewed >  $modern_sticker_product_top_viewed || $modern_sticker_top_product_auto !=0 && $stickers == 2 ) { ?>
	<div class="stickers-top"><span class="diamont_st"><?php echo $modern_name_sticker_product_top[$language_id]; ?></span></div>
	<?php } ?>
<!-- top END -->
</div>
<?php if ($thumb || $images) { ?>
	<ul class="thumbnails">
	<?php if ($thumb) { ?>
		<li><a class="thumbnail imglink" style="position: relative;" itemprop="image" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>">
		<img id="main-image" style="position: relative;" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $popup; ?>" /></a></li>
		<?php } ?>
	</ul>
	</div>
	<div class="rowimg">
	<div id="image-additional2">
	<?php if ($images) { ?>
		<div id="additional" class="owl-carousel">
		<div class="image-additional"><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" data-image="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>">
		<img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" ></a></div>
		<?php foreach ($images as $image) { ?>
			<div class="image-additional"><a class="thumbnail imglink" href="<?php echo $image['popup']; ?>" data-image="<?php echo $image['thumb2']; ?>" data-zoom-image="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" >
			<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>
			<?php } ?>
		</div>
		<?php } ?>
	</div>
	</div>
	<?php } ?>
</div>
<?php if (($column_left || $column_right) && ($modern_top_links9)) { ?>
	<?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
	<?php } else { ?>
	<?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
	<?php } ?>
<div class="<?php echo $class; ?>">
<div class="linetoppr">
<?php if ($review_status) { ?>
	<div class="rating">
	<p>
	<?php for ($i = 1; $i <= 5; $i++) { ?>
		<?php if ($rating < $i) { ?>
			<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
			<?php } else { ?>
			<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
			<?php } ?>
		<?php } ?>
	<a class="review_profile" href="" onclick="$('a[href=\'#review_tab\']').trigger('click'); return false;">&nbsp;&nbsp;<?php echo $reviews; ?></a> <span>/</span> <a class="review_profile" href="" onclick="$('a[href=\'#review_tab\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
	<?php if ($rating) { ?>
		<span itemprop="aggregateRating" itemscope itemtype = "http://schema.org/AggregateRating">
		<meta itemprop='ratingValue' content='<?php echo $rating; ?>' />
		<meta itemprop='bestRating' content='5' />
		<meta itemprop='worstRating' content='1' />
		<meta itemprop="reviewCount" content="<?php echo rtrim(preg_replace("/[^0-9\.]/", "", ($reviews)), '.'); ?>" />
		</span>
		<?php } ?>
	</p>
	</div>
	<?php } ?>
</div>
<ul class="list-unstyled">
<?php if ($manufacturer) { ?>
	<?php if ($modern_product_man_img !=1) { ?>
		<li><a href="<?php echo $manufacturers; ?>">
		<?php if( isset($manufacturer_img) ) { ?>
			<img  class="pull-right" src="<?php echo $manufacturer_img ; ?>" alt="<?php echo $manufacturer; ?>" title="<?php echo $manufacturer; ?>">
			<?php } ?>
		</a></li>
		<?php } ?>
	<li><span><?php echo $text_manufacturer; ?></span>&nbsp;&nbsp;<a itemprop="manufacturer" href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
	<?php } ?>
<li><?php echo $text_stock; ?>&nbsp;&nbsp;<?php echo ($quantity > 0) ? '<span class = "rewardin">'. $stock .'</span>' : '<span class = "rewardoff">'. $stock .'</span>'; ?></li>
<?php if ($modern_product_kod_tovara !=1) { ?>
	<li><span><?php echo $text_model; ?></span>&nbsp;&nbsp;<span itemprop="model"><?php echo $model; ?></span></li>
	<?php } ?>
<?php if ($reward) { ?>
	<li><span><?php echo $text_reward; ?></span>&nbsp;&nbsp;<?php echo $reward; ?></li>
	<?php } ?>
<?php if ($length && $width && $height && $modern_product_size !=1 ) { ?>
     <li><?php if ($length > 0) { ?><?php echo $text_lengthp; ?> <?php echo $length; ?> <?php if (($length > 0 && $width > 0)||($length > 0 && $height > 0)) { ?>x<?php } ?> <?php } ?><?php if ($width > 0) { ?><?php echo $text_widthp; ?> <?php echo $width; ?> <?php if ($width > 0 && $height > 0) { ?>x<?php } ?> <?php } ?><?php if ($height > 0) { ?><?php echo $text_heightp; ?> <?php echo $height; ?><?php } ?></li>
<?php } ?>
<?php if ($weight > 0 && $modern_product_weight !=1 ) { ?>
	<li><?php echo $text_weightp; ?> <?php echo $weight; ?></li>
	<?php } ?>
<?php if ($modern_product_show_sku !=1) { ?>
	<li><?php if ($sku) { echo $modern_product_sku[$language_id]; } ?> <?php echo $sku; ?></li>
	<?php } ?>
<?php if ($modern_product_show_upc !=1) { ?>
	<li><?php if ($upc) { echo $modern_product_upc[$language_id]; } ?> <?php echo $upc; ?></li>
	<?php } ?>
<?php if ($modern_product_show_ean !=1) { ?>
	<li><?php if ($ean) { echo $modern_product_ean[$language_id]; } ?> <?php echo $ean; ?></li>
	<?php } ?>
<?php if ($modern_product_show_jan !=1) { ?>
	<li><?php if ($jan) { echo $modern_product_jan[$language_id]; } ?> <?php echo $jan; ?></li>
	<?php } ?>
<?php if ($aridius_popupsize_status && $popupsize == 1) { ?>
	<li> <i class="fa fa-calendar"></i>&nbsp;<a class="popup-modal" href="#popup-modal"><?php echo $aridius_popupsize_name[$language_id]; ?></a> </li>
	<?php } ?>
</ul>
<hr>
<?php if ($price) { ?>
	<span itemprop="offers" itemscope itemtype = "http://schema.org/Offer">
	<meta itemprop="price" content="<?php echo rtrim(preg_replace("/[^0-9\.]/", "", ($special ? $special : $price)), '.'); ?>" />
	<meta itemprop="priceCurrency" content="<?php echo $sh_currency; ?>" />
	</span>
	<div class="line-product">
	<?php if (!$special) { ?>
		<span class="priceproduct-new"><?php echo $price; ?></span>
		<?php } else { ?>
		<span class="priceproduct-new"><?php echo $special; ?></span>&nbsp;&nbsp;<span class="priceproduct-old"><?php echo $price; ?></span>
		<?php } ?><br />
	<?php if ($aridiusundersell_status) { ?>
		<i class="fa fa-area-chart" aria-hidden="true"></i>&nbsp;<a id="undersell-order"><?php echo $buttonundersell_title; ?></a>
		<?php } ?>
	</div>
	<ul class="list-unstyled">
	<?php if ($tax) { ?>
		<li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
		<?php } ?>
	<?php if ($points) { ?>
		<li><?php echo $text_points; ?> <?php echo $points; ?></li>
		<?php } ?>
	<?php if ($discounts) { ?>
		<li>
		<hr>
		</li>
		<?php foreach ($discounts as $discount) { ?>
			<li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
			<?php } ?>
		<?php } ?>
	</ul>
	<?php } ?>
<div id="product">
<?php if ($options) { ?>
	<hr>
	<h3><?php echo $text_option; ?></h3>
	<?php foreach ($options as $option) { ?>
		<?php if ($option['type'] == 'select') { ?>
			<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
			<option value=""><?php echo $text_select; ?></option>
			<?php foreach ($option['product_option_value'] as $option_value) { ?>
				<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
				<?php if ($option_value['price']) { ?>
					(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
					<?php } ?>
				</option>
				<?php } ?>
			</select>
			</div>
			<?php } ?>
		<?php if ($option['type'] == 'radio') { ?>
			<div class="options_group form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label"><?php echo $option['name']; ?></label>
			<div id="input-option<?php echo $option['product_option_id']; ?>">
			<?php foreach ($option['product_option_value'] as $option_value) { ?>
				<div class="radio">
				<label>
				<?php if ($option_value['image']) { ?>
					<input style="margin-left:0px;" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
					<br />
					<a href="<?php echo $option_value['popup']; ?>" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="imgpopcat">
					<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <br /><?php echo $option_value['name']; ?></a>
					<?php if ($option_value['price']) { ?>
						<br />
						<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
						<?php } ?>
					<?php } else { ?>
					<input type="radio" class="options_none" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
					<span class="im_option"><?php echo $option_value['name']; ?></span>
					<?php if ($option_value['price']) { ?>
						<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
						<?php } ?><span class = "options-prheight"></span>
					<?php } ?>
				</label>
				</div>
				<?php } ?>
			</div>
			</div>
			<?php } ?>
		<?php if ($option['type'] == 'checkbox') { ?>
			<div class="options_group form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label"><?php echo $option['name']; ?></label>
			<div id="input-option<?php echo $option['product_option_id']; ?>">
			<?php foreach ($option['product_option_value'] as $option_value) { ?>
				<div class="checkbox">
				<label>
				<?php if ($option_value['image']) { ?>
					<input style="margin-left:0px;" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
					<br />
					<a href="<?php echo $option_value['popup']; ?>" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="imgpopcat">
					<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <br /><?php echo $option_value['name']; ?></a>
					<?php if ($option_value['price']) { ?>
						<br />
						<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
						<?php } ?>
					<?php } else { ?>
					<input type="checkbox" class="options_none" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
					<span class="im_option"><?php echo $option_value['name']; ?></span>
					<?php if ($option_value['price']) { ?>
						<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
						<?php } ?><span class = "options-prheight"></span>
					<?php } ?>
				</label>
				</div>
				<?php } ?>
			</div>
			</div>
			<?php } ?>
		<?php if ($option['type'] == 'text') { ?>
			<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
			</div>
			<?php } ?>
		<?php if ($option['type'] == 'textarea') { ?>
			<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
			</div>
			<?php } ?>
		<?php if ($option['type'] == 'file') { ?>
			<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label"><?php echo $option['name']; ?></label>
			<button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
			<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
			</div>
			<?php } ?>
		<?php if ($option['type'] == 'date') { ?>
			<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			<div class="input-group date">
			<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
			<span class="input-group-btn">
			<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
			</span></div>
			</div>
			<?php } ?>
		<?php if ($option['type'] == 'datetime') { ?>
			<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			<div class="input-group datetime">
			<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
			<span class="input-group-btn">
			<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
			</span></div>
			</div>
			<?php } ?>
		<?php if ($option['type'] == 'time') { ?>
			<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			<div class="input-group time">
			<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
			<span class="input-group-btn">
			<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
			</span></div>
			</div>
			<?php } ?>
		<?php } ?>
	<?php } ?>
<?php if ($recurrings) { ?>
	<hr>
	<h3><?php echo $text_payment_recurring; ?></h3>
	<div class="form-group required">
	<select name="recurring_id" class="form-control">
	<option value=""><?php echo $text_select; ?></option>
	<?php foreach ($recurrings as $recurring) { ?>
		<option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
		<?php } ?>
	</select>
	<div class="help-block" id="recurring-description"></div>
	</div>
	<?php } ?>
<div class="form-group plus_minus">
<div class="pull-left">
<input type="text" name="quantity" value="<?php echo $minimum; ?>" data-toggle="tooltip" title="<?php echo $entry_qty; ?>" size="2" id="input-quantity" class="form-control" />
<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
</div>
<div class="custom pull-left">
<button type="button" id="plus" class="items-count" ><i class="fa fa-angle-up">&nbsp;</i></button>
<button type="button" id="minus" class="items-count"><i class="fa fa-angle-down">&nbsp;</i></button>
</div>&nbsp;&nbsp;&nbsp;
<?php if ($modern_wishlist_cat !=1) { ?>
	<button type="button" data-toggle="tooltip" class="btn-wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
	<?php } ?>
<?php if ($modern_compare_cat !=1) { ?>
	<button type="button" data-toggle="tooltip" class="btn-compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
	<?php } ?>
<div class="clearfix"></div><br />
<div class="cart pull-left" >
<?php if ($quantity <= 0 && $aridiusinstock_status ) { ?>
	<button type="button" class="btn-instock" onclick="instock.add('<?php echo $product_id; ?>');" data-product-id="<?php echo $product_id; ?>"><?php echo $button_instock; ?></button>
	<?php } else { ?>
	<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn-cart"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
	<?php if ($aridiusfastorder_status) { ?>
		<button type="button" id="fast-order" class="btn-cart"><i class="fa fa-clock-o"></i> <?php echo $button_title; ?></button>
		<?php } ?>
	<?php } ?>
</div>
</div>
<div class="clearfix"></div>
<?php if ($minimum > 1) { ?>
	<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
	<?php } ?>
</div>
<?php if ($modern_product_show_share !=1) { ?>
	<div class="rating">
	<p>
	<?php if (empty($modern_share)) { ?>
		<!-- AddThis Button BEGIN -->
		<div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
		<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
		<!-- AddThis Button END -->
		<?php } else { ?>
		<?php echo htmlspecialchars_decode($modern_share);?>
		<?php } ?>
	</div>
	<?php } ?>
<br />
</div>
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 block_product">
<?php if ($modern_top_links9 ) { ?>
	<?php foreach ($modern_top_links9 as $modern_top_link9) { ?>
		<div class="product-info">
		<div class="">
		<table class="table">
		<tbody>
		<tr>
		<td style="text-align:center;"><img class="img_tabl" src="<?php echo $modern_top_link9['image_href']; ?>" alt=""/></td>
		<td><div class="text-product-info"><?php echo html_entity_decode($modern_top_link9['description'][$language_id]); ?></div></td>
		</tr>
		</tbody>
		</table>
		</div>
		</div>
		<?php } ?>
	<?php } ?>
<?php echo html_entity_decode($modern_product_info_block[$language_id]); ?>
</div>
</div></div></div>
<div class="title_center"><?php echo $tab_description; ?></div>
<div class="description_pr" itemprop="description"><?php echo $description; ?></div>
<div class="attribute_groups">
<?php if ($attribute_groups) { ?>
	<div class="title_center"><?php echo $tab_attribute; ?></div>
	<?php foreach ($attribute_groups as $attribute_group) { ?>
		<strong><?php echo $attribute_group['name']; ?></strong>
		<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
			<ul class="atr">
			<li><span><?php echo $attribute['name']; ?></span> <span><?php echo $attribute['text']; ?></span></li>
			</ul>
			<?php } ?>
		<?php } ?>
	<?php } ?>
</div>
<?php if($ard_quckview) { ?>
	<div id="ard_quckview"><?php echo $ard_quckview;?></div>
<?php } ?>
<?php echo $content_bottom; ?>
<?php if ($tags) { ?>
	<p><i class="fa fa-tags" aria-hidden="true"></i> <?php echo $text_tags; ?> <?php for ($i = 0; $i < count($tags); $i++) { ?><?php if ($i < (count($tags) - 1)) { ?><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,<?php } else { ?><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a><?php } ?><?php } ?></p>
	<?php } ?>
</div>
<?php if ($attribute_groups) { ?>
	<!-- Atribute start -->
	<div id="attribute_tab" class="tab-pane fade">
	<div class="tab-pane" id="tab-specification">
	<table class="table table-bordered">
	<?php foreach ($attribute_groups as $attribute_group) { ?>
		<thead>
		<tr>
		<td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
		</tr>
		</thead>
		<tbody>
		<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
			<tr>
			<td><?php echo $attribute['name']; ?></td>
			<td><?php echo $attribute['text']; ?></td>
			</tr>
			<?php } ?>
		</tbody>
		<?php } ?>
	</table>
	</div>
	</div>
	<!-- Atribute end -->
	<?php } ?>
<?php if ($review_status) { ?>
	<!-- Review start -->
	<div id="review_tab" class="tab-pane fade">
	<form class="form-horizontal" id="form-review">
	<div id="review"></div>
	<span class="text-write"><?php echo $text_write; ?></span>
	<?php if ($review_guest) { ?>
		<div class="form-group required">
		<div class="col-sm-12">
		<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
		<input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
		</div>
		</div>
		<div class="form-group required">
		<div class="col-sm-12">
		<label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
		<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
		</div>
		</div>
		<div class="form-group">
		<div class="col-sm-12">
		<label for="input-dignity"><?php echo $text_dignity; ?></label>
		<input type="text" name="dignity" id="input-dignity" class="form-control">
		</div>
		</div>
		<div class="form-group">
		<div class="col-sm-12">
		<label for="input-limitations"><?php echo $text_limitations; ?></label>
		<input type="text" name="limitations" id="input-limitations" class="form-control">
		</div>
		</div>
		<div class="help-block"><?php echo $text_note; ?></div>
		<div class="form-group required">
		<div class="col-sm-12">
		<label class="control-label"><?php echo $entry_rating; ?></label>
		<input type="hidden" name="rating" value="<?php echo $modern_product_raiting; ?>" class="rating-tooltip"/>
		</div>
		</div>
		<?php echo $captcha; ?>
		<div class="buttons clearfix">
		<div class="pull-right">
		<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn-cart"><?php echo $button_continue; ?></button>
		</div>
		</div>
		<?php } else { ?>
		<?php echo $text_login; ?>
		<?php } ?>
	</form>
	</div>
	<!-- Review end -->
	<?php } ?>
<!-- Аccessories start -->
<div id="accessories_tab" class="tab-pane fade">
<?php if ($products) { ?>
	<h3 class="title_h title_center"><?php echo $text_related; ?></h3>
	<div class="padding-carusel row">
	<div id="related" class="owl-carousel">
	<?php foreach ($products as $key => $product) { ?>
		<div class="product-layoutcat">
		<div class="border product-thumb">
		<div id="imgCarousel-accessories<?php echo $key ?>" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner" role="listbox">
		<div class="item active">
		<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive center-add_img" /></a>
		</div>
		<?php $html = '';?>
		<?php $img_key = 1;?>
		<?php $html .= '<li data-target="#imgCarousel-accessories' . $key . '" data-slide-to="0" class="active"></li>'; ?>
		<?php foreach ($product['images'] as $image) { ?>
			<div class="item">
			<a href="<?php echo $product['href']; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive center-add_img" /></a>
			</div>
			<?php $html .= '<li data-target="#imgCarousel-accessories' . $key . '" data-slide-to="' . $img_key . '"></li>'; ?>
			<?php $img_key++ ;?>
			<?php } ?>
		<?php if ($img_key > 1) { ?>
			<ol class="carousel-indicators">
			<?php echo $html;?>
			</ol>
			</div>
			<a class="left carousel-control" href="#imgCarousel-accessories<?php echo $key ?>" role="button" data-slide="prev">
			<i class="fa fa-caret-left"></i>
			</a>
			<a class="right carousel-control" href="#imgCarousel-accessories<?php echo $key ?>" role="button" data-slide="next">
			<i class="fa fa-caret-right"></i>
			</a>
			<?php } else { ?>
			</div>
			<?php } ?>
		</div>
		<script>
		$('#imgCarousel-accessories<?php echo $key ?>').carousel({
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
		<?php if ($modern_rating_cat !=1) { ?>
			<div class="rating">
			<?php for ($i = 1; $i <= 5; $i++) { ?>
				<?php if ($product['rating'] < $i) { ?>
					<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
					<?php } else { ?>
					<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
					<?php } ?>
				<?php } ?>
			</div>
			<?php } ?>
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
		<?php if ($modern_description_cat !=1) { ?>
			<hr>
			<p class="description_cat"><?php echo $product['description']; ?></p>
			<?php } ?>
		<?php if($product['attribute_groups'] && $modern_atribute !=1) { ?>
			<hr>
			<div class="attribute_cat">
			<?php foreach($product['attribute_groups'] as $attribute_group) { ?>
				<?php $v = 1 ?>
				<?php foreach($attribute_group['attribute'] as $key => $attribute) { ?>
					<?php $v++; ?>
					<?php if($v > $modern_attribute_see) break; ?>
					<?php echo $attribute['name']; ?> - <?php echo $attribute['text']; ?> /
					<?php } ?>
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
		</div>
		</div>
		</div>
		</div>
		<?php } ?>
	</div> </div>
	<?php } ?>
</div>
<!-- Аccessories end -->
<!-- custom_tabs -->	
<?php if ($custom_tabs) { ?>
    <?php foreach ($custom_tabs as $key => $custom_tab) { ?>
    <?php if ($custom_tab['title']) { ?><div class="tab-pane" id="custom_tabs-<?php echo $key?>"><?php echo $custom_tab['description']; ?></div> <?php } ?>
    <?php } ?>	
<?php } ?>	
<!-- custom_tabs -->	
<!-- custom_tabs -->	
<?php if ($modern_top_links7 ) { ?>
	<?php foreach ($modern_top_links7 as $key => $modern_top_link7) { ?>
		<?php if ($modern_top_link7['title'][$language_id]) { ?><div class="tab-pane" id="other_tab-<?php echo $key ?>"><?php echo html_entity_decode($modern_top_link7['description'][$language_id]); ?></div> <?php } ?>
		<?php } ?>
<?php } ?>
<!-- custom_tabs -->	
</div>
</div>
</div>
</div>
<?php echo $column_right; ?>
</div>
<?php if ($aridius_popupsize_status && $popupsize == 1) { ?>
	<div id="popup-modal" class="white-popup-block mfp-hide">
	<div class="popupsize">
	<div class="popupsizebor">
	<button title="close" type="button" class="mfp-close">&#215;</button>
	<div class="name-popup"><?php echo $aridius_popupsize_name[$language_id]; ?></div>
	</div>
	<br />
	<div class="popupsize2">
	<ul class="nav nav-tabs pup mod">
	<?php if ($aridius_popupsize_top_links ) { ?>
		<?php foreach ($aridius_popupsize_top_links as $key => $aridius_popupsize_top_link) { ?>
			<?php if ($aridius_popupsize_top_link['title'][$language_id]) { ?> <li><a href="#tab-<?php echo $key ?>" data-toggle="tab"><?php echo $aridius_popupsize_top_link['title'][$language_id]; ?></a></li><?php } ?>
			<?php } ?>
		<?php } ?>
	</ul>
	<div class="tab-content">
	<?php if ($aridius_popupsize_top_links ) { ?>
		<?php foreach ($aridius_popupsize_top_links as $key => $aridius_popupsize_top_link) { ?>
			<?php if ($aridius_popupsize_top_link['title'][$language_id]) { ?><div class="tab-pane pup" id="tab-<?php echo $key ?>"><?php echo html_entity_decode($aridius_popupsize_top_link['description'][$language_id]); ?></div> <?php } ?>
			<?php } ?>
		<?php } ?>
	</div>
	</div>
	</div>
	</div>
	<script type="text/javascript"><!--
	$('.popup-modal').magnificPopup({
preloader: true,
callbacks: {
open: function() {
				$(".nav-tabs.pup li:first").addClass("active");
				$(".tab-pane.pup:first").addClass("active");
			},
close: function() {
				$(".nav-tabs.pup li").removeClass("active");
				$(".tab-pane.pup").removeClass("active");
			}
		}
	});
	//--></script>
	<?php } ?>
<script type="text/javascript"><!--
$(document).ready(function() {
$('#additional').owlCarousel({
items: 4,
itemsMobile: 	[479,4],
		itemsTablet :	[768,4],
itemsDesktopSmall:	[979,4],
itemsDesktop:	[1199,3],
autoPlay: 3000, //Set AutoPlay to 3 seconds,
pagination: false,
navigation: true,
navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
	});
});
//--></script>
<!-- rating -->
<link href="catalog/view/theme/modern/js/bootstrap-rating.css" rel="stylesheet" type="text/css" />
<script src="catalog/view/theme/modern/js/bootstrap-rating.js" type="text/javascript"></script>
<script type="text/javascript"><!--
$(function () {
	$('.rating-tooltip').rating({
extendSymbol: function (rate) {
			$(this).tooltip({
container: 'body',
placement: 'bottom',
title: rate
			});
		}
	});
});
//--></script>
<?php if (($special && $special_date_end > $special_date_start)&&($modern_product_timer !=1)) {
	$date_out = date('Y, m, d', strtotime($special_date_end));
	?>
	<script type="text/javascript">
	function get_timer() {
		var timeend= new Date();
		timeend = new Date(<?php echo $date_out; ?>);
		var day = new Date();
		day.setMonth(day.getMonth() + 1);
		day = Math.floor((timeend-day)/1000);
		var sec=day%60; day=Math.floor(day/60);
		var min=day%60; day=Math.floor(day/60);
		var hour=day%24; day=Math.floor(day/24);
		if(day<10)day='0'+day;
		if(hour<10)hour='0'+hour;
		if(min<10)min='0'+min;
		if(sec<10)sec='0'+sec;
		var timestr =  "<span class='special-timer-info'>" +day+  "<span class='special-timer-text'><?php echo $day; ?></span></span><span class='special-timer-line'>:</span><span class='special-timer-info'>"  +hour+    "<span class='special-timer-text'><p><?php echo $hour; ?></p></span></span><span class='special-timer-line'>:</span><span class='special-timer-info'>"  +min+   "<span class='special-timer-text'><?php echo $minute; ?></span></span><span class='special-timer-line'>:</span><span class='special-timer-info'>"   +sec+   "<span class='special-timer-text'><?php echo $second; ?></span></span>";
		document.getElementById('time_out_pr').innerHTML=timestr;
		setTimeout(get_timer,1000);
	}
	get_timer()
	//--></script>
	<?php } ?>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
url: 'index.php?route=product/product/getRecurringDescription',
type: 'post',
data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
dataType: 'json',
beforeSend: function() {
			$('#recurring-description').html('');
		},
success: function(json) {
			$('.alert, .text-danger').remove();
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('body').on('click','#button-cart', function(){
	$.magnificPopup.close();
	$.ajax({
url: 'index.php?route=checkout/cart/add',
type: 'post',
data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
dataType: 'json',
beforeSend: function() {
			$('#button-cart').button('loading');
		},
complete: function() {
			$('#button-cart').button('reset');
		},
success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}
			if (json['success']) {
				$('#addtocart').find('.modal-body p').html(json['success']);
				$("#addtocart").modal('show');
				$('#cart button > span').html('<span> &nbsp;' + json['total'] + '&nbsp;<span class="caret"></span></span>');
				$('html, body').animate({ scrollTop: 0 }, 'slow');
				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
pickTime: false
});
$('.datetime').datetimepicker({
pickDate: true,
pickTime: true
});
$('.time').datetimepicker({
pickDate: false
});
$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	$('#form-upload').remove();
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	$('#form-upload input[name=\'file\']').trigger('click');
	if (typeof timer != 'undefined') {
		clearInterval(timer);
	}
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			$.ajax({
url: 'index.php?route=tool/upload',
type: 'post',
dataType: 'json',
data: new FormData($('#form-upload')[0]),
cache: false,
contentType: false,
processData: false,
beforeSend: function() {
					$(node).button('loading');
				},
complete: function() {
					$(node).button('reset');
				},
success: function(json) {
					$('.text-danger').remove();
					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
					if (json['success']) {
						alert(json['success']);
						$(node).parent().find('input').val(json['code']);
					}
				},
error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();
	$('#review').fadeOut('slow');
	$('#review').load(this.href);
	$('#review').fadeIn('slow');
});
$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
$('#button-review').on('click', function() {
	$.ajax({
url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
type: 'post',
dataType: 'json',
data: $("#form-review").serialize(),
beforeSend: function() {
			$('#button-review').button('loading');
		},
complete: function() {
			$('#button-review').button('reset');
		},
success: function(json) {
			$('.alert-success, .alert-danger').remove();
			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				$('input[name=\'name\']').val('');
				$('input[name=\'dignity\']').val('');
				$('input[name=\'limitations\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
	grecaptcha.reset();
});
//--></script>
<!-- elevateZoom/pop up img -->
<script src="catalog/view/theme/modern/js/elevatezoom/jquery.elevatezoom.js" type="text/javascript"></script>
<script type="text/javascript"><!--
jQuery(document).ready(function () {
	$('#image-additional2 a').on('click', function (e) {
		e.preventDefault();
		var imagePath = $(this).data('zoomImage');
		$('#main-image')
		.data('zoomImage', imagePath)
	});
	$("#main-image").bind("click", function(e) {
		var $this = $(this);
		var items = [{
src: $this.data('zoomImage') || this.src
		}];
		$('.imglink').each(function () {
			if (items[0].src != this.href) {
				items.push({
src: this.href
				});
			}
		});
		$.magnificPopup.open({
items: items,
gallery: {
enabled: true
			},
type: 'image',
mainClass: 'mfp-fade'
		});
		$(".mfp-content").prepend("<div class='image_title'><?php echo $heading_title; ?></div>");
		$(".mfp-bottom-bar").prepend("<div class='hidden-xs'><?php if (!$special) { ?><div class='image_price2'><span class='priceproduct-new'><?php echo $price; ?></span></div><?php } else { ?><div class='image_price'><span class='priceproduct-new'><?php echo $special; ?></span>&nbsp;&nbsp;<span class='priceproduct-old'><?php echo $price; ?></span></div><?php } ?> <?php if ($quantity <= 0 && $aridiusinstock_status ) { ?><button type='button' class='btn-instock' onclick=\"instock.add('<?php echo $product_id; ?>');\" data-product-id='<?php echo $product_id; ?>'><?php echo $button_instock; ?></button><?php } else { ?><button type='button' id='button-cart' data-loading-text='<?php echo $text_loading; ?>' class='btn-cart'><i class='fa fa-shopping-cart'></i> <?php echo $button_cart; ?></button><?php } ?></div>");
		e.preventDefault();
	});
});
//--></script>
<script type="text/javascript"><!--
<?php if ($modern_elevatezoom == '0') { ?>
	$("#main-image").elevateZoom({gallery:'image-additional2',  cursor: "crosshair" , galleryActiveClass: 'active' });
	<?php } elseif ($modern_elevatezoom == '1') { ?>
	$("#main-image").elevateZoom({gallery:'image-additional2', tint:false, tintColour:'#F90', tintOpacity:0.5, galleryActiveClass: 'active' });
	<?php } elseif ($modern_elevatezoom == '2') { ?>
	$("#main-image").elevateZoom({gallery:'image-additional2', zoomType :"inner",  cursor:"crosshair", galleryActiveClass: 'active' });
	<?php } elseif ($modern_elevatezoom == '3') { ?>
	$("#main-image").elevateZoom({gallery:'image-additional2', zoomType: "lens", lensShape: "round", lensSize: 200, galleryActiveClass: 'active'});
	<?php } elseif ($modern_elevatezoom == '4') { ?>
	$("#main-image").elevateZoom({gallery:'image-additional2', constrainSize:200, zoomType: "lens", containLensZoom: true, cursor: 'pointer', galleryActiveClass: "active"});
	<?php } ?>
$("#main-image").on("click", function(e) {
	var ez = $('#main-image').data('elevateZoom');
	return false;
});
//--></script>
<!--review stars -->
<script type="text/javascript"><!--
$(".review_profile").click(function (){
	var tabTop = $(".nav-tabs").offset().top;
	$("html, body").animate({ scrollTop:tabTop }, 800);
});
//--></script>
<script type="text/javascript"><!--
$(".specification_profile").click(function (){
	var tabTop = $(".nav-tabs").offset().top;
	$("html, body").animate({ scrollTop:tabTop }, 800);
});
//--></script>
<!--pop up options img -->
<script type="text/javascript"><!--
$('.imgpopcat').magnificPopup({
type: 'image',
gallery: {
enabled: false
	},
});
//--></script>
<!-- + / - -->
<script type="text/javascript"><!--
function minus(){
	if(document.getElementById("input-quantity").value <= 0) {
		return false;
	}
	document.getElementById("input-quantity").value --;
};
function plus(){
	document.getElementById("input-quantity").value ++;
};
$('#minus').click(function(){
	minus();
});
$('#plus').click(function(){
	plus();
});
//--></script>
<!--related products -->
<script type="text/javascript"><!--
$('#related').owlCarousel({
items : 4,
itemsCustom : false,
itemsDesktop : [1199,2],
itemsDesktopSmall : [980,2],
itemsTablet: [768,2],
itemsMobile : [479,1],
navigation: true,
navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
pagination: false,
paginationSpeed: 300,
slideSpeed: 200,
stop_img_imgOnHover: true,
autoPlay: true,
});
//--></script>
<script type="text/javascript"><!--
$(function() {
	$('.fixzoom li.active .fa-caret-down').removeClass('hidden');
	$('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
		$(this).find('.fa-caret-down').removeClass('hidden');
	});
	$('.fixzoom a[href="#product_tab"]').on('shown.bs.tab', function (e) {
		$('.zoomContainer').css("z-index", "1");
	});
	$('.fixzoom a[data-toggle="tab"]').on('hide.bs.tab', function (e) {
		$(this).find('.fa-caret-down').addClass('hidden');
		$('.zoomContainer').css("z-index", "-1");
	});
});
//--></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	var hash = window.location.hash;
	if (hash) {
		var hashpart = hash.split('#');
		var  vals = hashpart[1].split('-');
		for (i=0; i<vals.length; i++) {
			$('div.options').find('select option[value="'+vals[i]+'"]').attr('selected', true).trigger('select');
			$('div.options').find('input[type="radio"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
		}
	}
})
//--></script>
<?php echo $footer; ?>