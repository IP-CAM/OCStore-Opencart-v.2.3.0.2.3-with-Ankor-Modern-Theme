<div id="quickview">
<div class="quickw">
<div class="quickwgroup">
<button title="close" type="button" class="mfp-close">&#215;</button>
<div class="name-popup"><?php echo $heading_title; ?></div>
</div>
<div class="quickw2">
<div class="row">
<div class="col-lg-12">
<?php if (!$aridius_qckview_tabs) { ?>
	<ul class="nav nav-tabs mod tabst">
	<li class="active"><a href="#tab-product" data-toggle="tab"><?php echo $tab_products; ?></a></li>
	<?php if (!$aridius_qckview_tab_description) { ?>
		<li><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
		<?php } ?>
	<?php if ($attribute_groups && !$aridius_qckview_tab_character) { ?>
		<li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
		<?php } ?>
	<?php if ($review_status && !$aridius_qckview_tab_reviews) { ?>
		<li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
		<?php } ?>
	<?php if ($modern_top_links7 && !$aridius_qckview_tab_additional) { ?>
		<?php foreach ($modern_top_links7 as $key => $modern_top_link7) { ?>
			<?php if ($modern_top_link7['title'][$language_id]) { ?> <li><a href="#tab-<?php echo $key ?>" data-toggle="tab"><?php echo $modern_top_link7['title'][$language_id]; ?></a></li><?php } ?>
			<?php } ?>
		<?php } ?>
	</ul>
	<?php } ?>
