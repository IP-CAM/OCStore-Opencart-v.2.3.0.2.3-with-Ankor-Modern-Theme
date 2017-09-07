<?php if ($aridius_news) { ?>
	<div class="back_news">
	<div class="container">
	<div class="row ">
	<div class="col-sm-12">
	<div class="row mt">
	<div class="col-xs-12 col-sm-12 col-md-12 aridius_news_margin">
	<h3 class="title_h title_center title_news col-xs-6 col-sm-3 col-md-2"><?php echo $heading_title; ?></h3>
	<?php if ($showbutton) { ?>
		<div class="pull-center all_new"><a href="<?php echo $aridius_newslist; ?>"><?php echo $buttonlist; ?><span class="fa fa-angle-down menu"></span></a></div>
		<?php } ?>
	</div>
	<?php foreach ($aridius_news as $aridius_news_story) { ?>
		<div class="hide-news product-layoutcat col-xs-6 col-sm-4 col-md-4 col-lg-3">
		<?php if ($aridius_news_story['video']) { ?>
			<?php $id_video;?>
			<?php $str=strpos($aridius_news_story['video'], "="); ?>
			<?php if ($str) { ?>
				<?php $str_end=strpos($aridius_news_story['video'], "&"); ?>
				<?php if ($str_end) { ?>
					<?php $id_video = substr($aridius_news_story['video'], $str+1 ,$str_end - $str-1); ?>
					<?php } else { ?>
					<?php $id_video = substr($aridius_news_story['video'], $str+1); ?>
					<?php } ?>
				<?php } ?>
			<div class="grid-aridius_news video video_news">
			<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/<?php echo $id_video; ?>" allowfullscreen></iframe>
			</div>
			<?php } ?>
		<?php if ($aridius_news_story['image'] && !$aridius_news_show_img && !$aridius_news_story['video']) { ?>
			<div class="grid-aridius_news col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<a href="<?php echo $aridius_news_story['href']; ?>" title="<?php echo $aridius_news_story['title']; ?>"><img class="img-responsive aridius_news-hover" src="<?php echo $aridius_news_story['image']; ?>" alt="<?php echo $aridius_news_story['title']; ?>" /></a>
			</div>
			<?php } ?>
		<?php if (!$aridius_news_show_date) { ?>
			<p> <i class="fa fa-clock-o"></i> <span class="posted-aridius_news"><?php echo $aridius_news_story['posted']; ?></span></p>
			<?php } ?>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 aridius_news_h4">
		<div class="">
		<h4><a href="<?php echo $aridius_news_story['href']; ?>"><?php echo $aridius_news_story['title']; ?></a></h4>
		</div>
		<?php if (!$aridius_news_show_description) { ?>
			<div class="description-aridius_news">
			<p><?php echo $aridius_news_story['description']; ?></p>
			</div>
			<?php } ?>
		<div class="read-more">
		<a href="<?php echo $aridius_news_story['href']; ?>"><?php echo $text_more; ?>&nbsp;&rarr;</a>
		</div>
		</div>
		</div>
		<?php } ?>
	</div>
	<?php } ?>
</div></div></div></div>