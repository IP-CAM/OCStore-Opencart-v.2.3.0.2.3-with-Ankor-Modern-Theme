<?php if ((!empty($column_left) ||$modern_product_show_infoblock ==1) && ($special && $special_date_end > $special_date_start)&&($modern_product_timer !=1)) { ?>
    <div class="special-timer-all">
        <div class = "text-time"><?php echo $text_end_stock; ?></div>
        <div class = "special-timere-zone">
            <div id = "time_out_pr"></div>
        </div>
    </div>
<?php } ?>
<div class="prmain">
    <div class="positionsticker">
        <!-- special -->
        <?php if ($modern_sticker_sale_product_auto !=1 && $special) { ?>
            <div class="stickers-special"><span class="diamont_st">-<?php echo $saving_product; ?>%</span></div>
        <?php } ?>
        <!-- special END -->
        <!-- new -->
        <?php
        $startDate1 = strtotime(mb_substr($dateadded, 0, 10));
        $endDate2 = strtotime(date("Y-m-d"));
        $days = ceil(($endDate2 / 86400)) - ceil(($startDate1 / 86400));
        ?>
        <?php if($modern_sticker_new_product_auto !=1 && $days < $modern_sticker_product_new_day || $modern_sticker_new_product_auto !=0 && $stickers == 1) { ?>
            <div class="stickers-new"><span class="diamont_st"><?php echo $modern_name_sticker_product_new[$language_id]; ?></span></div>
        <?php } ?>
        <!-- new END -->
        <!-- top -->
        <?php if ($modern_sticker_top_product_auto !=1 && $modern_sticker_product_top_ratinr == 1 && $rating == $modern_sticker_product_top_rating || $modern_sticker_top_product_auto !=1 && $modern_sticker_product_top_ratinr == 2 && $viewed >  $modern_sticker_product_top_viewed || $modern_sticker_top_product_auto !=0 && $stickers == 2 ) { ?>
            <div class="stickers-top"><span class="diamont_st"><?php echo $modern_name_sticker_product_top[$language_id]; ?></span></div>
        <?php } ?>
        <!-- top END -->
    </div>
    <?php if ($thumb || $images) { ?>
    <ul class="thumbnails">
        <?php if ($thumb) { ?>
            <li><a class="thumbnail imglink" style="position: relative;" itemprop="image" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>">
                    <img id="main-image" style="position: relative;" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $popup; ?>" /></a></li>
        <?php } ?>
    </ul>
</div>
    <div class="rowimg">
        <div id="image-additional2">
            <?php if ($images) { ?>
                <div id="additional" class="owl-carousel">
                    <div class="image-additional"><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" data-image="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>">
                            <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" ></a></div>
                    <?php foreach ($images as $image) { ?>
                        <div class="image-additional"><a class="thumbnail imglink" href="<?php echo $image['popup']; ?>" data-image="<?php echo $image['thumb2']; ?>" data-zoom-image="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" >
                                <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>
                    <?php } ?>
                </div>
            <?php } ?>
        </div>
    </div>
<?php } ?>
