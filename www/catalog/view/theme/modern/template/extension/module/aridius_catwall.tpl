<div class="catwall row">
<?php if ($child_visible) { ?>
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<h3 class="title_h title_center"><?php echo $heading_title; ?></h3>
	<ul class="nav nav-tabs mod">
	<?php foreach ($categories as $key =>$category) { ?>
		<?php if ($key == 0) { ?>
			<li class="active col-xs-12 tab_padding"><a href="#tab_catwall<?php echo $key+1 ?>" data-toggle="tab" ><?php echo $category['name']; ?> <i class="fa fa-caret-down hidden"></i></a></li>
			<?php } else { ?>
			<li class="col-xs-12 tab_padding"><a href="#tab_catwall<?php echo $key+1 ?>" data-toggle="tab" ><?php echo $category['name']; ?> <i class="fa fa-caret-down hidden"></i></a></li>
			<?php } ?>
		<?php } ?>
	</ul>
	<div class="tab-content">
	<?php foreach ($categories as $key =>$category) { ?>
		<?php if ($key == 0) { ?>
			<div id="tab_catwall<?php echo $key+1 ?>" class="tab-pane fade in active">
			<?php } else { ?>
			<div id="tab_catwall<?php echo $key+1 ?>" class="tab-pane fade in">
			<?php } ?>
		<?php if ($category['children']) { ?>
			<?php foreach ($category['children'] as $child) { ?>
				<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 block_catwall">
				<?php if ($add_img == '1') { ?>
					<div class="product-thumbcw transition col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="image"><a href="<?php echo $child['href']; ?>"><img src="<?php echo $child['image']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" class="img-responsive" /></a></div>
					</div>
					<?php } ?>
				<div class="namelink col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<a class="linkchild" href="<?php echo $child['href']; ?>"><h4><?php echo $child['name']; ?></h4></a>
				<!--3lv-->
				<?php if($child['sister_id'])  { ?>
					<?php foreach ($child['sister_id'] as $sisters) { ?>
						<div class="linksister"><a href="<?php echo $sisters['href']; ?>"><i class="fa fa-angle-right"></i> <?php echo $sisters['name']; ?></a></div>
						<?php } ?>
					<div class="link_seall"><a href="<?php echo $child['href']; ?>"><?php echo $Seeall; ?>&nbsp;&rarr;</a></div>
					<?php } ?>
				</div>
				<!--3lv-->
				</div>
				<?php } ?>
			<?php } ?>
		</div>
		<?php } ?>
	</div>
	</div>
	<?php } else { ?>
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<h3 class="title_center col-lg-12 col-md-12 col-sm-12 col-xs-12"><?php echo $heading_title; ?></h3>
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<?php foreach ($categories as $category) { ?>
		<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 block_catwall">
		<?php if ($add_img == '1') { ?>
			<div class="product-thumbcw transition col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></a></div>
			</div>
			<?php } ?>
		<div class="namelink col-lg-6 col-md-6 col-sm-6 col-xs-12">
		<a class="linkchild" href="<?php echo $category['href']; ?>"> <h4><?php echo $category['name']; ?></h4></a>
		<!--3lv-->
		<?php if($category['children'])  { ?>
			<?php foreach ($category['children'] as $child) { ?>
				<div class="linksister"><a href="<?php echo $child['href']; ?>"><i class="fa fa-angle-right"></i> <?php echo $child['name']; ?></a></div>
				<?php } ?>
			<div class="link_seall"><a href="<?php echo $category['href']; ?>"><?php echo $Seeall; ?>&nbsp;&rarr;</a></div>
			<?php } ?>
		</div>
		</div>
		<?php } ?></div></div>
	<?php } ?>
</div>
<script>
$(function() {
	$('li.active .fa-caret-down').removeClass('hidden');
	$('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
		$(this).find('.fa-caret-down').removeClass('hidden');
	});
	$('a[data-toggle="tab"]').on('hide.bs.tab', function (e) {
		$(this).find('.fa-caret-down').addClass('hidden');
	});
});
</script>