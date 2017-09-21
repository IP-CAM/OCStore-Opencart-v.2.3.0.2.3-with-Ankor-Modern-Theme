<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li> <a href="<?php echo $breadcrumb['href']; ?>"> <?php echo $breadcrumb['text']; ?> </a> </li>
    <?php } ?>
  </ul>
    <div class="row">
        <div class="col-sm-12">
            <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
                <h1><?php echo $heading_title; ?></h1>
                <? foreach ($manufacturers as $manufacturer):?>
                    <h2 class="title_brands"><?php echo $manufacturer['name']; ?></h2>
                    <div class="row content_brands">
                        <div class="col-sm-2">
                            <div class="img_brands">
                                <img src="<?php echo $manufacturer['image']; ?>" alt="alt">
                            </div>
                        </div>
                        <div class="col-sm-10">
                            <div class="description_brands">
                                <span><?php echo $manufacturer['description']; ?></span>
                            </div>
                        </div>
                    </div>
                    <hr>
                <?endforeach;?>
                </div>
            </div>
        </div>
    </div>
<?php echo $footer; ?>