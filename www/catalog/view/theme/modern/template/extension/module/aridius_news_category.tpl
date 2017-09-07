<div class="groupcat">
<h3 class="title_h title_center inl"><?php echo $heading_title; ?></h3>
<?php if ($showbutton) { ?>
	<div class="buttonsall_news">
	<div class="pull-right"><a href="<?php echo $aridius_newslist; ?>"><i class="fa fa-caret-right"></i>&nbsp;<?php echo $text_all_news; ?></a></div>
	</div>
	<?php } ?>
</div>
<div class="row">
<?php foreach ($news as $new) { ?>
	<div class="product-layout news_cat col-lg-3 col-md-3 col-sm-6 col-xs-12">
	<div class="product-thumbleft transition ">
	<?php if ($new['video']) { ?>
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
		<div class="grid-aridius_news video video_news">
		<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/<?php echo $id_video; ?>" allowfullscreen></iframe>
		</div>
		<?php } ?>
	<?php if (!$new['video']) { ?>
		<div class="image"><a href="<?php echo $new['href']; ?>"><img src="<?php echo $new['thumb']; ?>" alt="<?php echo $new['title']; ?>" title="<?php echo $new['title']; ?>" class="img-responsive" /></a></div>
		<?php } ?>
	<div class="caption">
	<?php if ($new['aridius_news_id'] == $aridius_news_id) { ?>
		<h4 class="hstyle"><a href="<?php echo $new['href']; ?>" class="active"><?php echo $new['title']; ?></a></h4>
		<?php } else { ?>
		<h4 class="hstyle"><a href="<?php echo $new['href']; ?>"><?php echo $new['title']; ?></a></h4>
		<?php } ?>
	<p><?php echo $new['description']; ?></p>
	</div>
	</div>
	</div>
	<?php } ?>
</div>