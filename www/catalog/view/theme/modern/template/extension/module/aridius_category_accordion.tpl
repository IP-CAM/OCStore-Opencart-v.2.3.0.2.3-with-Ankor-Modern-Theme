<div class="box">
  <div class="box-heading"><h3 class="title_h title_center"><?php echo $heading_title; ?></h3></div>
  <div class="box-content">
    <div class="box-category">
      <ul class="accordion"  id="accordion">
        <?php foreach ($categories as $category) { ?>
        <li>
          <?php if ($category['category_id'] == $category_id) { ?>
          <a href="<?php echo $category['href']; ?>" class="active"><span class="carcat"><i class="carcat-arrow fa fa-caret-down"></i></span>&nbsp;&nbsp;<?php echo $category['name']; ?></a><div class="dcjq-icon">&nbsp;&nbsp;&nbsp;</div>
          <?php } else if($category['children']) { ?>
          <a href="<?php echo $category['href']; ?>"><span class="carcat2"><i class="carcat-arrow2 fa fa-caret-right"></i></span>&nbsp; <?php echo $category['name']; ?></a><div class="dcjq-icon">&nbsp;&nbsp;&nbsp;</div>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>"><span class="carcat2"><i class="carcat-arrow2 fa fa-caret-right"></i></span>&nbsp; <?php echo $category['name']; ?></a>
          <?php } ?>
          <?php if ($category['children']) { ?>
          <ul>
            <?php foreach ($category['children'] as $child) { ?>
            <li>
              <?php if ($child['category_id'] == $child_id) { ?>
              <a href="<?php echo $child['href']; ?>" class="active"><i class="fa fa-caret-down"></i> <?php echo $child['name']; ?></a><div class="dcjq-icon">&nbsp;&nbsp;&nbsp;</div>
              <?php } else { ?>
              <a href="<?php echo $child['href']; ?>"><i class="fa fa-caret-right"></i> <?php echo $child['name']; ?></a><div class="dcjq-icon">&nbsp;&nbsp;&nbsp;</div>
              <?php } ?>
<!--3lv-->	
				  <?php if($child['sister_id'])  { ?> 
				<ul>
					<?php foreach ($child['sister_id'] as $sisters) { ?>
						<li>
						<?php if ($sisters['category_id'] == $sisters_id) { ?>
						<a href="<?php echo $sisters['href']; ?>" class="active"> - <?php echo $sisters['name']; ?></a>
						<?php } else { ?>
						<a href="<?php echo $sisters['href']; ?>"> - <?php echo $sisters['name']; ?></a>
						<?php } ?>
						</li>
					<?php } ?>
				</ul>
				<?php } ?>
<!--3lv-->				
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function($){
	$('#accordion').dcAccordion({
		eventType: 'click',
	});
});
</script>