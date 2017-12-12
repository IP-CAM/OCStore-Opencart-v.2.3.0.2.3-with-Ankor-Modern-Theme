<?
/**
 * @var Template $this
 */
?>
<?php echo $header; ?>

<div class="container">
<div class="row">
<div id="cont" class="col-sm-12 product" itemscope itemtype="http://schema.org/Product">
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
<?php

if ($modern_top_links7 ) { ?>
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
		<div id="blockImages">
			<?=$imageView?>
		</div>

	</div>
	<?php if (($column_left || $column_right) && ($modern_top_links9)) { ?>
		<?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12 prod-btn-align'; ?>
	<?php } else { ?>
		<?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12 prod-btn-align'; ?>
	<?php } ?>
	<div class="<?php echo $class; ?>">
<?
if ($type_products == 0) {
	include_once 'product_info_prod.tpl';
}elseif ($type_products == 1) {
	include_once 'product_info_serv.tpl';
}

?>
		</div>
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 block_product">
	<? // УТП тянутся из файла
	if (false):?>
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
	<?endif;?>
	<?
	if ($file_utp)  {
		include $file_utp;
	}
	?>
</div>
</div></div></div>
    <hr>
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
<!--<script src="catalog/view/theme/modern/js/elevatezoom/jquery.elevatezoom.js" type="text/javascript"></script>-->
<script src="catalog/view/theme/modern/js/elevatezoom/jquery.elevateZoom-3.0.8.min.js" type="text/javascript"></script>
<script type="text/javascript"><!--
	function startImagesProduct() {

		$('#image-additional2 a').on('click', function (e) {
			e.preventDefault();
			var imagePath = $(this).data('zoomImage');
			$('#main-image')
				.data('zoomImage', imagePath)
		});
		$("#main-image").bind("click", function (e) {
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
			e.preventDefault();
		});
		//popup
		$('.imgpopcat').magnificPopup({
			type: 'image',
			gallery: {
				enabled: false
			},
		});
		//zoom
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
		//carusel
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
	}
jQuery(document).ready(function () {
	startImagesProduct();
});
//--></script>
<script type="text/javascript"><!--

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
    price_text += ' (' + s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right + ')';
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
	var lastCheckedOption;
	var productId = <?=$product_id?>;
    $('input[type="checkbox"]').bind('change', function(e) {
    	recalculateprice();
    });
    $('input[type="radio"]').bind('change', function(e) {
		if (changeOptionProductInProgress) {
			this.checked = false;
			lastCheckedOption.checked = true;
			lastCheckedOption.checked = true;
			return false;
		}
		lastCheckedOption = this;
    	recalculateprice();  changeOptionProduct(this, productId);
    });
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

<?php echo $footer; ?>