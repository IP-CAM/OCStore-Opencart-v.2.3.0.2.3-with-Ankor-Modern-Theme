<?php echo $header; ?>
<div class="container">
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
<div id="content_news" class="<?php echo $class; ?>"><?php echo $content_top; ?>
<ul class="breadcrumb">
<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
	<li><?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { ?><?php echo $breadcrumb['text']; ?><?php } ?></li>
	<?php } ?>
</ul>
<?php if (isset($aridius_news_info)) { ?>
	<div class="content-news">
	<div class="news">
	<h1 class="title_center"><?php echo $heading_title; ?></h1>
	<?php echo $description; ?>
	</div>
	<br />
	<div>
	<?php if (!$addthis) { ?>
		<?php if (empty($modern_share)) { ?>
			<!-- AddThis Button BEGIN -->
			<div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
			<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
			<!-- AddThis Button END -->
			<?php } else { ?>
			<?php echo htmlspecialchars_decode($modern_share);?>
			<?php } ?>
		<?php } ?>
	</div>
	</div>
	<br />
	<?php if ($aridius_news_status_review !=1) { ?>
		<!-- Main form -->
		<hr>
        <div class="wrap_title"><span class="title_h title_center"><?php echo $text_news_review; ?></span></div>
		<form id="store-review" class="form-horizontal review_news-form">
		<?php if ($review_guest) { ?>
			<div class="review_shop"></div>
			<div class="form-group required">
			<div class="col-sm-12">
			<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
			<input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control"/>
			</div>
			</div>
			<div class="form-group required">
			<div class="col-sm-12">
			<label class="control-label" for="input-review_shop"><?php echo $entry_review; ?></label>
			<textarea name="text" rows="5" id="input-review_shop" class="form-control"></textarea>
			</div>
			</div>
			<?php echo $captcha; ?>
			<div class="buttons clearfix">
			<div class="pull-right">
			<button type="submit" data-loading-text="<?php echo $text_loading; ?>"  class="btn btn-primary add-review"><?php echo $button_continue; ?></button>
			</div>
			</div>
			<input type="hidden" name="parent" value="0">
			<?php } else { ?>
			<?php echo $text_login; ?>
			<br /><br />
			<?php } ?>
		</form>
		<!-- Echo reviews -->
		<div id="review_news"></div>
		<br />
		<?php } ?>
	<div class="clearfix"></div>
	<?php if ($products) { ?>
		<hr>
        <div class="wrap_title"><span class="title_h title_center"><?php echo $text_products_related; ?></span></div>
		<div class = "padding-carusel row">
		<div class = "relatedn owl-carousel">
		<?php foreach ($products as $key => $product) { ?>
			<div class="product-layoutcat">
			<div class="border product-thumb">
			<div id="imgCarousel-relatedn<?php echo $key ?>" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner" role="listbox">
			<div class="item active">
			<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive center-add_img" /></a>
			</div>
			<?php $html = '';?>
			<?php $img_key = 1;?>
			<?php $html .= '<li data-target="#imgCarousel-relatedn' . $key . '" data-slide-to="0" class="active"></li>'; ?>
			<?php foreach ($product['images'] as $image) { ?>
				<div class="item">
				<a href="<?php echo $product['href']; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive center-add_img" /></a>
				</div>
				<?php $html .= '<li data-target="#imgCarousel-relatedn' . $key . '" data-slide-to="' . $img_key . '"></li>'; ?>
				<?php $img_key++ ;?>
				<?php } ?>
			<?php if ($img_key > 1) { ?>
				<ol class="carousel-indicators">
				<?php echo $html;?>
				</ol>
				</div>
				<a class="left carousel-control" href="#imgCarousel-relatedn<?php echo $key ?>" role="button" data-slide="prev">
				<i class="fa fa-caret-left"></i>
				</a>
				<a class="right carousel-control" href="#imgCarousel-relatedn<?php echo $key ?>" role="button" data-slide="next">
				<i class="fa fa-caret-right"></i>
				</a>
				<?php } else { ?>
				</div>
				<?php } ?>
			</div>
			<script>
			$('#imgCarousel-relatedn<?php echo $key ?>').carousel({
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
		</div>
		<?php } ?>
	<?php if ($aridius_news) { ?>
		<hr>
        <div class="wrap_title"><span class="title_h title_center"><?php echo $text_aridius_news_related; ?></span></div>
		<div class = "padding-carusel row">
		<div class = "relatedn owl-carousel">
		<?php foreach ($aridius_news as $new) { ?>
			<?php $id_video;?>
			<?php $str=strpos($new['video'], "="); ?>
			<?php if ($str) { ?>
				<?php $str_end=strpos($new['video'], "&"); ?>
				<?php if ($str_end) { ?>
					<?php $id_video = substr($new['video'], $str+1 ,$str_end - $str-1); ?>
					<?php } else { ?>
					<?php $id_video = substr($new['video'], $str+1); ?>
					<?php } ?>
				<?php } ?>
			<div class="product-layoutcat">
			<div class="product-thumb transition">
			<?php if ($new['video']) { ?>
				<div class="fixnewsgrid video_cat"><iframe class="embed-responsive-item" src="https://www.youtube.com/embed/<?php echo $id_video; ?>" allowfullscreen></iframe></div>
				<?php } else { ?>
				<div class="image fixnewsgrid"><a href="<?php echo $new['href']; ?>"><img  src="<?php echo $new['image']; ?>" alt="" title="" class="img-responsive" /></a></div>
				<?php } ?>
			<div class="caption">
			<?php if (!$aridius_news_show_date) { ?>
				<i class="fa fa-clock-o"></i> <span class="posted-aridius_news"><?php echo $new['posted']; ?></span>
				<?php } ?>
			<h4 class="news_hr"><a href="<?php echo $new['href']; ?>"><?php echo $new['title']; ?></a></h4>
			<p class="newsdesc"><?php echo $new['description']; ?></p>
			<p><a href="<?php echo $new['href']; ?>"><i class="fa fa-link"></i> <span class ="morecolor"><?php echo $text_more; ?></span></a></p>
			</div>
			</div>
			</div>
			<?php } ?>
		</div></div>
		<?php } ?>
	<div class="buttons">
<!--        <div class="pull-right"><a href="--><?php //echo $aridius_newslist; ?><!--" class="btn-cart">--><?php //echo $button_news; ?><!--</a></div><br /><br />-->
        <div class="pull-right"><a href="<?php echo isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER']:'';  ?>" class="btn-cart"><?php echo $button_news; ?></a></div><br /><br />
	</div></div>
	<?php } elseif (isset($aridius_news_data)) { ?>
	<h1><?php echo $heading_title; ?></h1>
	<div class="clearfix">	</div>
	<div class="col-sm-12 catfl">
	<div class="row">
	<div class="col-sm-12">
	<div class="col-xs-12 col-sm-4 col-md-3 col-lg-2 navright">
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
	</div>
	</div>
	</div></div>
	<br />
	<div class="row">
	<?php foreach ($aridius_news_data as $aridius_news) { ?>
		<?php $id_video;?>
		<?php $str=strpos($aridius_news['video'], "="); ?>
		<?php if ($str) { ?>
			<?php $str_end=strpos($aridius_news['video'], "&"); ?>
			<?php if ($str_end) { ?>
				<?php $id_video = substr($aridius_news['video'], $str+1 ,$str_end - $str-1); ?>
				<?php } else { ?>
				<?php $id_video = substr($aridius_news['video'], $str+1); ?>
				<?php } ?>
			<?php } ?>
		<div class="product-layoutcat product-grid col-lg-3 col-md-3 col-sm-4 col-xs-6 cat_news">
		<div class="product-thumb">
		<?php if ($aridius_news['video']) { ?>
			<div class="fixnewsgrid video_cat"><iframe class="embed-responsive-item" src="https://www.youtube.com/embed/<?php echo $id_video; ?>" allowfullscreen></iframe></div>
			<?php } else { ?>
			<div class="image fixnewsgrid"><a href="<?php echo $aridius_news['href']; ?>" title="<?php echo $aridius_news['title']; ?>"><img src="<?php echo $aridius_news['thumb']; ?>" alt="<?php echo $aridius_news['title']; ?>" class="img-responsive" /></a>	</div>
			<?php } ?>
		<div class="list_block">
		<div class="caption caption-left">
		<?php if (!$aridius_news_show_date) { ?>
			<i class="fa fa-clock-o"></i> <span class="posted-aridius_news"><?php echo $aridius_news['posted']; ?></span>
			<?php } ?>
		<h4 class="news_hr"><a href="<?php echo $aridius_news['href']; ?>"><?php echo $aridius_news['title']; ?></a></h4>
		<p class="newsdesc"><?php echo $aridius_news['description']; ?></p>
		<p><a href="<?php echo $aridius_news['href']; ?>"><i class="fa fa-link"></i> <span class ="morecolor"><?php echo $text_more; ?></span></a></p>
		</div>
		</div>
		</div>
		</div>
		<?php } ?>
	</div>
	<div class="clearfix"></div>
	<div class="row">
	<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
	<div class="col-sm-6 text-right"><?php echo $results; ?></div>
	</div>
	<?php } ?>
<?php echo $content_bottom; ?>  </div>
<?php echo $column_right; ?></div></div></div>
<?php if (!isset($aridius_news_data)) { ?>
	<script type="text/javascript"><!--
	$('#review_news').delegate('.pagination a', 'click', function(e) {
		e.preventDefault();
		$('#review_news').fadeOut('slow');
		$('#review_news').load(this.href);
		$('#review_news').fadeIn('slow');
	});
	$('#review_news').load('index.php?route=information/aridius_news/review&aridius_news_id=<?php echo $aridius_news_id; ?>');
	$(document).on('submit','form.review_news-form',function(e){
		e.preventDefault();
		var $this=$(this);
		$.ajax({
url: 'index.php?route=information/aridius_news/write&aridius_news_id=<?php echo $aridius_news_id; ?>',
type: 'post',
dataType: 'json',
data: $this.serialize(),
beforeSend: function () {
				$this.find('.button-review').button('loading');
			},
complete: function () {
				$this.find('.button-review').button('reset');
			},
success: function (json) {
				$('.alert-success, .alert-danger').remove();
				if (json['error']) {
					$this.find('.review_shop').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				}
				if (json['success']) {
					$this.find('.review_shop').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
					$this.find('input[name=\'name\']').val('');
					$this.find('textarea[name=\'text\']').val('');
					$this.find('input[name=\'rating\']:checked').prop('checked', false);
					setTimeout(function(){ $('.reply-form').remove();},3000)
				}
			}
		});
	});
	$(document).on('click', '.cancel-review', function () {
		$('.reply-form').remove();
	});
	$(document).on('click', '.comment-reply', function () {
		var $this=$(this);
		$.post( "index.php?route=information/aridius_news/reply", { parent: $this.attr("data-parent") }, function( data ) {
			$('.reply-form').remove();
			$this.parent().append('<div class="reply-form">' + data.html + '</div>');
		}, "json");
	});
	//--></script>
	<?php } ?>
<!--related products -->
<script type="text/javascript"><!--
$('.relatedn').owlCarousel({
items : 5,
navigation: true,
navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
pagination: false,
paginationSpeed: 300,
slideSpeed: 200,
stopOnHover: true,
autoPlay: 5000,
});
//--></script>
<?php echo $footer; ?>