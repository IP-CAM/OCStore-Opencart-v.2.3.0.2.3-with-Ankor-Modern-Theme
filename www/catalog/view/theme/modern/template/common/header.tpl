<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="format-detection" content="telephone=no" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title;  ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
<?php if ($keywords) { ?>
	<meta name="keywords" content= "<?php echo $keywords; ?>" />
	<?php } ?>
<script src="catalog/view/theme/modern/js/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/theme/modern/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/theme/modern/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/modern/stylesheet/skins/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/modern/stylesheet/skins/modern.css" rel="stylesheet">
<link href="catalog/view/theme/modern/js/jquery/owl-carousel/owl.carousel.css" rel="stylesheet" type="text/css" />
<script src="catalog/view/theme/modern/js/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/magnific/magnific-popup.css" rel="stylesheet">
	<link href="catalog/view/theme/modern/stylesheet/animate.min.css" rel="stylesheet" type="text/css" />

<meta property="og:site_name" content="<?php echo $name; ?>" />
<?php foreach ($styles as $style) { ?>
	<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>
<script src="catalog/view/theme/modern/js/common.js" type="text/javascript"></script>
<script src="catalog/view/theme/modern/js/main.js" type="text/javascript"></script>
<script src="catalog/view/theme/modern/js/aridius/aridiusquickview.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>
<?php foreach ($scripts as $script) { ?>
	<script src="<?php echo $script; ?>" type="text/javascript"></script>
	<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
	<?php echo $analytic; ?>
	<?php } ?>
<style>
<?php echo $modern_css; ?>
.back_news {
<?php if (empty($footer_back)) { ?>
background: #<?php echo $modern_main_background_color ?>;
<?php } else { ?>
background: url('<?php echo $footer_back; ?>');
<?php } ?>
}
.back_articles {
<?php if (empty($footer_back2)) { ?>
background: #<?php echo $modern_main_background_color ?>;
<?php } else { ?>
background: url('<?php echo $footer_back2; ?>');
<?php } ?>
}
.form_mail  {
<?php if (empty($letters_back)) { ?>
background: #<?php echo $modern_main_background_color ?>;
<?php } else { ?>
background: url('<?php echo $letters_back; ?>');
<?php } ?>
}
<?php if ($modern_seevmenu_menu !=1) { ?>
@media (min-width: 992px) {
.hidem{
display: none!important;
}
}
<?php } ?>
#top, .footer, footer, .nav-tabs.mod>li.active>a, .nav-tabs.mod>li.active>a:focus, .nav-tabs.mod>li.active>a:hover, #product-tab .nav-tabs.mod > li.active > a, #product-tab .nav-tabs.mod > li.active > a:focus, #product-tab .nav-tabs.mod > li.active > a:hover  {
background: #<?php echo $modern_main_background_color ?>;
}
@media (max-width: 991px) and (min-width: 768px) {
#menu {
background: #<?php echo $modern_main_background_color ?>;
}

#menu .nav > li > a, #menu .plus, .top-menu .dropdown-menu a {
color: #<?php echo $modern_main_color_text ?>!important;
}
}
#menu .btn-navbar, .fa.fa-bars {
border-color: #<?php echo $modern_main_color_text ?>;
}
#menu #category, #top-links2 a, #top .btn-link, #top-links a, .nav-tabs.mod>li.active>a, .nav-tabs.mod>li.active>a:focus, .nav-tabs.mod>li.active>a:hover, .inline_email, footer h5, .footer_socialpay  {
color: #<?php echo $modern_main_color_text ?>;
}
.diamont_seti {
border: 3px solid #<?php echo $modern_main_color_text ?>;
}
.log {
border-right: 2px solid #<?php echo $modern_main_color_text ?>;
}
.current_col, .log a {
color: #<?php echo $modern_main_color_text2 ?>!important;
}
.aboutus_footer, .footer_h5, footer .list-unstyled li, footer .list-unstyled li a, .copyrightf {
color: #<?php echo $modern_main_color_text3 ?>;
}
.btn-instock, .btn-instock2, .btn-cartpr, .btn-cart, .btn-primary, .btn-default {
background: #<?php echo $modern_background_btn ?>;
border: 1px solid #<?php echo $modern_text_color_border_btn ?>;
color: #<?php echo $modern_text_color_btn ?>;
}
.button_email {
background: #<?php echo $modern_background_btn ?>;
color: #<?php echo $modern_text_color_btn ?>;
}
.btn-instock:hover, .btn-instock2:hover, .btn-cartpr:hover, .btn-cart:hover, .btn-primary:hover, .btn-default:hover {
background: #<?php echo $modern_background_btn_hover ?>;
border: 1px solid #<?php echo $modern_text_color_border_btn_hover ?>;
color: #<?php echo $modern_text_color_btn_hover ?>;
}
.circleout {
background: #<?php echo $modern_color_callback ?>;
}
.circle {
box-shadow: 0 0 8px 35px #<?php echo $modern_color_callback ?>;
}
.back_news .fa-clock-o, .back_news .posted-aridius_news, .back_news .description-aridius_news p, .back_news .read-more a {
color: #<?php echo $modern_color_text_news ?>;
}
.back_news .title_center, .back_news .pull-center a, .back_news a {
color: #<?php echo $modern_color_tittle_news ?>;
}
</style>
	<link href="catalog/view/theme/modern/stylesheet/dist/main.css" rel="stylesheet" type="text/css" />
</head>
<body class="<?php echo $class; ?>">
<?php if ($modern_arrowup !=1) { ?>
	<span class="visible-md visible-lg"><a href="#" class="scup"><i class="fa fa-angle-up active"></i></a></span>
	<?php } ?>
