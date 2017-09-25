<?php echo $header; ?>
<?php echo $content_fluid; ?>
<div class="container">
<div class="row">
<div class="col-sm-12">
<?php if ($content_slleft) { ?><div class="col-xs-12 col-md-8 fixsl"> <?php echo $content_slleft; ?></div><?php } ?>
<?php if ($content_top1) { ?><div class="col-xs-6 col-sm-6 col-md-4 fixslbann"><?php echo $content_top1; ?></div><?php } ?>
<div class="col-xs-6  col-sm-6 col-md-4 fixslbann2"><?php echo $content_top2; ?></div>
</div>
</div>
</div>
<div class="container">
<div id="content">
<div class="row">
<div class="col-sm-12">
<?php echo $content_top; ?>
</div>
</div>
<div class="row">
<div class="col-sm-12">
<?php if ($content_bot1 || $content_bot2 || $content_bot3) { ?><hr><?php } ?>
<div class="row">
<div class="hidden-xs col-sm-4 ">
<?php echo $content_bot1; ?>
</div>
<div class="hidden-xs col-sm-4 ">
<?php echo $content_bot2; ?>
</div>
<div class="hidden-xs col-sm-4 ">
<?php echo $content_bot3; ?>
</div>
</div>
</div>
</div>
    <div class="row">
        <div class="col-sm-12">
            <?php echo $advantages; ?>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <?php echo $team; ?>
        </div>
    </div>
<div class="row">
<div class="col-sm-12">
<?php echo $content_bottom; ?>
</div>
</div>
</div>
</div>
<?php echo $footer; ?>