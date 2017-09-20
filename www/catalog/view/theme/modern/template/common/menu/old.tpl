<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 menu_adapt">
            <div class="top-menu">
                <div id="top-menu" >
                    <div class="nobackground">
                        <nav id="menu" class="navbar">
                            <div class="navbar-header"><span id="category"
                                                             class="visible-xs"><?php echo $text_category; ?></span>
                                <button type="button" class="btn btn-navbar navbar-toggle"
                                        data-toggle="collapse" data-target=".navbar-ex1-collapse"><i
                                        class="fa fa-bars"></i></button>
                            </div>
                            <div class="collapse navbar-collapse navbar-ex1-collapse menu_adapt_coll">
                                <ul class="nav navbar-nav">
                                    <?php if ($modern_ico_home != 1) { ?>
                                        <li><a href="<?php echo $base; ?>"><i
                                                    class="fa fa-home fa_homemenu"></i></a></li>
                                    <?php } ?>
                                    <?php if ($modern_ico_home_text != 1) { ?>
                                        <li>
                                            <a href="<?php echo $base; ?>"><?php echo $text_homel; ?></i></a>
                                        </li>
                                    <?php } ?>
                                    <?php if ($modern_seevmenu_menu != 1) { ?>
                                        <li class="dropdown hidev">
                                            <a class="with-child dropdown-toggle" <?php if (!empty($modern_link_menucatalog)) { ?> href="<?php echo $modern_link_menucatalog; ?>" <?php } ?>
                                               data-hover="dropdown" data-delay="1"
                                               data-close-others="false">
                                                <?php if ($modern_seevmenuico != 1) { ?>
                                                    <i class="fa fa-bars"></i>&nbsp;&nbsp;
                                                <?php } ?>
                                                <?php echo $modern_vmenu_menu[$language_id]; ?><span
                                                    class="fa fa-angle-down menu"></span>
                                            </a>
                                            <ul class="dropdown-menu multi-level" role="menu">
                                                <?php foreach ($categories as $category) { ?>
                                                    <?php if ($category['children']) { ?>
                                                        <li class="dropdown-submenu">
                                                            <a class="dr_menu" tabindex="-1"
                                                               href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?>
                                                                <span class="arrowvertmenu"></span></a>
                                                            <ul class="dropdown-menu2">
                                                                <?php if ($category['image_main'] && $modern_main_photos_menu != 1) { ?>
                                                                    <li>
                                                                        <a href="<?php echo $category['href']; ?>"><img
                                                                                class="image_main img-responsive"
                                                                                alt="<?php echo $category['name']; ?>"
                                                                                title="<?php echo $category['name']; ?>"
                                                                                src="<?php echo $category['image_main']; ?>"></a>
                                                                    </li>
                                                                <?php } ?>
                                                                <?php foreach ($category['children'] as $child) { ?>
                                                                    <li class="col-sm-4 mcol">
                                                                                            <span
                                                                                                class="hidden-xs"><?php if ($modern_photos_menu != 1 && (!empty($child['image2']))) { ?>
                                                                                                <a
                                                                                                    href="<?php echo $child['href']; ?>">
                                                                                                    <img
                                                                                                        class="vopmen img-responsive"
                                                                                                        src="<?php echo $child['image2']; ?>"
                                                                                                        alt="<?php echo $child['name']; ?>"
                                                                                                        title="<?php echo $child['name']; ?>">
                                                                                                    </a><?php } ?></span>
                                                                        <div class="clearfix"></div>
                                                                        <a class="submenu_main"
                                                                           href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                                                        <?php if (isset($child['children_lv3']) && $child['children_lv3']) { ?>
                                                                            <?php $v = 0; ?>
                                                                            <?php foreach ($child['children_lv3'] as $child_lv3) { ?>
                                                                                <?php $v++; ?>
                                                                                <?php if ($v > $modern_countvmenulv) break; ?>
                                                                                <a class="menuv_3lv "
                                                                                   href="<?php echo $child_lv3['href']; ?>">
                                                                                    &nbsp;&nbsp;- <?php echo $child_lv3['name']; ?></a>
                                                                                <?php if ($v > ($modern_countvmenulv - 1)) { ?>
                                                                                    <a class="menuv-allv"
                                                                                       href="<?php echo $child['href']; ?>"><?php echo $modern_seeall_menu[$language_id]; ?></a>
                                                                                <?php } ?>
                                                                            <?php } ?>
                                                                        <?php } ?>
                                                                    </li>

                                                                <?php } ?>
                                                            </ul>
                                                        </li>
                                                    <?php } else { ?>
                                                        <li class="v3hover"><a class="dr_menu"
                                                                               href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                                                        </li>
                                                    <?php } ?>
                                                <?php } ?>
                                            </ul>
                                        </li>
                                    <?php } ?>
                                </ul>
                                <div class="menu_mob_plus">
                                    <div class="hidem">
                                        <ul class="nav navbar-nav">
                                            <?php foreach ($categories as $category) { ?>
                                                <?php if ($category['children']) { ?>
                                                    <li class="plus"><i class="fa fa-plus"></i><i
                                                            class="fa fa-minus"></i></li>
                                                    <li class="item <?php if ($category['category_id'] == $category_id) {
                                                        echo 'activetopmenu';
                                                    } ?> dropdown">
                                                        <a
                                                            class="with-child dropdown-toggle"
                                                            href="<?php echo $category['href']; ?>"
                                                            data-hover="dropdown" data-delay="1"
                                                            data-close-others="false"><?php echo $category['name']; ?>
                                                            <span
                                                                class="fa fa-angle-down menu"></span>
                                                        </a>
                                                        <div class="dropdown-menu">
                                                            <div
                                                                class="dropdown-inner children-category">
                                                                <?php if ($category['image_main'] && $modern_main_photos_menu != 1) { ?>
                                                                    <a href="<?php echo $category['href']; ?>"><img
                                                                            class="image_main img-responsive"
                                                                            alt="<?php echo $category['name']; ?>"
                                                                            title="<?php echo $category['name']; ?>"
                                                                            src="<?php echo $category['image_main']; ?>"></a>
                                                                <?php } ?>
                                                                <?php foreach ($category['children'] as $child) { ?>
                                                                    <ul class="list-unstyled">
                                                                        <?php if (isset($child['children_lv3']) && $child['children_lv3']) { ?>
                                                                            <li class="with-child">
                                                                                                    <span
                                                                                                        class="hidden-xs hidden-sm"><?php if ($modern_photos_menu != 1 && (!empty($child['image2']))) { ?>
                                                                                                        <a
                                                                                                            href="<?php echo $child['href']; ?>">
                                                                                                            <img
                                                                                                                class="opacityhv img-responsive"
                                                                                                                src="<?php echo $child['image2']; ?>"
                                                                                                                alt="<?php echo $child['name']; ?>"
                                                                                                                title="<?php echo $child['name']; ?>">
                                                                                                            </a><?php } ?></span>
                                                                                <a href="<?php echo $child['href']; ?>"><span
                                                                                        class="style2lv"><?php echo $child['name']; ?></span></a>
                                                                            </li>
                                                                            <?php if ($modern_3lv_menu != 1) { ?>
                                                                                <?php $m = 0; ?>
                                                                                <?php foreach ($child['children_lv3'] as $child_lv3) { ?>
                                                                                    <?php $m++; ?>
                                                                                    <?php if ($m > $modern_countvmenulv) break; ?>
                                                                                    <li class="children_lv3">
                                                                                        <a href="<?php echo $child_lv3['href']; ?>">
                                                                                            &nbsp;&nbsp;- <?php echo $child_lv3['name']; ?></a>
                                                                                        <?php if ($m > ($modern_countvmenulv - 1)) { ?>
                                                                                            <a class="menuv-all"
                                                                                               href="<?php echo $child['href']; ?>"><?php echo $modern_seeall_menu[$language_id]; ?></a>
                                                                                        <?php } ?>
                                                                                    </li>
                                                                                <?php } ?>
                                                                            <?php } ?>
                                                                        <?php } else { ?>
                                                                            <li><?php if ($modern_photos_menu != 1 && (!empty($child['image2']))) { ?>
                                                                                    <span
                                                                                        class="hidden-xs hidden-sm">
                                                                                    <a href="<?php echo $child['href']; ?>"><img
                                                                                            class="opacityhv img-responsive"
                                                                                            src="<?php echo $child['image2']; ?>"
                                                                                            alt="<?php echo $child['name']; ?>"
                                                                                            title="<?php echo $child['name']; ?>"></a>
                                                                                    </span><?php } ?>
                                                                                <a href="<?php echo $child['href']; ?>"><span
                                                                                        class="style2lv"><?php echo $child['name']; ?></span></a>
                                                                            </li>
                                                                        <?php } ?>
                                                                    </ul>
                                                                <?php } ?>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </li>
                                                <?php } else { ?>
                                                    <li class="item <?php if ($category['category_id'] == $category_id) {
                                                        echo 'activetopmenu';
                                                    } ?>"><a
                                                            href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                                                    </li>
                                                <?php } ?>
                                            <?php } ?>
                                        </ul>
                                    </div>
                                    <ul class="nav navbar-nav">

                                        <?php if ($modern_top_links8) { ?>
                                            <?php foreach ($modern_top_links8 as $modern_top_link8) { ?>
                                                <li>
                                                    <a <?php if ($modern_top_link8['link_top'][$language_id]) { ?> href="<?php echo $modern_top_link8['link_top'][$language_id]; ?>"<?php } ?>><?php if ($modern_top_link8['faicons_top']) { ?>
                                                            <i class="<?php echo $modern_top_link8['faicons_top']; ?>"></i> <?php } ?><?php if ($modern_top_link8['title']) { ?><?php echo $modern_top_link8['title'][$language_id]; ?><?php } ?>
                                                    </a>
                                                </li>
                                            <?php } ?>
                                        <?php } ?>


                                        <?php if ($modern_main_link_menu[$language_id]) { ?>
                                            <li class="plus"><i class="fa fa-plus"></i><i
                                                    class="fa fa-minus"></i></li>
                                            <li class="dropdown"><a
                                                    class="with-child dropdown-toggle"
                                                    href="<?php echo $modern_main_link_href_menu[$language_id]; ?>"
                                                    data-hover="dropdown" data-delay="1"
                                                    data-close-others="false"><?php echo $modern_main_link_menu[$language_id]; ?>
                                                    <span class="fa fa-angle-down menu"></span></a>
                                                <div class="dropdown-menu">
                                                    <div class="dropdown-inner1 children-category">
                                                        <ul class="list-unstyled">
                                                            <?php if ($modern_top_links4) { ?>
                                                                <?php foreach ($modern_top_links4 as $modern_top_link4) { ?>
                                                                    <li>
                                                                        <a <?php if ($modern_top_link4['link_top'][$language_id]) { ?> href="<?php echo $modern_top_link4['link_top'][$language_id]; ?>"<?php } ?>
                                                                            title="<?php echo $modern_top_link4['title'][$language_id]; ?>"><?php if ($modern_top_link4['faicons_top']) { ?>
                                                                            <i class="<?php echo $modern_top_link4['faicons_top']; ?>"></i><?php } ?><?php if ($modern_top_link4['title']) { ?><?php echo $modern_top_link4['title'][$language_id]; ?><?php } ?>
                                                                        </a>
                                                                    </li>
                                                                <?php } ?>
                                                            <?php } ?>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                        <?php } ?>

                                        <?php if ($modern_info_menu != 1) { ?>
                                            <?php if ($informations) { ?>
                                                <li class="plus"><i class="fa fa-plus"></i><i
                                                        class="fa fa-minus"></i></li>
                                                <li class="dropdown"><a
                                                        class="with-child dropdown-toggle"
                                                        data-hover="dropdown" data-delay="1"
                                                        data-close-others="false"><?php echo $text_information; ?>
                                                        <span class="fa fa-angle-down menu"></span></a>
                                                    <div class="dropdown-menu">
                                                        <div
                                                            class="dropdown-inner1 children-category">
                                                            <ul class="list-unstyled">
                                                                <?php foreach ($informations as $information) { ?>
                                                                    <li>
                                                                        <a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
                                                                    </li>
                                                                <?php } ?>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </li>
                                            <?php } ?>
                                        <?php } ?>

                                        <?php if ($modern_man_menu != 1) { ?>
                                            <?php if ($manufacturers) { ?>
                                                <li class="plus"><i class="fa fa-plus"></i><i
                                                        class="fa fa-minus"></i></li>
                                                <li class="dropdown"><a
                                                        class="with-child dropdown-toggle"
                                                        href="<?php echo $href_manufacturer; ?>"
                                                        data-hover="dropdown" data-delay="1"
                                                        data-close-others="false"><?php echo $text_manufacturer; ?>
                                                        <span class="fa fa-angle-down menu"></span></a>
                                                    <div class="mancss dropdown-menu">
                                                        <div
                                                            class="dropdown-inner children-category">
                                                            <?php foreach ($manufacturers as $manufacturer) { ?>
                                                                <ul class="list-unstyled"
                                                                    style="width: <?php echo (100 / $modern_menuman_column) - 1; ?>%">
                                                                    <li><span
                                                                            class="hidden-xs hidden-sm "><?php if ($modern_photos_menu_manuf != 1) { ?>
                                                                            <a class="manufac-menu"
                                                                               href="<?php echo $manufacturer['href']; ?>"><img
                                                                                    class="opacityhv manimgmen"
                                                                                    src="<?php echo $manufacturer['manufacturer_image']; ?>"
                                                                                    alt="<?php echo $manufacturer['name']; ?>"
                                                                                    title="<?php echo $manufacturer['name']; ?>"></a></span><?php } ?>
                                                                        <a class="manufac-menu"
                                                                           href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a>
                                                                    </li>
                                                                </ul>
                                                            <?php } ?>
                                                        </div>
                                                    </div>
                                                </li>
                                            <?php } ?>
                                        <?php } ?>

                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