<div id="addtocart" class="modal fade">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
</div>
<div class="modal-body">
<p></p>
</div>
<div class="modal-footer">
<button type="button" class="btn-cart" data-dismiss="modal"><?php echo $text_continue; ?></button>
<a href="<?php echo $checkout; ?>" class="btn-cart"><?php echo $text_checkout; ?></a>
</div>
</div>
</div>
</div>
<div id="wishlist" class="modal fade">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
</div>
<div class="modal-body">
<p></p>
</div>
<div class="modal-footer">
<button type="button" class="btn-cart" data-dismiss="modal"><?php echo $text_continue2; ?></button>
<a href="<?php echo $wishlist; ?>" class="btn-cart"><?php echo $text_wishlist2; ?></a>
</div>
</div>
</div>
</div>
<div id="compare" class="modal fade">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
</div>
<div class="modal-body">
<p></p>
</div>
<div class="modal-footer">
<button type="button" class="btn-cart" data-dismiss="modal"><?php echo $text_continue2; ?></button>
<a href="<?php echo $compare; ?>" class="btn-cart"><?php echo $text_compare2; ?></a>
</div>
</div>
</div>
</div>

<?php if (!$modern_header_var) { ?>
	<nav id="top">
	<?php } else { ?>
	<nav id="top" class="bottom_menu">
	<?php } ?>