<div class="tab-content">
<div class="tab-pane active" id="tab-product">
<?php if (!$aridius_qckview_image) { ?>
	<div class="col-lg-6 thumbnails-fix">
	<?php if (($special && $special_date_end > $special_date_start)&&($modern_product_timer !=1)) { ?>
		<div class="special-timer-all">
		<div class = "text-time"><?php echo $text_end_stock; ?></div>
		<div class = "special-timere-zone">
		<div id = "time_out"></div>
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
			<li><span class="thumbnail imglink">
			<img id="main-image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $popup; ?>" /></span></li>
			<?php } ?>
		</ul>
		</div>
		<?php if (!$aridius_qckview_additional_image) { ?>
			<div class="rowimg">
			<div id="image-additional2">
			<?php if ($images) { ?>
				<div class="block"></div>
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
		<?php } ?>
	</div>
	<div class="col-lg-6">
	<?php } else { ?>
	<div class="col-lg-12">
	<?php } ?>
<?php if (!$aridius_qckview_rating) { ?>
	<div class="linetoppr">
	<?php if ($review_status) { ?>
		<div class="rating">
		<p>
		<?php for ($j = 1; $j <= 5; $j++) { ?>
			<?php if ($rating < $j) { ?>
				<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
				<?php } else { ?>
				<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
				<?php } ?>
			<?php } ?>
		<?php if (!$aridius_qckview_tab_reviews) { ?>
			&nbsp;&nbsp;<a class="review_profile" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> <span>/</span> <a class="review_profile" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a></p>
			<?php } else { ?>
			&nbsp;&nbsp;<?php echo $reviews; ?>
			<?php } ?>
		</div>
		<?php } ?>
	</div>
	<?php } ?>
<?php if (!$aridius_qckview_short_info) { ?>
	<ul class="list-unstyled">
	<?php if ($manufacturer && !$aridius_qckview_manufacturer) { ?>
		<?php if ($modern_product_man_img !=1) { ?>
			<li><a href="<?php echo $manufacturers; ?>">
			<?php if( isset($manufacturer_img) ) { ?>
				<img  class="pull-right" src="<?php echo $manufacturer_img ; ?>" alt="<?php echo $manufacturer; ?>" title="<?php echo $manufacturer; ?>">
				<?php } ?>
			</a></li>
			<?php } ?>
		<li><span><?php echo $text_manufacturer; ?></span>&nbsp;&nbsp;<a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
		<?php } ?>
	<?php if (!$aridius_qckview_stock) { ?>
		<li><?php echo $text_stock; ?>&nbsp;&nbsp;<?php echo ($quantity > 0) ? '<span class = "rewardin">'. $stock .'</span>' : '<span class = "rewardoff">'. $stock .'</span>'; ?></li>
		<?php } ?>
	<?php if (!$aridius_qckview_code_product) { ?>
		<li><span><?php echo $text_model; ?></span>&nbsp;&nbsp;<?php echo $model; ?></li>
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
	</ul>
	<?php if ($modern_show_attribute !=1) { ?>
		<div class="attribute_groups">
		<?php if ($attribute_groups) { ?>
			<?php echo $modern_pr_attribute_name[$language_id]; ?>
			<?php foreach ($attribute_groups as $attribute_group) { ?>
				<?php $v = 1 ?>
				<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
					<?php $v++; ?>
					<?php if($v > $modern_attribute_see) break; ?>
					<ul class="atr">
					<li><span><?php echo $attribute['name']; ?></span> <span><?php echo $attribute['text']; ?></span></li>
					</ul>
					<?php } ?>
				<?php } ?>
			<a class="specification_profile" href="" onclick="$('a[href=\'#tab-specification\']').trigger('click'); return false;"><?php echo $modern_pr_attribute_seeall[$language_id]; ?></a>
			<?php } ?>
		</div>
		<?php } ?>
	<hr>
	<?php } ?>
<?php if ($price) { ?>
	<div class="line-product">
	<?php if (!$special) { ?>
		<span class="priceproduct-new"><?php echo $price; ?></span>
		<?php } else { ?>
		<span class="priceproduct-new"><?php echo $special; ?></span>&nbsp;&nbsp;<span class="priceproduct-old"><?php echo $price; ?></span>
		<?php } ?><br />
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
<div id="product_quickw">
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
				<option value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"><?php echo $option_value['name']; ?>
				<?php if ($option_value['price']) { ?>
					(<?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>)
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
					<input style="margin-left:0px;" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" />
					<br />
					<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <br /><?php echo $option_value['name']; ?></a>
					<?php if ($option_value['price']) { ?>
						<br />
						<?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>
						<?php } ?>
					<?php } else { ?>
					<input type="radio" class="options_none" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" />
					<span class="im_option"><?php echo $option_value['name']; ?></span>
					<?php if ($option_value['price']) { ?>
						<?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>
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
					<input style="margin-left:0px;" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" />
					<br />
					<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <br /><?php echo $option_value['name']; ?></a>
					<?php if ($option_value['price']) { ?>
						<br />
						<?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>
						<?php } ?>
					<?php } else { ?>
					<input type="checkbox" class="options_none" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" />
					<span class="im_option"><?php echo $option_value['name']; ?></span>
					<?php if ($option_value['price']) { ?>
						<?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>
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
<?php if ($modern_wishlist_cat !=1 && !$aridius_qckview_button_wish) { ?>
	<button type="button" data-toggle="tooltip" class="btn-wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
	<?php } ?>
<?php if ($modern_compare_cat !=1 && !$aridius_qckview_button_compare) { ?>
	<button type="button" data-toggle="tooltip" class="btn-compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
	<?php } ?>
<div class="clearfix"></div><br />
<div class="cart pull-left" >
<?php if ($quantity <= 0 && $aridiusinstock_status ) { ?>
	<button type="button" class="btn-instock" onclick="instock.add('<?php echo $product_id; ?>');" data-product-id="<?php echo $product_id; ?>"><?php echo $button_instock; ?></button>
	<?php } else { ?>
	<button type="button" id="button-cart_quickw" data-loading-text="<?php echo $text_loading; ?>" class="btn-cart"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
	<?php } ?>
</div>
</div>
<div class="clearfix"></div>
<?php if ($minimum > 1) { ?>
	<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
	<?php } ?>
</div>
<?php if ($review_status && !$aridius_qckview_icons_likes) { ?>
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
</div>
</div>
<div class="tab-pane" id="tab-description"><?php echo $description; ?></div>
<?php if ($attribute_groups) { ?>
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
	<?php } ?>
<?php if ($review_status) { ?>
	<div class="tab-pane" id="tab-review">
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
	<?php } ?>
<?php if ($modern_top_links7 ) { ?>
	<?php foreach ($modern_top_links7 as $key => $modern_top_link7) { ?>
		<?php if ($modern_top_link7['title'][$language_id]) { ?><div class="tab-pane" id="tab-<?php echo $key ?>"><?php echo html_entity_decode($modern_top_link7['description'][$language_id]); ?></div> <?php } ?>
		<?php } ?>
	<?php } ?>
</div></div>
</div>
</div></div>
<!--<script src="catalog/view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.3/moment.js"></script>
<script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
<!-- rating -->
<link href="catalog/view/theme/modern/js/bootstrap-rating.css" rel="stylesheet" type="text/css" />
<!--<script src="catalog/view/theme/modern/js/bootstrap-rating.js" type="text/javascript"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-rating/1.4.0/bootstrap-rating.min.js"></script>
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
<script type="text/javascript"><!--
var popupq;
function get_timerpopup(isstart) {
	if (!isstart) {clearTimeout (popupq);return;}
	<?php
	$special_res= false;
	if (($special && $special_date_end > $special_date_start)&&($modern_product_timer !=1)) {
		$special_res= true;
		$date_out = date('Y, m, d', strtotime($special_date_end));
		?>
		get_timer2();
		popupq = setInterval(get_timer2,1000);
		<?php } ?>
}
function get_timer2() {
	var timeendpopup= new Date();
	timeendpopup = new Date(<?php if ($special_res) echo $date_out; ?>);
	var day = new Date();
	day.setMonth(day.getMonth() + 1);
	day = Math.floor((timeendpopup-day)/1000);
	var sec=day%60; day=Math.floor(day/60);
	var min=day%60; day=Math.floor(day/60);
	var hour=day%24; day=Math.floor(day/24);
	if(day<10)day='0'+day;
	if(hour<10)hour='0'+hour;
	if(min<10)min='0'+min;
	if(sec<10)sec='0'+sec;
	var timestr =  "<span class='special-timer-info'>" +day+  "<span class='special-timer-text'><?php echo $day; ?></span></span><span class='special-timer-line'>:</span><span class='special-timer-info'>"  +hour+    "<span class='special-timer-text'><p><?php echo $hour; ?></p></span></span><span class='special-timer-line'>:</span><span class='special-timer-info'>"  +min+   "<span class='special-timer-text'><?php echo $minute; ?></span></span><span class='special-timer-line'>:</span><span class='special-timer-info'>"   +sec+   "<span class='special-timer-text'><?php echo $second; ?></span></span>";
	document.getElementById('time_out').innerHTML=timestr;
}
//--></script>
<script type="text/javascript"><!--
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
//--></script>
<script type="text/javascript"><!--
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
	e.preventDefault();
});
//--></script>
<script type="text/javascript"><!--
function price_format(price)
{
	c = <?php echo (empty($autocalc_currency['decimals']) ? "0" : $autocalc_currency['decimals'] ); ?>;
	d = '<?php echo $autocalc_currency['decimal_point']; ?>'; // decimal separator
	t = '<?php echo $autocalc_currency['thousand_point']; ?>'; // thousands separator
	s_left = '<?php echo $autocalc_currency['symbol_left']; ?>';
	s_right = '<?php echo $autocalc_currency['symbol_right']; ?>';
	n = price * <?php echo $autocalc_currency['value']; ?>;
	i = parseInt(n = Math.abs(n).toFixed(c)) + '';
	j = ((j = i.length) > 3) ? j % 3 : 0;
	price_text = s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right;
	<?php if (!empty($autocalc_currency2)) { ?>
		c = <?php echo (empty($autocalc_currency2['decimals']) ? "0" : $autocalc_currency2['decimals'] ); ?>;
		d = '<?php echo $autocalc_currency2['decimal_point']; ?>'; // decimal separator
		t = '<?php echo $autocalc_currency2['thousand_point']; ?>'; // thousands separator
		s_left = '<?php echo $autocalc_currency2['symbol_left']; ?>';
		s_right = '<?php echo $autocalc_currency2['symbol_right']; ?>';
		n = price * <?php echo $autocalc_currency2['value']; ?>;
		i = parseInt(n = Math.abs(n).toFixed(c)) + '';
		j = ((j = i.length) > 3) ? j % 3 : 0;
		price_text += '  <span class="currency2">(' + s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right + ')</span>';
		<?php } ?>
	return price_text;
}
function calculate_tax(price)
{
	<?php // Process Tax Rates
	if (isset($tax_rates) && $tax) {
		foreach ($tax_rates as $tax_rate) {
			if ($tax_rate['type'] == 'F') {
				echo 'price += '.$tax_rate['rate'].';';
			} elseif ($tax_rate['type'] == 'P') {
				echo 'price += (price * '.$tax_rate['rate'].') / 100.0;';
			}
		}
	}
	?>
	return price;
}
function process_discounts(price, quantity)
{
	<?php
	foreach ($dicounts_unf as $discount) {
		echo 'if ((quantity >= '.$discount['quantity'].') && ('.$discount['price'].' < price)) price = '.$discount['price'].';'."\n";
	}
	?>
	return price;
}
animate_delay = 20;
main_price_final = calculate_tax(<?php echo $price_value; ?>);
main_price_start = calculate_tax(<?php echo $price_value; ?>);
main_step = 0;
main_timeout_id = 0;
function animateMainPrice_callback() {
	main_price_start += main_step;
	if ((main_step > 0) && (main_price_start > main_price_final)){
		main_price_start = main_price_final;
	} else if ((main_step < 0) && (main_price_start < main_price_final)) {
		main_price_start = main_price_final;
	} else if (main_step == 0) {
		main_price_start = main_price_final;
	}
	$('.autocalc-product-price').html( price_format(main_price_start) );
	if (main_price_start != main_price_final) {
		main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
	}
}
function animateMainPrice(price) {
	main_price_start = main_price_final;
	main_price_final = price;
	main_step = (main_price_final - main_price_start) / 10;
	clearTimeout(main_timeout_id);
	main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
}
<?php if ($special) { ?>
	special_price_final = calculate_tax(<?php echo $special_value; ?>);
	special_price_start = calculate_tax(<?php echo $special_value; ?>);
	special_step = 0;
	special_timeout_id = 0;
	function animateSpecialPrice_callback() {
		special_price_start += special_step;
		if ((special_step > 0) && (special_price_start > special_price_final)){
			special_price_start = special_price_final;
		} else if ((special_step < 0) && (special_price_start < special_price_final)) {
			special_price_start = special_price_final;
		} else if (special_step == 0) {
			special_price_start = special_price_final;
		}
		$('.autocalc-product-special').html( price_format(special_price_start) );
		if (special_price_start != special_price_final) {
			special_timeout_id = setTimeout(animateSpecialPrice_callback, animate_delay);
		}
	}
	function animateSpecialPrice(price) {
		special_price_start = special_price_final;
		special_price_final = price;
		special_step = (special_price_final - special_price_start) / 10;
		clearTimeout(special_timeout_id);
		special_timeout_id = setTimeout(animateSpecialPrice_callback, animate_delay);
	}
	<?php } ?>
function recalculateprice()
{
	var main_price = <?php echo (float)$price_value; ?>;
	var input_quantity = Number($('input[name="quantity"]').val());
	var special = <?php echo (float)$special_value; ?>;
	var tax = 0;
	if (isNaN(input_quantity)) input_quantity = 0;
	<?php if ($special) { ?>
		special_coefficient = <?php echo ((float)$price_value/(float)$special_value); ?>;
		<?php } ?>
	main_price = process_discounts(main_price, input_quantity);
	tax = process_discounts(tax, input_quantity);
	var option_price = 0;
	<?php if ($points) { ?>
		var points = <?php echo (float)$points_value; ?>;
		$('input:checked,option:selected').each(function() {
			if ($(this).data('points')) points += Number($(this).data('points'));
		});
		$('.autocalc-product-points').html(points);
		<?php } ?>
	$('input:checked,option:selected').each(function() {
		if ($(this).data('prefix') == '=') {
			option_price += Number($(this).data('price'));
			main_price = 0;
			special = 0;
		}
	});
	$('input:checked,option:selected').each(function() {
		if ($(this).data('prefix') == '+') {
			option_price += Number($(this).data('price'));
		}
		if ($(this).data('prefix') == '-') {
			option_price -= Number($(this).data('price'));
		}
		if ($(this).data('prefix') == 'u') {
			pcnt = 1.0 + (Number($(this).data('price')) / 100.0);
			option_price *= pcnt;
			main_price *= pcnt;
			special *= pcnt;
		}
		if ($(this).data('prefix') == 'd') {
			pcnt = 1.0 - (Number($(this).data('price')) / 100.0);
			option_price *= pcnt;
			main_price *= pcnt;
			special *= pcnt;
		}
		if ($(this).data('prefix') == '*') {
			option_price *= Number($(this).data('price'));
			main_price *= Number($(this).data('price'));
			special *= Number($(this).data('price'));
		}
		if ($(this).data('prefix') == '/') {
			option_price /= Number($(this).data('price'));
			main_price /= Number($(this).data('price'));
			special /= Number($(this).data('price'));
		}
	});
	special += option_price;
	main_price += option_price;
	<?php if ($special) { ?>
		<?php if (empty($autocalc_option_special))  { ?>
			main_price = special * special_coefficient;
			<?php } else { ?>
			special = main_price / special_coefficient;
			<?php } ?>
		tax = special;
		<?php } else { ?>
		tax = main_price;
		<?php } ?>
	// Process TAX.
	main_price = calculate_tax(main_price);
	special = calculate_tax(special);
	<?php if (!$autocalc_not_mul_qty) { ?>
		main_price *= input_quantity;
		special *= input_quantity;
		tax *= input_quantity;
		<?php } ?>
	// Display Main Price
	animateMainPrice(main_price);
	<?php if ($special) { ?>
		animateSpecialPrice(special);
		<?php } ?>
}
$(document).ready(function() {
	$('input[type="checkbox"]').bind('change', function() { recalculateprice(); });
	$('input[type="radio"]').bind('change', function() { recalculateprice(); });
	$('select').bind('change', function() { recalculateprice(); });
	$quantity = $('input[name="quantity"]');
	$quantity.data('val', $quantity.val());
	(function() {
		if ($quantity.val() != $quantity.data('val')){
			$quantity.data('val',$quantity.val());
			recalculateprice();
		}
		setTimeout(arguments.callee, 250);
	})();
	recalculateprice();
});
//--></script>

<script type="text/javascript"><!--
function price_format(price)
{ 
    c = <?php echo (empty($autocalc_currency['decimals']) ? "0" : $autocalc_currency['decimals'] ); ?>;
    d = '<?php echo $autocalc_currency['decimal_point']; ?>'; // decimal separator
    t = '<?php echo $autocalc_currency['thousand_point']; ?>'; // thousands separator
    s_left = '<?php echo $autocalc_currency['symbol_left']; ?>';
    s_right = '<?php echo $autocalc_currency['symbol_right']; ?>';
    n = price * <?php echo $autocalc_currency['value']; ?>;
    i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 
    j = ((j = i.length) > 3) ? j % 3 : 0; 
    price_text = s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right; 
    <?php if (!empty($autocalc_currency2)) { ?>
    c = <?php echo (empty($autocalc_currency2['decimals']) ? "0" : $autocalc_currency2['decimals'] ); ?>;
    d = '<?php echo $autocalc_currency2['decimal_point']; ?>'; // decimal separator
    t = '<?php echo $autocalc_currency2['thousand_point']; ?>'; // thousands separator
    s_left = '<?php echo $autocalc_currency2['symbol_left']; ?>';
    s_right = '<?php echo $autocalc_currency2['symbol_right']; ?>';
    n = price * <?php echo $autocalc_currency2['value']; ?>;
    i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 
    j = ((j = i.length) > 3) ? j % 3 : 0; 
    price_text += '  <span class="currency2">(' + s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right + ')</span>'; 
    <?php } ?>
    return price_text;
}
function calculate_tax(price)
{
    <?php // Process Tax Rates
      if (isset($tax_rates) && $tax) {
         foreach ($tax_rates as $tax_rate) {
           if ($tax_rate['type'] == 'F') {
             echo 'price += '.$tax_rate['rate'].';';
           } elseif ($tax_rate['type'] == 'P') {
             echo 'price += (price * '.$tax_rate['rate'].') / 100.0;';
           }
         }
      }
    ?>
    return price;
}
function process_discounts(price, quantity)
{
    <?php
      foreach ($dicounts_unf as $discount) {
        echo 'if ((quantity >= '.$discount['quantity'].') && ('.$discount['price'].' < price)) price = '.$discount['price'].';'."\n";
      }
    ?>
    return price;
}
animate_delay = 20;
main_price_final = calculate_tax(<?php echo $price_value; ?>);
main_price_start = calculate_tax(<?php echo $price_value; ?>);
main_step = 0;
main_timeout_id = 0;
function animateMainPrice_callback() {
    main_price_start += main_step;
    if ((main_step > 0) && (main_price_start > main_price_final)){
        main_price_start = main_price_final;
    } else if ((main_step < 0) && (main_price_start < main_price_final)) {
        main_price_start = main_price_final;
    } else if (main_step == 0) {
        main_price_start = main_price_final;
    }
    $('.autocalc-product-price').html( price_format(main_price_start) );
    if (main_price_start != main_price_final) {
        main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
    }
}
function animateMainPrice(price) {
    main_price_start = main_price_final;
    main_price_final = price;
    main_step = (main_price_final - main_price_start) / 10;
    clearTimeout(main_timeout_id);
    main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
}
<?php if ($special) { ?>
special_price_final = calculate_tax(<?php echo $special_value; ?>);
special_price_start = calculate_tax(<?php echo $special_value; ?>);
special_step = 0;
special_timeout_id = 0;
function animateSpecialPrice_callback() {
    special_price_start += special_step;
    if ((special_step > 0) && (special_price_start > special_price_final)){
        special_price_start = special_price_final;
    } else if ((special_step < 0) && (special_price_start < special_price_final)) {
        special_price_start = special_price_final;
    } else if (special_step == 0) {
        special_price_start = special_price_final;
    }
    $('.autocalc-product-special').html( price_format(special_price_start) );
    if (special_price_start != special_price_final) {
        special_timeout_id = setTimeout(animateSpecialPrice_callback, animate_delay);
    }
}
function animateSpecialPrice(price) {
    special_price_start = special_price_final;
    special_price_final = price;
    special_step = (special_price_final - special_price_start) / 10;
    clearTimeout(special_timeout_id);
    special_timeout_id = setTimeout(animateSpecialPrice_callback, animate_delay);
}
<?php } ?>
function recalculateprice()
{
    var main_price = <?php echo (float)$price_value; ?>;
    var input_quantity = Number($('input[name="quantity"]').val());
    var special = <?php echo (float)$special_value; ?>;
    var tax = 0;
    if (isNaN(input_quantity)) input_quantity = 0;
    <?php if ($special) { ?>
        special_coefficient = <?php echo ((float)$price_value/(float)$special_value); ?>;
    <?php } ?>
    main_price = process_discounts(main_price, input_quantity);
    tax = process_discounts(tax, input_quantity);
    var option_price = 0;
    <?php if ($points) { ?>
      var points = <?php echo (float)$points_value; ?>;
      $('input:checked,option:selected').each(function() {
          if ($(this).data('points')) points += Number($(this).data('points'));
      });
      $('.autocalc-product-points').html(points);
    <?php } ?>
    $('input:checked,option:selected').each(function() {
      if ($(this).data('prefix') == '=') {
        option_price += Number($(this).data('price'));
        main_price = 0;
        special = 0;
      }
    });
    $('input:checked,option:selected').each(function() {
      if ($(this).data('prefix') == '+') {
        option_price += Number($(this).data('price'));
      }
      if ($(this).data('prefix') == '-') {
        option_price -= Number($(this).data('price'));
      }
      if ($(this).data('prefix') == 'u') {
        pcnt = 1.0 + (Number($(this).data('price')) / 100.0);
        option_price *= pcnt;
        main_price *= pcnt;
        special *= pcnt;
      }
      if ($(this).data('prefix') == 'd') {
        pcnt = 1.0 - (Number($(this).data('price')) / 100.0);
        option_price *= pcnt;
        main_price *= pcnt;
        special *= pcnt;
      }
      if ($(this).data('prefix') == '*') {
        option_price *= Number($(this).data('price'));
        main_price *= Number($(this).data('price'));
        special *= Number($(this).data('price'));
      }
      if ($(this).data('prefix') == '/') {
        option_price /= Number($(this).data('price'));
        main_price /= Number($(this).data('price'));
        special /= Number($(this).data('price'));
      }
    });
    special += option_price;
    main_price += option_price;
    <?php if ($special) { ?>
      <?php if (empty($autocalc_option_special))  { ?>
        main_price = special * special_coefficient;
      <?php } else { ?>
        special = main_price / special_coefficient;
      <?php } ?>
      tax = special;
    <?php } else { ?>
      tax = main_price;
    <?php } ?>
    // Process TAX.
    main_price = calculate_tax(main_price);
    special = calculate_tax(special);
    <?php if (!$autocalc_not_mul_qty) { ?>
    main_price *= input_quantity;
    special *= input_quantity;
    tax *= input_quantity;
    <?php } ?>
    // Display Main Price
    animateMainPrice(main_price);
    <?php if ($special) { ?>
      animateSpecialPrice(special);
    <?php } ?>
}
$(document).ready(function() {
    $('input[type="checkbox"]').bind('change', function() { recalculateprice(); });
    $('input[type="radio"]').bind('change', function() { recalculateprice(); });
    $('select').bind('change', function() { recalculateprice(); });
    $quantity = $('input[name="quantity"]');
    $quantity.data('val', $quantity.val());
    (function() {
        if ($quantity.val() != $quantity.data('val')){
            $quantity.data('val',$quantity.val());
            recalculateprice();
        }
        setTimeout(arguments.callee, 250);
    })();    
    recalculateprice();
});
//--></script>
      
<script src="catalog/view/theme/modern/js/elevatezoom/jquery.elevateZoom-3.0.8.min.js" type="text/javascript"></script>
<script type="text/javascript"><!--
$("#main-image").elevateZoom({gallery:'image-additional2', zoomEnabled: false });
$("#main-image").bind("click", function(e) { var ez = $('#main-image').data('elevateZoom');
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart_quickw').on('click', function() {
	$.ajax({
url: 'index.php?route=checkout/cart/add',
type: 'post',
data: $('#product_quickw input[type=\'text\'], #product_quickw input[type=\'hidden\'], #product_quickw input[type=\'radio\']:checked, #product_quickw input[type=\'checkbox\']:checked, #product_quickw select, #product_quickw textarea'),
dataType: 'json',
beforeSend: function() {
			$('#button-cart_quickw').button('loading');
		},
complete: function() {
			$('#button-cart_quickw').button('reset');
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
});
//--></script>
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
<!--review stars -->
<script type="text/javascript"><!--
$(".review_profile").click(function (){
	var tabTop = $(".nav-tabs").offset().top;
	$("html, body").animate({ scrollTop:tabTop }, 800);
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
</div></div>