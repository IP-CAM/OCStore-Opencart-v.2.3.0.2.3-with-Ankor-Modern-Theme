<?php echo $header; ?>
<div class="container">
<div class="row">
<div id="prides" class="col-sm-12">
<?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
	<?php $class = 'col-sm-6'; ?>
	<?php } elseif ($column_left || $column_right) { ?>
	<?php $class = 'col-aridius'; ?>
	<?php } else { ?>
	<?php $class = 'col-sm-12'; ?>
	<?php } ?>
<div id="content_prides" class="<?php echo $class; ?>"><?php echo $content_top; ?>
<ul class="breadcrumb">
<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
	<li><?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { ?><?php echo $breadcrumb['text']; ?><?php } ?></li>
	<?php } ?>
</ul>
<?php if (isset($items)) { ?>
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
	<?php foreach ($items as $item) { ?>
		<div class="product-layoutcat product-grid col-lg-3 col-md-3 col-sm-4 col-xs-6 cat_news">
			<div class="product-thumb">
				<div class="image fixnewsgrid"><a href="<?php echo $item['href']; ?>" title="<?php echo $item['title']; ?>"><img src="<?php echo $item['thumb']; ?>" alt="<?php echo $item['title']; ?>" class="img-responsive" /></a>	</div>

				<div class="list_block">
					<div class="caption caption-left">
						<h4 class="news_hr"><a href="<?php echo $item['href']; ?>"><?php echo $item['title']; ?></a></h4>
						<p><a href="<?php echo $item['href']; ?>"><i class="fa fa-link"></i> <span class ="morecolor"><?php echo $text_more; ?></span></a></p>
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
<?php echo $footer; ?>