<div class="container nobackground">
	<nav class="navbar navbar-toggleable-md navbar-light bg-faded">

        <button type="button" class=" btn btn-navbar navbar-toggler navbar-toggler-left hidden-sm hidden-md hidden-lg" data-toggle="collapse" data-target="#navbarNav"><i class="fa fa-bars"></i></button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="nav navbar-nav">
				<div id="top-links2" class="nav pull-left">
					<ul class="list-inline top">
						<?php if ($modern_top_links6 ) { ?>
						<?php foreach ($modern_top_links6 as $modern_top_link6) { ?>
						<li>
                            <a <?php if ($modern_top_link6['link_top'][$language_id]) { ?> href="<?php echo $modern_top_link6['link_top'][$language_id]; ?>"<?php } ?> title="<?php echo $modern_top_link6['title'][$language_id]; ?>"><?php if ($modern_top_link6['faicons_top']) { ?> <i class="<?php echo $modern_top_link6['faicons_top']; ?> hidden-lg hidden-md"></i><?php } ?><?php if ($modern_top_link6['title']) { ?><span class=""> <?php echo $modern_top_link6['title'][$language_id]; ?></span><?php } ?></a>
                        </li>
						<?php } ?>
						<?php } ?>
					</ul>
				</div>
			</ul>

            <ul class="nav navbar-nav navbar-right">
            <div id="top-links" class="nav pull-right">
                <ul class="list-inline top">
                    <?php if ($modern_account_top !=1) { ?>
                        <?php if ($logged) { ?>
                            <div id="top-links" class="nav pull-right">
                                <ul class="list-inline">
                                    <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
                                        <ul class="dropdown-menu dropdown-menu-right">
                                            <?php if ($logged) { ?>
                                                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                                <?php if ($modern_order_top !=1) { ?><li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li><?php } ?>
                                                <?php if ($modern_transaction_top !=1) { ?> <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li><?php } ?>
                                                <?php if ($modern_download_top !=1) { ?><li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li><?php } ?>
                                                <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                                            <?php } else { ?>
                                                <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                                                <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                                            <?php } ?>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        <?php } else { ?>
                            <li><img src="catalog/view/theme/modern/image/shablon/key_header.png" alt="key"></li>
                            <li class="log"><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                            <li class="reg"><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                        <?php } ?>
                    <?php } ?>
                    <?php if ($modern_cart_top !=1) { ?><li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart hidden-lg hidden-md"></i> <span class="hidden-xs hidden-sm "><?php echo $text_shopping_cart; ?></span></a></li><?php } ?>
                    <?php if ($modern_checkout_top !=1) { ?> <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share hidden-lg hidden-md"></i> <span class="hidden-xs hidden-sm "><?php echo $text_checkout; ?></span></a></li><?php } ?>
                </ul>
            </div>
            </ul>
		</div>

	</nav>
</div>



</nav>

<?php if (!$modern_header_var) { ?>
	<div class="top-header"  >
	<div class="container">
	<div class="row">
	<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 navcentr">
        <div id="logo">
          <?php if ($logo) { ?>
            <?php if ($home == $og_url) { ?>
              <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
            <?php } else { ?>
              <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
            <?php } ?>
          <?php } else { ?>
            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
	</div>
	<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
	<div class="row height_search_tel">
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 fn_header">
	<?php if ($modern_telephone_mainheader2[$language_id] || $modern_telephone_mainheader[$language_id]) { ?>
		<table class="table">
		<tbody>
		<tr>
		<td class="fa_table" rowspan="2"><div class="circleout2"><i class="fa fa-phone"></i></div></td>
		<td><div class="listunstyled"><span class="tell_nav"><?php echo $modern_telephone_mainheader2[$language_id]; ?></span></div></td>
		</tr>
		<tr>
		<td><?php if ($modern_top_links3 || $modern_top_links5 || $modern_mail_header[$language_id] ) { ?>
			<div class="dropdown">
			<div class="listunstyled dropdown-toggle" data-toggle="dropdown"><span class="tell_nav"><?php echo $modern_telephone_mainheader[$language_id]; ?></span><b class="caret"></b></div>
			<ul class="dropdown-menu fixxsmenu">
			<?php if ($modern_top_links3 ) { ?>
				<?php foreach ($modern_top_links3 as $modern_top_link3) { ?>
					<li>
					<div class="drop_head_first"><?php echo $modern_top_link3['name'][$language_id]; ?></div>
					<a <?php if ($modern_top_link3['title'][$language_id]) { ?> href="tel:<?php echo $modern_top_link3['title'][$language_id]; ?>"<?php } ?> ><?php if ($modern_top_link3['faicons_top']) { ?><i class="<?php echo $modern_top_link3['faicons_top']; ?>"></i><?php } ?> <?php echo html_entity_decode ($modern_top_link3['title'][$language_id], ENT_QUOTES, 'UTF-8'); ?></a>
					</li>
					<?php } ?>
				<?php } ?>
			<?php if ($modern_top_links5 ) { ?>
				<?php foreach ($modern_top_links5 as $modern_top_link5) { ?>
					<li>
					<div class="drop_head"><?php echo $modern_top_link5['name'][$language_id]; ?></div>
					<a <?php if ($modern_top_link5['title'][$language_id]) { ?> href="callto:<?php echo $modern_top_link5['title'][$language_id]; ?>"<?php } ?> ><?php if ($modern_top_link5['faicons_top']) { ?><i class="<?php echo $modern_top_link5['faicons_top']; ?>"></i><?php } ?> <?php echo html_entity_decode ($modern_top_link5['title'][$language_id], ENT_QUOTES, 'UTF-8'); ?></a>
					</li>
					<?php } ?>
				<?php } ?>
			<?php if ($modern_mail_header[$language_id] ) { ?>
				<li>
				<div class="drop_head"><?php echo $modern_tittle_name[$language_id];?></div>
				<a onClick="javascript:window.open('mailto:<?php echo $modern_mail_header[$language_id];?>', 'Mail');event.preventDefault()" href="<?php echo $modern_mail_header[$language_id];?>"><i class="fa fa-envelope-o "></i> <?php echo $modern_mail_header[$language_id];?></a></li>
				<?php } ?>
			<li>
			<?php if ($aridiuscallback_status && $modern_calltop !=1) { ?>
				<div class="drop_head"></div>
				<a class = "call-order"><i class="<?php echo $modern_top_link3['faicons_top']; ?>"></i>&nbsp;<?php echo $button_title; ?></a>
				<?php } ?>
			</li>
			</ul>
			</div>
			<?php } else { ?>
			<div class="phone">
			<div class="listunstyled"><span class="tell_nav"><?php echo $modern_telephone_mainheader[$language_id]; ?></span></div>
			</div>
			<?php } ?></td>
		</tr>
		</tbody>
		</table>
		<?php } ?>
	</div>
		<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 head_search">
			<button class="button_title input-group" data-callback="on">&nbsp;Заказать обратный звонок</button>
		</div>
	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 head_search">
	<?php echo $search; ?>
	</div>
	</div>
	<!--<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 menu_adapt">
	<div class="top-menu">
	<div id="top-menu" >
	<div class="nobackground">
	<nav id="menu" class="navbar">
	<div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
	<button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
	</div>
	<div class="collapse navbar-collapse navbar-ex1-collapse menu_adapt_coll">
	<ul class="nav navbar-nav">
	<?php if ($modern_ico_home !=1) { ?>
		<li><a href="<?php echo $base; ?>"><i class="fa fa-home fa_homemenu"></i></a></li>
		<?php } ?>
	<?php if ($modern_ico_home_text !=1) { ?>
		<li><a href="<?php echo $base; ?>"><?php echo $text_homel; ?></i></a></li>
		<?php } ?>
	<?php if ($modern_seevmenu_menu !=1) { ?>
		<li class="dropdown hidev"><a class="with-child dropdown-toggle" <?php if (!empty($modern_link_menucatalog)) { ?> href="<?php echo $modern_link_menucatalog; ?>" <?php } ?> data-hover="dropdown" data-delay="1" data-close-others="false">
		<?php if ($modern_seevmenuico !=1) { ?>
			<i class="fa fa-bars"></i>&nbsp;&nbsp;
			<?php } ?>
		<?php echo $modern_vmenu_menu[$language_id]; ?><span class="fa fa-angle-down menu"></span></a>
		<ul class="dropdown-menu multi-level" role="menu">
		<?php foreach ($categories as $category) { ?>
			<?php if ($category['children']) { ?>
				<li class="dropdown-submenu" >
				<a class="dr_menu" tabindex="-1" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?><span class="arrowvertmenu"></span></a>
				<ul class="dropdown-menu2">
				<?php if ($category['image_main'] && $modern_main_photos_menu !=1) { ?>
					<li><a href="<?php echo $category['href']; ?>"><img class="image_main img-responsive" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" src="<?php echo $category['image_main']; ?>"></a>	</li>
					<?php } ?>
				<?php foreach ($category['children'] as $child) { ?>
					<li class="col-sm-4 mcol">
					<span class = "hidden-xs"><?php if ($modern_photos_menu !=1 && (!empty($child['image2']))) { ?><a href="<?php echo $child['href']; ?>"><img class="vopmen img-responsive" src="<?php echo $child['image2']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" ></a><?php } ?></span>
					<div class="clearfix"></div>
					<a class="submenu_main" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
					<?php if (isset($child['children_lv3']) && $child['children_lv3']) { ?>
						<?php $v = 0; ?>
						<?php foreach ($child['children_lv3'] as $child_lv3) { ?>
							<?php $v++; ?>
							<?php if($v >$modern_countvmenulv) break; ?>
							<a class = "menuv_3lv " href="<?php echo $child_lv3['href']; ?>">&nbsp;&nbsp;- <?php echo $child_lv3['name']; ?></a>
							<?php if ($v >($modern_countvmenulv -1)) { ?>
								<a class="menuv-allv" href="<?php echo $child['href']; ?>"><?php echo $modern_seeall_menu[$language_id]; ?></a>
								<?php } ?>
							<?php } ?>
						<?php } ?>
					</li>

					<?php } ?>
				</ul>
				</li>
				<?php } else { ?>
				<li class="v3hover"><a class="dr_menu" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
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
			<li class="plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></li>
			<li class="<?php if($category['category_id']==$category_id) {echo 'activetopmenu';}?> dropdown"><a class="with-child dropdown-toggle" href="<?php echo $category['href']; ?>" data-hover="dropdown" data-delay="1" data-close-others="false"><?php echo $category['name']; ?><span class="fa fa-angle-down menu"></span></a>
			<div class="dropdown-menu">
			<div class="dropdown-inner children-category">
			<?php if ($category['image_main'] && $modern_main_photos_menu !=1) { ?>
				<a href="<?php echo $category['href']; ?>"><img class="image_main img-responsive" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" src="<?php echo $category['image_main']; ?>"></a>
				<?php } ?>
			<?php foreach ($category['children'] as $child) { ?>
				<ul class="list-unstyled" >
				<?php if (isset($child['children_lv3']) && $child['children_lv3']) { ?>
					<li class="with-child" >
					<span class = "hidden-xs hidden-sm"><?php if ($modern_photos_menu !=1 && (!empty($child['image2']))) { ?><a href="<?php echo $child['href']; ?>"><img class="opacityhv img-responsive" src="<?php echo $child['image2']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" ></a><?php } ?></span>
					<a href="<?php echo $child['href']; ?>"><span class="style2lv"><?php echo $child['name']; ?></span></a></li>
					<?php if ($modern_3lv_menu !=1) { ?>
						<?php $m = 0; ?>
						<?php foreach ($child['children_lv3'] as $child_lv3) { ?>
							<?php $m++; ?>
							<?php if($m >$modern_countvmenulv) break; ?>
							<li class="children_lv3"><a href="<?php echo $child_lv3['href']; ?>">&nbsp;&nbsp;- <?php echo $child_lv3['name']; ?></a>
							<?php if ($m >($modern_countvmenulv -1)) { ?>
								<a class="menuv-all" href="<?php echo $child['href']; ?>"><?php echo $modern_seeall_menu[$language_id]; ?></a>
								<?php } ?>
							</li>
							<?php } ?>
						<?php } ?>
					<?php } else { ?>
					<li><?php if ($modern_photos_menu !=1 && (!empty($child['image2']))) { ?><span class = "hidden-xs hidden-sm"><a href="<?php echo $child['href']; ?>"><img class="opacityhv img-responsive" src="<?php echo $child['image2']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" ></a></span><?php } ?><a href="<?php echo $child['href']; ?>"><span class="style2lv"><?php echo $child['name']; ?></span></a></li>
					<?php } ?>
				</ul>
				<?php } ?>
			</div>
			</div>
			<div class="clearfix"></div>
			</li>
			<?php } else { ?>
			<li class="<?php if($category['category_id']==$category_id) {echo 'activetopmenu';}?>"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
			<?php } ?>
		<?php } ?>
	</ul>
	</div>
	<ul class="nav navbar-nav">

	<?php if ($modern_top_links8 ) { ?>
		<?php foreach ($modern_top_links8 as $modern_top_link8) { ?>
			<li>
			<a <?php if ($modern_top_link8['link_top'][$language_id]) { ?> href="<?php echo $modern_top_link8['link_top'][$language_id]; ?>"<?php } ?>><?php if ($modern_top_link8['faicons_top']) { ?> <i class="<?php echo $modern_top_link8['faicons_top']; ?>"></i> <?php } ?><?php if ($modern_top_link8['title']) { ?><?php echo $modern_top_link8['title'][$language_id]; ?><?php } ?></a>
			</li>
			<?php } ?>
		<?php } ?>


	<?php if ($modern_main_link_menu[$language_id]) { ?>
		<li class="plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></li>
		<li class="dropdown"><a class="with-child dropdown-toggle" href="<?php echo $modern_main_link_href_menu[$language_id]; ?>" data-hover="dropdown" data-delay="1" data-close-others="false"><?php echo $modern_main_link_menu[$language_id]; ?><span class="fa fa-angle-down menu"></span></a>
		<div class="dropdown-menu">
		<div class="dropdown-inner1 children-category">
		<ul class="list-unstyled">
		<?php if ($modern_top_links4 ) { ?>
			<?php foreach ($modern_top_links4 as $modern_top_link4) { ?>
				<li>
				<a <?php if ($modern_top_link4['link_top'][$language_id]) { ?> href="<?php echo $modern_top_link4['link_top'][$language_id]; ?>"<?php } ?> title="<?php echo $modern_top_link4['title'][$language_id]; ?>"><?php if ($modern_top_link4['faicons_top']) { ?> <i class="<?php echo $modern_top_link4['faicons_top']; ?>"></i><?php } ?><?php if ($modern_top_link4['title']) { ?> <?php echo $modern_top_link4['title'][$language_id]; ?><?php } ?></a>
				</li>
				<?php } ?>
			<?php } ?>
		</ul>
		</div>
		</div>
		</li>
		<?php } ?>

	<?php if ($modern_info_menu !=1) { ?>
		<?php if ($informations) { ?>
			<li class="plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></li>
			<li class="dropdown"><a class="with-child dropdown-toggle" data-hover="dropdown" data-delay="1" data-close-others="false"><?php echo $text_information; ?><span class="fa fa-angle-down menu"></span></a>
			<div class="dropdown-menu">
			<div class="dropdown-inner1 children-category">
			<ul class="list-unstyled">
			<?php foreach ($informations as $information) { ?>
				<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
				<?php } ?>
			</ul>
			</div>
			</div>
			</li>
			<?php } ?>
		<?php } ?>

	<?php if ($modern_man_menu !=1) { ?>
		<?php if ($manufacturers) { ?>
			<li class="plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></li>
			<li class="dropdown"><a class="with-child dropdown-toggle" href="<?php echo $href_manufacturer; ?>" data-hover="dropdown" data-delay="1" data-close-others="false"><?php echo $text_manufacturer; ?><span class="fa fa-angle-down menu"></span></a>
			<div class="mancss dropdown-menu">
			<div class="dropdown-inner children-category">
			<?php foreach ($manufacturers as $manufacturer) { ?>
				<ul class="list-unstyled" style="width: <?php echo (100/$modern_menuman_column)-1; ?>%">
				<li><span class ="hidden-xs hidden-sm "><?php if ($modern_photos_menu_manuf !=1) { ?><a class = "manufac-menu" href="<?php echo $manufacturer['href']; ?>"><img class="opacityhv manimgmen" src="<?php echo $manufacturer['manufacturer_image']; ?>" alt="<?php echo $manufacturer['name']; ?>" title="<?php echo $manufacturer['name']; ?>" ></a></span><?php } ?><a class = "manufac-menu" href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></li>
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
	</div></div>
	</div></div> -->
	</div>
	<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 cart">
	<?php echo $cart; ?>
	</div>
	</div>
	</div>
	</div>
	<div class="category_menu">
		<?=$categoryMenu;?>
	</div>
	<script>
	$(window).scroll(function(){
		if (window.innerWidth > 991) {
			var i = 0;
			if ($(window).scrollTop() > 200){
				if (i == 0) {
					var htnl_header = '<div class="top-header2"><div class="container"><div class="row"><div id="logo" class="col-lg-1 col-md-1 col-sm-1 col-xs-1">';
					htnl_header += $('div#logo').html();
					htnl_header += '</div><div class="col-lg-11 col-md-11 col-sm-11 col-xs-11"><div class="top-menu">';
					htnl_header += $('div.top-menu').html();
					htnl_header += '</div></div>';
					htnl_header += '</div></div>';
					i = 1;
				}
				if ($('*').is('.top-header2')) {
				} else {
					$('body').append(htnl_header);
				}
			} else {
				$('*').remove('.top-header2');
				i = 0;
			}
		}
	});
	$(window).resize(function(){
		if (window.innerWidth < 992) {
		$('*').remove('.top-header2');
		} else if (window.innerWidth > 991 && window.innerWidth < 1200) {
		$('.dropdown-menu2').attr('class', 'dropdown-menu2 column_width2');
		$('.mcol').attr('class', 'col-sm-4 mcol');
		$('.dropdown-menu2 .clearfix').remove();
		$(".dropdown-menu2 > li:nth-child(3n)").after('<li class="clearfix visible-sm visible-md visible-lg"></li>');
		} else if (window.innerWidth > 1199) {
		$('.dropdown-menu2').attr('class', 'dropdown-menu2 column_width3');
		$('.mcol').attr('class', 'col-sm-3 mcol');
		$('.dropdown-menu2 .clearfix').remove();
		$(".dropdown-menu2 > li:nth-child(4n)").after('<li class="clearfix visible-sm visible-md visible-lg"></li>');
		}
	});
	$(window).resize();
	</script>
	<?php } else { ?>
	<div class="top-header3">
	<div class="container">
	<div class="row">
	<div id="logo" class="col-lg-1 col-md-1 col-sm-1 col-xs-12">
          <?php if ($logo) { ?>
            <?php if ($home == $og_url) { ?>
              <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
            <?php } else { ?>
              <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
            <?php } ?>
          <?php } else { ?>
            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
	</div>
	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-12 col-sm-push-8 block_fon_search">
	<div class="fn_header">
	<?php if ($modern_telephone_mainheader2[$language_id] || $modern_telephone_mainheader[$language_id]) { ?>
		<table class="table">
		<tbody>
		<tr>
		<td class="fa_table" rowspan="2"><div class="circleout2"><i class="fa fa-phone"></i></div></td>
		<td><div class="listunstyled"><span class="tell_nav"><?php echo $modern_telephone_mainheader2[$language_id]; ?></span></div></td>
		</tr>
		<tr>
		<td><?php if ($modern_top_links3 || $modern_top_links5 || $modern_mail_header[$language_id] ) { ?>
			<div class="dropdown">
			<div class="listunstyled dropdown-toggle" data-toggle="dropdown"><span class="tell_nav"><?php echo $modern_telephone_mainheader[$language_id]; ?></span><b class="caret"></b></div>
			<ul class="dropdown-menu fixxsmenu fixsmenu_tel">
			<?php if ($modern_top_links3 ) { ?>
				<?php foreach ($modern_top_links3 as $modern_top_link3) { ?>
					<li>
					<div class="drop_head_first"><?php echo $modern_top_link3['name'][$language_id]; ?></div>
					<a <?php if ($modern_top_link3['title'][$language_id]) { ?> href="tel:<?php echo $modern_top_link3['title'][$language_id]; ?>"<?php } ?> ><?php if ($modern_top_link3['faicons_top']) { ?><i class="<?php echo $modern_top_link3['faicons_top']; ?>"></i><?php } ?> <?php echo html_entity_decode ($modern_top_link3['title'][$language_id], ENT_QUOTES, 'UTF-8'); ?></a>
					</li>
					<?php } ?>
				<?php } ?>
			<?php if ($modern_top_links5 ) { ?>
				<?php foreach ($modern_top_links5 as $modern_top_link5) { ?>
					<li>
					<div class="drop_head"><?php echo $modern_top_link5['name'][$language_id]; ?></div>
					<a <?php if ($modern_top_link5['title'][$language_id]) { ?> href="callto:<?php echo $modern_top_link5['title'][$language_id]; ?>"<?php } ?> ><?php if ($modern_top_link5['faicons_top']) { ?><i class="<?php echo $modern_top_link5['faicons_top']; ?>"></i><?php } ?> <?php echo html_entity_decode ($modern_top_link5['title'][$language_id], ENT_QUOTES, 'UTF-8'); ?></a>
					</li>
					<?php } ?>
				<?php } ?>
			<?php if ($modern_mail_header[$language_id] ) { ?>
				<li>
				<div class="drop_head"><?php echo $modern_tittle_name[$language_id];?></div>
				<a onClick="javascript:window.open('mailto:<?php echo $modern_mail_header[$language_id];?>', 'Mail');event.preventDefault()" href="<?php echo $modern_mail_header[$language_id];?>"><i class="fa fa-envelope-o "></i> <?php echo $modern_mail_header[$language_id];?></a></li>
				<?php } ?>
			<li>
			<?php if ($aridiuscallback_status && $modern_calltop !=1) { ?>
				<div class="drop_head"></div>
				<a class = "call-order"><i class="<?php echo $modern_top_link3['faicons_top']; ?>"></i>&nbsp;<?php echo $button_title; ?></a>
				<?php } ?>
			</li>
			</ul>
			</div>
			<?php } else { ?>
			<div class="phone">
			<div class="listunstyled"><span class="tell_nav"><?php echo $modern_telephone_mainheader[$language_id]; ?></span></div>
			</div>
			<?php } ?></td>
		</tr>
		</tbody>
		</table>
		<?php } ?>
	</div>
	<div class="search_input_head">
	<?php echo $search; ?>
	</div>
	</div>
	<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-sm-pull-1">
	<div class="top-menu">
	<div id="top-menu" >
	<div class="nobackground">
	<nav id="menu" class="navbar">
	<div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
	<button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
	</div>
	<div class="collapse navbar-collapse navbar-ex1-collapse menu_adapt_coll">
	<ul class="nav navbar-nav">
	<?php if ($modern_ico_home !=1) { ?>
		<li><a href="<?php echo $base; ?>"><i class="fa fa-home fa_homemenu"></i></a></li>
		<?php } ?>
	<?php if ($modern_ico_home_text !=1) { ?>
		<li><a href="<?php echo $base; ?>"><?php echo $text_homel; ?></i></a></li>
		<?php } ?>
	<?php if ($modern_seevmenu_menu !=1) { ?>
		<li class="dropdown hidev"><a class="with-child dropdown-toggle" <?php if (!empty($modern_link_menucatalog)) { ?> href="<?php echo $modern_link_menucatalog; ?>" <?php } ?> data-hover="dropdown" data-delay="1" data-close-others="false">
		<?php if ($modern_seevmenuico !=1) { ?>
			<i class="fa fa-bars"></i>&nbsp;&nbsp;
			<?php } ?>
		<?php echo $modern_vmenu_menu[$language_id]; ?><span class="fa fa-angle-down menu"></span></a>
		<ul class="dropdown-menu multi-level" role="menu">
		<?php foreach ($categories as $category) { ?>
			<?php if ($category['children']) { ?>
				<li class="dropdown-submenu" >
				<a class="dr_menu" tabindex="-1" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?><span class="arrowvertmenu"></span></a>
				<ul class="dropdown-menu2">
				<?php if ($category['image_main'] && $modern_main_photos_menu !=1) { ?>
					<li><a href="<?php echo $category['href']; ?>"><img class="image_main img-responsive" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" src="<?php echo $category['image_main']; ?>"></a>	</li>
					<?php } ?>
				<?php foreach ($category['children'] as $child) { ?>
					<li class="col-sm-4 mcol">
					<span class = "hidden-xs"><?php if ($modern_photos_menu !=1 && (!empty($child['image2']))) { ?><a href="<?php echo $child['href']; ?>"><img class="vopmen img-responsive" src="<?php echo $child['image2']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" ></a><?php } ?></span>
					<div class="clearfix"></div>
					<a class="submenu_main" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
					<?php if (isset($child['children_lv3']) && $child['children_lv3']) { ?>
						<?php $v = 0; ?>
						<?php foreach ($child['children_lv3'] as $child_lv3) { ?>
							<?php $v++; ?>
							<?php if($v >$modern_countvmenulv) break; ?>
							<a class = "menuv_3lv " href="<?php echo $child_lv3['href']; ?>">&nbsp;&nbsp;- <?php echo $child_lv3['name']; ?></a>
							<?php if ($v >($modern_countvmenulv -1)) { ?>
								<a class="menuv-allv" href="<?php echo $child['href']; ?>"><?php echo $modern_seeall_menu[$language_id]; ?></a>
								<?php } ?>
							<?php } ?>
						<?php } ?>
					</li>
					
					<?php } ?>
				</ul>
				</li>
				<?php } else { ?>
				<li class="v3hover"><a class="dr_menu" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
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
			<li class="plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></li>
		<li class="<?php if($category['category_id']==$category_id) {echo 'activetopmenu';}?> dropdown">
				<a class="with-child dropdown-toggle" href="<?php echo $category['href']; ?>" data-hover="dropdown" data-delay="1" data-close-others="false"><?php echo $category['name']; ?><span class="fa fa-angle-down menu"></span></a>
		<div class="dropdown-menu">
			<div class="dropdown-inner children-category">
			<?php if ($category['image_main'] && $modern_main_photos_menu !=1) { ?>
				<a href="<?php echo $category['href']; ?>"><img class="image_main img-responsive" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" src="<?php echo $category['image_main']; ?>"></a>
				<?php } ?>
			<?php foreach ($category['children'] as $child) { ?>
				<ul class="list-unstyled" >
				<?php if (isset($child['children_lv3']) && $child['children_lv3']) { ?>
					<li class="with-child" >
					<span class = "hidden-xs hidden-sm"><?php if ($modern_photos_menu !=1 && (!empty($child['image2']))) { ?><a href="<?php echo $child['href']; ?>"><img class="opacityhv img-responsive" src="<?php echo $child['image2']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" ></a><?php } ?></span>
					<a href="<?php echo $child['href']; ?>"><span class="style2lv"><?php echo $child['name']; ?></span></a></li>
					<?php if ($modern_3lv_menu !=1) { ?>
						<?php $m = 0; ?>
						<?php foreach ($child['children_lv3'] as $child_lv3) { ?>
							<?php $m++; ?>
							<?php if($m >$modern_countvmenulv) break; ?>
							<li class="children_lv3"><a href="<?php echo $child_lv3['href']; ?>">&nbsp;&nbsp;- <?php echo $child_lv3['name']; ?></a>
							<?php if ($m >($modern_countvmenulv -1)) { ?>
								<a class="menuv-all" href="<?php echo $child['href']; ?>"><?php echo $modern_seeall_menu[$language_id]; ?></a>
								<?php } ?>
							</li>
							<?php } ?>
						<?php } ?>
					<?php } else { ?>
					<li><?php if ($modern_photos_menu !=1 && (!empty($child['image2']))) { ?><span class = "hidden-xs hidden-sm"><a href="<?php echo $child['href']; ?>"><img class="opacityhv img-responsive" src="<?php echo $child['image2']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" ></a></span><?php } ?><a href="<?php echo $child['href']; ?>"><span class="style2lv"><?php echo $child['name']; ?></span></a></li>
					<?php } ?>
				</ul>
				<?php } ?>
			</div>
			</div>
			<div class="clearfix"></div>
			</li>
			<?php } else { ?>
			<li class="<?php if($category['category_id']==$category_id) {echo 'activetopmenu';}?>"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
			<?php } ?>
		<?php } ?>
	</ul>
	</div>
	<ul class="nav navbar-nav">
	<!--add menu link-->
	<?php if ($modern_top_links8 ) { ?>
		<?php foreach ($modern_top_links8 as $modern_top_link8) { ?>
			<li>
			<a <?php if ($modern_top_link8['link_top'][$language_id]) { ?> href="<?php echo $modern_top_link8['link_top'][$language_id]; ?>"<?php } ?>><?php if ($modern_top_link8['faicons_top']) { ?> <i class="<?php echo $modern_top_link8['faicons_top']; ?>"></i> <?php } ?><?php if ($modern_top_link8['title']) { ?><?php echo $modern_top_link8['title'][$language_id]; ?><?php } ?></a>
			</li>
			<?php } ?>
		<?php } ?>
	<!--add menu link-->
	<!--other link-->
	<?php if ($modern_main_link_menu[$language_id]) { ?>
		<li class="plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></li>
		<li class="dropdown"><a class="with-child dropdown-toggle" href="<?php echo $modern_main_link_href_menu[$language_id]; ?>" data-hover="dropdown" data-delay="1" data-close-others="false"><?php echo $modern_main_link_menu[$language_id]; ?><span class="fa fa-angle-down menu"></span></a>
		<div class="dropdown-menu">
		<div class="dropdown-inner1 children-category">
		<ul class="list-unstyled">
		<?php if ($modern_top_links4 ) { ?>
			<?php foreach ($modern_top_links4 as $modern_top_link4) { ?>
				<li>
				<a <?php if ($modern_top_link4['link_top'][$language_id]) { ?> href="<?php echo $modern_top_link4['link_top'][$language_id]; ?>"<?php } ?> title="<?php echo $modern_top_link4['title'][$language_id]; ?>"><?php if ($modern_top_link4['faicons_top']) { ?> <i class="<?php echo $modern_top_link4['faicons_top']; ?>"></i><?php } ?><?php if ($modern_top_link4['title']) { ?> <?php echo $modern_top_link4['title'][$language_id]; ?><?php } ?></a>
				</li>
				<?php } ?>
			<?php } ?>
		</ul>
		</div>
		</div>
		</li>
		<?php } ?>
	<!--other link END-->
	<!--informations-->
	<?php if ($modern_info_menu !=1) { ?>
		<?php if ($informations) { ?>
			<li class="plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></li>
			<li class="dropdown"><a class="with-child dropdown-toggle" data-hover="dropdown" data-delay="1" data-close-others="false"><?php echo $text_information; ?><span class="fa fa-angle-down menu"></span></a>
			<div class="dropdown-menu">
			<div class="dropdown-inner1 children-category">
			<ul class="list-unstyled">
			<?php foreach ($informations as $information) { ?>
				<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
				<?php } ?>
			</ul>
			</div>
			</div>
			</li>
			<?php } ?>
		<?php } ?>
	<!--informations END-->
	<!--manufacturer-->
	<?php if ($modern_man_menu !=1) { ?>
		<?php if ($manufacturers) { ?>
			<li class="plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></li>
			<li class="dropdown manuf_drop"><a class="with-child dropdown-toggle" href="<?php echo $href_manufacturer; ?>" data-hover="dropdown" data-delay="1" data-close-others="false"><?php echo $text_manufacturer; ?><span class="fa fa-angle-down menu"></span></a>
			<div class="dropdown-menu">
			<div class="dropdown-inner children-category">
			<?php foreach ($manufacturers as $manufacturer) { ?>
				<ul class="list-unstyled" style="width: <?php echo (100/$modern_menuman_column)-1; ?>%">
				<li><span class = "hidden-xs hidden-sm "><?php if ($modern_photos_menu_manuf !=1) { ?><a class = "manufac-menu" href="<?php echo $manufacturer['href']; ?>"><img class="opacityhv manimgmen" src="<?php echo $manufacturer['manufacturer_image']; ?>" alt="<?php echo $manufacturer['name']; ?>" title="<?php echo $manufacturer['name']; ?>" ></a></span><?php } ?><a class = "manufac-menu" href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></li>
				</ul>
				<?php } ?>
			</div>
			</div>
			</li>
			<?php } ?>
		<?php } ?>
	<!--manufacturer END-->
	</ul>
	</div>
	</div>
	</nav>
	</div>
	</div>
	</div></div>
	<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 cart">
	<?php echo $cart; ?>
	</div></div></div></div>
	<script>
	var htnl_search2 = $('.search_input_head').html();
	var htnl_tel2 = $('.fn_header').html();
	var htnl_tel3 = $('.fixsmenu_tel').html();
	var kk = 0;
	$(window).scroll(function(){
		if (window.innerWidth > 991) {
			if ($(window).scrollTop() > 103){
				$('.top-header3').css({"top":"0", "position":"fixed","opacity":"0.8"});
			} else {
				$('.top-header3').css({"top":"38px", "position":"absolute","opacity":"1"});
			}
		}
	});
	$(window).resize(function(){
		if (window.innerWidth > 991 && (kk == 0 || kk == 1)) {
			var htnl_search = '<div class="dropdown"><div class="listunstyled dropdown-toggle seaech_icon" data-toggle="dropdown"><i class="fa fa-search"></i></div><ul class="dropdown-menu fixxsmenu_search">';
			htnl_search += htnl_search2;
			htnl_search += '</ul></div>';
			var htnl_tel = '<div class="dropdown"><div class="listunstyled dropdown-toggle fon_icon" data-toggle="dropdown"><i class="fa fa-phone"></i></div><ul class="dropdown-menu fixxsmenu_tel">';
			htnl_tel += htnl_tel3;
			htnl_tel += '</ul></div>';
			$('.search_input_head').html(htnl_search);
			$('.fn_header').html(htnl_tel);
			$('.top-header3').css({"top":"38px", "position":"absolute"});
			kk= 2;
		} else if (window.innerWidth < 992 && (kk == 0 || kk == 2)) {
				htnl_search = htnl_search2;
				htnl_tel = htnl_tel2;
				$('.search_input_head').html(htnl_search);
				$('.fn_header').html(htnl_tel);
				$('.top-header3').css({"top":"0px", "position":"relative"});
				kk = 1;
			
		}
		if (window.innerWidth > 991 && window.innerWidth < 1200) {
		$('.dropdown-menu2').attr('class', 'dropdown-menu2 column_width2');
		$('.mcol').attr('class', 'col-sm-4 mcol');
		$('.dropdown-menu2 .clearfix').remove();
		$(".dropdown-menu2 > li:nth-child(3n)").after('<li class="clearfix visible-sm visible-md visible-lg"></li>');
		} else if (window.innerWidth > 1199) {
		$('.dropdown-menu2').attr('class', 'dropdown-menu2 column_width3');
		$('.mcol').attr('class', 'col-sm-3 mcol');
		$('.dropdown-menu2 .clearfix').remove();
		$(".dropdown-menu2 > li:nth-child(4n)").after('<li class="clearfix visible-sm visible-md visible-lg"></li>');
		}
	});
	$(window).resize();
	</script>
	<?php } ?>
<script type="text/javascript"><!--
$('#menu .menu_mob_plus li').bind().click(function(e) {
	$(this).toggleClass("open").find('>ul').stop(true, true).slideToggle(3000)
	.end().siblings().find('>ul').slideUp().parent().removeClass("open");
	e.stopPropagation();
	// Замена + на - во время открытия меню
	$(this).prev().find('.fa-angle-right').toggle();
	$(this).prev().find('.fa-angle-down').toggle();
});
$('#menu li a').click(function(e) {
	e.stopPropagation();
});
// Раскрытие/скрытие пунктов меню 3го уровня
$('.children-category > ul > li').each(function(i, elem){
	if( $(elem).hasClass('children_lv3') ) {
		var ulElements = $(elem).parent().find('li');
		if( $(ulElements[0]).find('a.plus-link').length == 0 ) {
			$(ulElements[0]).append('<a href="#" class="plus-link"><i class="fa fa-angle-right" style="display: inline; "></i><i class="fa fa-angle-down" style="display: none;"></i></a>');
			$(ulElements[0]).find('a.plus-link').click(function(e){
				$(ulElements[0]).find('a.plus-link > .fa-angle-right').toggle();
				$(ulElements[0]).find('a.plus-link > .fa-angle-down').toggle();
				$(ulElements[0]).parent().find('.children_lv3').toggle();
				return false;
			});
		}
	}
});
//--></script>
<?php if ($modern_arrowup !=1) { ?>
	<!--scrollUp-->
	<script type="text/javascript"><!--
	$(document).ready(function() {
		$(window).scroll(function(){
			if ($(this).scrollTop() > 100) {
				$('.scup').fadeIn();
			} else {
				$('.scup').fadeOut();
			}
		});
		$('.scup').click(function(){
			$("html, body").animate({ scrollTop: 0 }, 900);
			return false;
		});
	});
	//--></script>
	<?php } ?>
<script>
$(window).scroll(function() {
	// Menu
	$('#menu .dropdown-menu').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();
		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth()) + 5;
		if (i > 0 && i < dropdown.left) {
			$(this).css('margin-left', '-' + i + 'px');
		} else if (i > 0 && i > dropdown.left) {
			$(this).css('margin-left', '-' + (dropdown.left-40) + 'px');
		}
	});
	});
	//Menu end
	</script>