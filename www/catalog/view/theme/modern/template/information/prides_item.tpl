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
<div id="content_news" class="<?php echo $class; ?>"><?php echo $content_top; ?>
<ul class="breadcrumb">
<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
	<li><?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { ?><?php echo $breadcrumb['text']; ?><?php } ?></li>
	<?php } ?>
</ul>
<?php if (isset($item)) { ?>
	<div class="content-news">
	<div class="news">
	<h1 class="title_center"><?php echo $heading_title; ?></h1>
	<?php echo $description; ?>
	</div>
	<br />
	</div>
	<br />
	<div class="clearfix"></div>
	<div class="row">
		<?foreach ($images as $image):?>
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<div class="thumbnail"><a href="<?=$image['popup']?>" alt="<?=$item['title']?>"><img
							src="<?=$image['thumb']?>" alt="<?=$item['title']?>"></a></div>
			</div>
		<?endforeach;?>
	</div>

	<script type="text/javascript"><!--
		$(document).ready(function () {
			$('.thumbnail').magnificPopup({
				type: 'image',
				delegate: 'a',
				gallery:{
					enabled:true
				}
			});
		});
		//--></script>
<?php echo $content_bottom; ?>  </div>
<?php echo $column_right; ?></div></div></div>
<?php } ?>

<?php echo $footer; ?>