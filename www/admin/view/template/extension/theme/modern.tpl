<?php echo $header; ?><?php echo $column_left; ?>
<?php 
foreach ($languages as $language) {
if(!isset($modern_name_sticker_menu_new[$language['language_id']])) $modern_name_sticker_menu_new[$language['language_id']]        = "NEW";
if(!isset($modern_name_sticker_menu_top[$language['language_id']])) $modern_name_sticker_menu_top[$language['language_id']]        = "TOP";
if(!isset($modern_name_sticker_menu_sale[$language['language_id']])) $modern_name_sticker_menu_sale[$language['language_id']]      = "SALE";
if(!isset($modern_longitude_fluid_map[$language['language_id']])) $modern_longitude_fluid_map[$language['language_id']]            = "30.3518969";
if(!isset($modern_latitude_fluid_map[$language['language_id']])) $modern_latitude_fluid_map[$language['language_id']]              = "59.9324357";
if(!isset($modern_name_sticker_product_new[$language['language_id']])) $modern_name_sticker_product_new[$language['language_id']]        = "NEW";
if(!isset($modern_name_sticker_product_top[$language['language_id']])) $modern_name_sticker_product_top[$language['language_id']]        = "TOP";
if(!isset($modern_vmenu_menu[$language['language_id']])) $modern_vmenu_menu[$language['language_id']]        = "КАТАЛОГ ТОВАРОВ";
if(!isset($modern_seeall_menu[$language['language_id']])) $modern_seeall_menu[$language['language_id']]        = "Смотреть все";
if(!isset($modern_license_text[$language['language_id']])) $modern_license_text[$language['language_id']]        = "Работает на <a href='http://myopencart.com/' target='_blank'>ocStore</a> Modern © 2016";
if(!isset($modern_pr_attribute_name[$language['language_id']])) $modern_pr_attribute_name[$language['language_id']]        = "Характеристики";
if(!isset($modern_pr_attribute_seeall[$language['language_id']])) $modern_pr_attribute_seeall[$language['language_id']]        = "смотреть все";
}
if(!isset($modern_countvmenulv)) $modern_countvmenulv      = "3";
if(!isset($modern_categories_2lv_width)) $modern_categories_2lv_width      = "90";
if(!isset($modern_categories_2lv_height)) $modern_categories_2lv_height    = "90";
if(!isset($modern_photos_menu_width)) $modern_photos_menu_width      = "181";
if(!isset($modern_photos_menu_height)) $modern_photos_menu_height    = "106";
if(!isset($modern_photos_width_image_main)) $modern_photos_width_image_main      = "150";
if(!isset($modern_photos_height_image_main)) $modern_photos_height_image_main    = "250";
if(!isset($modern_photos_menuman_width)) $modern_photos_menuman_width      = "50";
if(!isset($modern_photos_menuman_height)) $modern_photos_menuman_height    = "50";
if(!isset($modern_menuman_column)) $modern_menuman_column    = "6";
if(!isset($modern_product_man_width)) $modern_product_man_width      = "50";
if(!isset($modern_product_man_height)) $modern_product_man_height    = "50";
if(!isset($modern_sticker_product_new_day)) $modern_sticker_product_new_day    = "90";
if(!isset($modern_sticker_product_top_rating)) $modern_sticker_product_top_rating    = "5";
if(!isset($modern_sticker_product_top_viewed)) $modern_sticker_product_top_viewed    = "200";
if(!isset($modern_limit_symbolst)) $modern_limit_symbolst    = "55";
if(!isset($modern_fluid_map_zoom)) $modern_fluid_map_zoom    = "14";
if(!isset($modern_product_raiting)) $modern_product_raiting    = "5";
if(!isset($modern_product_optionimg_width)) $modern_product_optionimg_width    = "70";
if(!isset($modern_product_optionimg_height)) $modern_product_optionimg_height    = "70";
if(!isset($modern_attribute_see)) $modern_attribute_see    = "4";
if(empty($modern_main_background_color)) $modern_main_background_color                         = "2f2f2f";
if(empty($modern_main_color_text)) $modern_main_color_text                                     = "ffffff;";
if(empty($modern_main_color_text2)) $modern_main_color_text2                                   = "79C1D4";
if(empty($modern_main_color_text3)) $modern_main_color_text3                                   = "737373";
if(empty($modern_background_btn)) $modern_background_btn                                       = "2F2F2F;";
if(empty($modern_text_color_btn)) $modern_text_color_btn                                       = "ffffff;";
if(empty($modern_background_btn_hover)) $modern_background_btn_hover                           = "51473C;";
if(empty($modern_text_color_btn_hover)) $modern_text_color_btn_hover                           = "ffffff;";
if(empty($modern_text_color_border_btn)) $modern_text_color_border_btn                         = "737373;";
if(empty($modern_text_color_border_btn_hover)) $modern_text_color_border_btn_hover             = "737373;";
if(empty($modern_color_callback)) $modern_color_callback                                       = "A99D90;";
if(empty($modern_color_tittle_news)) $modern_color_tittle_news                                 = "737373;";
if(empty($modern_color_text_news)) $modern_color_text_news                                     = "ffffff;";
?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-theme-modern" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;<?php echo $button_save; ?></button>
<a onclick="apply()" class="btn btn-primary" data-toggle="tooltip" title="<?php echo $button_apply; ?>" ><i class="fa fa-check"></i>&nbsp;&nbsp;<?php echo $button_apply; ?></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-theme-modern" class="form-horizontal">
<div class="form-group">
<div class="col-sm-12">
<ul id="myTab2" class="nav nav-tabs">
<li><a data-toggle="tab" href="#panely0"><?php echo $text_general; ?></a></li>
<li><a data-toggle="tab" href="#panely8"><?php echo $tab_common; ?></a></li>
<li><a data-toggle="tab" href="#panely4"><?php echo $tab_menu; ?></a></li>
<li><a data-toggle="tab" href="#panely1"><?php echo $tab_header; ?></a></li>
<li><a data-toggle="tab" href="#panely7"><?php echo $tab_product2; ?></a></li>
<li><a data-toggle="tab" href="#panely6"><?php echo $tab_categories; ?></a></li>
<li><a data-toggle="tab" href="#panely2"><?php echo $tab_footer; ?></a></li>
<li><a data-toggle="tab" href="#panely5"><?php echo $tab_sticker; ?></a></li>
<li><a data-toggle="tab" href="#panely9"><?php echo $tab_counter; ?></a></li>
<li><a data-toggle="tab" href="#panely10"><?php echo $tab_css; ?></a></li>
</ul>
<div class="tab-content">
<div id="panely0" class="tab-pane fade in active">
       <fieldset>
            <legend><?php echo $text_general; ?></legend>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-directory"><span data-toggle="tooltip" title="<?php echo $help_directory; ?>"><?php echo $entry_directory; ?></span></label>
              <div class="col-sm-10">
                <select name="modern_directory" id="input-directory" class="form-control">
                  <?php foreach ($directories as $directory) { ?>
                  <?php if ($directory == $modern_directory) { ?>
                  <option value="<?php echo $directory; ?>" selected="selected"><?php echo $directory; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $directory; ?>"><?php echo $directory; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
              <div class="col-sm-10">
                <select name="modern_status" id="input-status" class="form-control">
                  <?php if ($modern_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
          </fieldset>
          <fieldset>
            <legend><?php echo $text_product; ?></legend>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-catalog-limit"><span data-toggle="tooltip" title="<?php echo $help_product_limit; ?>"><?php echo $entry_product_limit; ?></span></label>
              <div class="col-sm-10">
                <input type="text" name="modern_product_limit" value="<?php echo $modern_product_limit; ?>" placeholder="<?php echo $entry_product_limit; ?>" id="input-catalog-limit" class="form-control" />
                <?php if ($error_product_limit) { ?>
                <div class="text-danger"><?php echo $error_product_limit; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-description-limit"><span data-toggle="tooltip" title="<?php echo $help_product_description_length; ?>"><?php echo $entry_product_description_length; ?></span></label>
              <div class="col-sm-10">
                <input type="text" name="modern_product_description_length" value="<?php echo $modern_product_description_length; ?>" placeholder="<?php echo $entry_product_description_length; ?>" id="input-description-limit" class="form-control" />
                <?php if ($error_product_description_length) { ?>
                <div class="text-danger"><?php echo $error_product_description_length; ?></div>
                <?php } ?>
              </div>
            </div>
          </fieldset>
          <fieldset>
            <legend><?php echo $text_image; ?></legend>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-image-category-width"><?php echo $entry_image_category; ?></label>
              <div class="col-sm-10">
                <div class="row">
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_category_width" value="<?php echo $modern_image_category_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-category-width" class="form-control" />
                  </div>
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_category_height" value="<?php echo $modern_image_category_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                  </div>
                </div>
                <?php if ($error_image_category) { ?>
                <div class="text-danger"><?php echo $error_image_category; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-image-thumb-width"><?php echo $entry_image_thumb; ?></label>
              <div class="col-sm-10">
                <div class="row">
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_thumb_width" value="<?php echo $modern_image_thumb_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-thumb-width" class="form-control" />
                  </div>
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_thumb_height" value="<?php echo $modern_image_thumb_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                  </div>
                </div>
                <?php if ($error_image_thumb) { ?>
                <div class="text-danger"><?php echo $error_image_thumb; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-image-popup-width"><?php echo $entry_image_popup; ?></label>
              <div class="col-sm-10">
                <div class="row">
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_popup_width" value="<?php echo $modern_image_popup_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-popup-width" class="form-control" />
                  </div>
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_popup_height" value="<?php echo $modern_image_popup_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                  </div>
                </div>
                <?php if ($error_image_popup) { ?>
                <div class="text-danger"><?php echo $error_image_popup; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-image-product-width"><?php echo $entry_image_product; ?></label>
              <div class="col-sm-10">
                <div class="row">
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_product_width" value="<?php echo $modern_image_product_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-product-width" class="form-control" />
                  </div>
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_product_height" value="<?php echo $modern_image_product_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                  </div>
                </div>
                <?php if ($error_image_product) { ?>
                <div class="text-danger"><?php echo $error_image_product; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-image-additional-width"><?php echo $entry_image_additional; ?></label>
              <div class="col-sm-10">
                <div class="row">
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_additional_width" value="<?php echo $modern_image_additional_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-additional-width" class="form-control" />
                  </div>
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_additional_height" value="<?php echo $modern_image_additional_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                  </div>
                </div>
                <?php if ($error_image_additional) { ?>
                <div class="text-danger"><?php echo $error_image_additional; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-image-related"><?php echo $entry_image_related; ?></label>
              <div class="col-sm-10">
                <div class="row">
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_related_width" value="<?php echo $modern_image_related_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-related" class="form-control" />
                  </div>
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_related_height" value="<?php echo $modern_image_related_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                  </div>
                </div>
                <?php if ($error_image_related) { ?>
                <div class="text-danger"><?php echo $error_image_related; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-image-compare"><?php echo $entry_image_compare; ?></label>
              <div class="col-sm-10">
                <div class="row">
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_compare_width" value="<?php echo $modern_image_compare_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-compare" class="form-control" />
                  </div>
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_compare_height" value="<?php echo $modern_image_compare_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                  </div>
                </div>
                <?php if ($error_image_compare) { ?>
                <div class="text-danger"><?php echo $error_image_compare; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-image-wishlist"><?php echo $entry_image_wishlist; ?></label>
              <div class="col-sm-10">
                <div class="row">
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_wishlist_width" value="<?php echo $modern_image_wishlist_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-wishlist" class="form-control" />
                  </div>
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_wishlist_height" value="<?php echo $modern_image_wishlist_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                  </div>
                </div>
                <?php if ($error_image_wishlist) { ?>
                <div class="text-danger"><?php echo $error_image_wishlist; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-image-cart"><?php echo $entry_image_cart; ?></label>
              <div class="col-sm-10">
                <div class="row">
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_cart_width" value="<?php echo $modern_image_cart_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-cart" class="form-control" />
                  </div>
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_cart_height" value="<?php echo $modern_image_cart_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                  </div>
                </div>
                <?php if ($error_image_cart) { ?>
                <div class="text-danger"><?php echo $error_image_cart; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-image-location"><?php echo $entry_image_location; ?></label>
              <div class="col-sm-10">
                <div class="row">
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_location_width" value="<?php echo $modern_image_location_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-location" class="form-control" />
                  </div>
                  <div class="col-sm-6">
                    <input type="text" name="modern_image_location_height" value="<?php echo $modern_image_location_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                  </div>
                </div>
                <?php if ($error_image_location) { ?>
                <div class="text-danger"><?php echo $error_image_location; ?></div>
                <?php } ?>
              </div>
            </div>
          </fieldset>
</div>
<div id="panely1" class="tab-pane fade in active">
<!-- 1 HEADER  -->	
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_account_top; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_account_top) { ?>
	<input type="radio" name="modern_account_top" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_account_top" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_account_top) { ?>
	<input type="radio" name="modern_account_top" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_account_top" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<hr>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_order_top; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_order_top) { ?>
	<input type="radio" name="modern_order_top" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_order_top" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_order_top) { ?>
	<input type="radio" name="modern_order_top" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_order_top" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_transaction_top; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_transaction_top) { ?>
	<input type="radio" name="modern_transaction_top" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_transaction_top" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_transaction_top) { ?>
	<input type="radio" name="modern_transaction_top" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_transaction_top" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_download_top; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_download_top) { ?>
	<input type="radio" name="modern_download_top" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_download_top" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_download_top) { ?>
	<input type="radio" name="modern_download_top" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_download_top" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<hr>	
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_wishlist_top; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_wishlist_top) { ?>
	<input type="radio" name="modern_wishlist_top" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_wishlist_top" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_wishlist_top) { ?>
	<input type="radio" name="modern_wishlist_top" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_wishlist_top" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_compare_top; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_compare_top) { ?>
	<input type="radio" name="modern_compare_top" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_compare_top" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_compare_top) { ?>
	<input type="radio" name="modern_compare_top" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_compare_top" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_cart_top; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_cart_top) { ?>
	<input type="radio" name="modern_cart_top" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_cart_top" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_cart_top) { ?>
	<input type="radio" name="modern_cart_top" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_cart_top" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_checkout_top; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_checkout_top) { ?>
	<input type="radio" name="modern_checkout_top" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_checkout_top" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_checkout_top) { ?>
	<input type="radio" name="modern_checkout_top" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_checkout_top" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_calltop; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_calltop) { ?>
	<input type="radio" name="modern_calltop" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_calltop" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_calltop) { ?>
	<input type="radio" name="modern_calltop" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_calltop" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<hr>	
<div class="row">
<div class="col-sm-3">
<ul class="nav nav-pills nav-stacked" id="top_link6">
<?php $top_link_row6 = 1; ?>
<?php foreach ($top_links6 as $top_link6) { ?>
	<li><a href="#tab-top_link6-<?php echo $top_link_row6; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-top_link6-<?php echo $top_link_row6; ?>\']').parent().remove(); $('#tab-top_link6-<?php echo $top_link_row6; ?>').remove(); $('#top_link6 a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $top_link_row6; ?></a></li>
	<?php $top_link_row6++; ?>
	<?php } ?>
<li id="top_link6-add"><a onclick="addtop_link6();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_top_link; ?></a></li> 
</ul>
</div>
<div class="col-sm-9">
<div class="tab-content first6">
<?php $top_link_row6 = 1; ?>
<?php foreach ($top_links6 as $top_link6) { ?>
	<div class="tab-pane" id="tab-top_link6-<?php echo $top_link_row6; ?>">
	<div class="tab-content">
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_name_top; ?></label>
	<div class="col-sm-9">
	<?php foreach ($languages as $language) { ?>
		<div class="input-group">
		<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<input type="text" class="form-control" name="modern_top_links6[<?php echo $top_link_row6; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link6['title'][$language['language_id']]) ? $top_link6['title'][$language['language_id']] : ''; ?>" size="40" />
		</div>
		<?php } ?>
	</div>
	</div> 
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>
	<div class="col-sm-9">
	<input type="text" class="form-control" name="modern_top_links6[<?php echo $top_link_row6; ?>][faicons_top]" value="<?php echo isset($top_link6['faicons_top']) ? $top_link6['faicons_top'] : ''; ?>" />	
	</div>
	</div> 
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>
	<div class="col-sm-9">
	<?php foreach ($languages as $language) { ?>
		<div class="input-group">
		<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<input type="text" class="form-control" name="modern_top_links6[<?php echo $top_link_row6; ?>][link_top][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link6['link_top'][$language['language_id']]) ? $top_link6['link_top'][$language['language_id']] : ''; ?>" size="40" />
		</div>
		<?php } ?>
	</div>
	</div> 
	</div>
	<?php $top_link_row6++; ?>
	</div>
	<?php } ?>
</div>
</div> 
</div>	
<hr><hr>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-product"><?php echo $text_telephone_mainheader; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
	<input type="text" name="modern_telephone_mainheader[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_telephone_mainheader[$language['language_id']]; ?>" id="input-modern_telephone_mainheader" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<hr>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-product"><?php echo $text_telephone_mainheader2; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
	<input type="text" name="modern_telephone_mainheader2[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_telephone_mainheader2[$language['language_id']]; ?>" id="input-modern_telephone_mainheader2" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<hr>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-product"><?php echo $text_tittle_name; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
	<input type="text" name="modern_tittle_name[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_tittle_name[$language['language_id']]; ?>" id="input-modern_tittle_name" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<hr>
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_mail_mainheader; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_mail_header[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_mail_header[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<hr>
<div class="row">
<div class="col-sm-3">
<ul class="nav nav-pills nav-stacked" id="top_link3">
<?php $top_link_row3 = 1; ?>
<?php foreach ($top_links3 as $top_link3) { ?>
	<li><a href="#tab-top_link3-<?php echo $top_link_row3; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-top_link3-<?php echo $top_link_row3; ?>\']').parent().remove(); $('#tab-top_link3-<?php echo $top_link_row3; ?>').remove(); $('#top_link3 a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $top_link_row3; ?></a></li>
	<?php $top_link_row3++; ?>
	<?php } ?>
<li id="top_link3-add"><a onclick="addtop_link3();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_top_link3; ?></a></li> 
</ul>
</div>
<div class="col-sm-9">
<div class="tab-content first3">
<?php $top_link_row3 = 1; ?>
<?php foreach ($top_links3 as $top_link3) { ?>
	<div class="tab-pane" id="tab-top_link3-<?php echo $top_link_row3; ?>">
	<div class="tab-content">
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_name_top; ?></label>
	<div class="col-sm-9">
	<?php foreach ($languages as $language) { ?>
		<div class="input-group">
		<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<input type="text" class="form-control" name="modern_top_links3[<?php echo $top_link_row3; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link3['title'][$language['language_id']]) ? $top_link3['title'][$language['language_id']] : ''; ?>" size="40" />
		</div>
		<?php } ?>
	</div>
	</div> 
		<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_name_top2; ?></label>
	<div class="col-sm-9">
	<?php foreach ($languages as $language) { ?>
		<div class="input-group">
		<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<input type="text" class="form-control" name="modern_top_links3[<?php echo $top_link_row3; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link3['name'][$language['language_id']]) ? $top_link3['name'][$language['language_id']] : ''; ?>" size="40" />
		</div>
		<?php } ?>
	</div>
	</div> 
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>
	<div class="col-sm-9">
	<input type="text" class="form-control" name="modern_top_links3[<?php echo $top_link_row3; ?>][faicons_top]" value="<?php echo isset($top_link3['faicons_top']) ? $top_link3['faicons_top'] : ''; ?>" />	
	</div>
	</div> 
	</div>
	<?php $top_link_row3++; ?>
	</div>
	<?php } ?>
</div>
</div> 
</div>	
<hr>
<div class="row">
<div class="col-sm-3">
<ul class="nav nav-pills nav-stacked" id="top_link5">
<?php $top_link_row5 = 1; ?>
<?php foreach ($top_links5 as $top_link5) { ?>
	<li><a href="#tab-top_link5-<?php echo $top_link_row5; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-top_link5-<?php echo $top_link_row5; ?>\']').parent().remove(); $('#tab-top_link5-<?php echo $top_link_row5; ?>').remove(); $('#top_link5 a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $top_link_row5; ?></a></li>
	<?php $top_link_row5++; ?>
	<?php } ?>
<li id="top_link5-add"><a onclick="addtop_link5();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_top_link5; ?></a></li> 
</ul>
</div>
<div class="col-sm-9">
<div class="tab-content first5">
<?php $top_link_row5 = 1; ?>
<?php foreach ($top_links5 as $top_link5) { ?>
	<div class="tab-pane" id="tab-top_link5-<?php echo $top_link_row5; ?>">
	<div class="tab-content">
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_name_top; ?></label>
	<div class="col-sm-9">
	<?php foreach ($languages as $language) { ?>
		<div class="input-group">
		<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<input type="text" class="form-control" name="modern_top_links5[<?php echo $top_link_row5; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link5['title'][$language['language_id']]) ? $top_link5['title'][$language['language_id']] : ''; ?>" size="40" />
		</div>
		<?php } ?>
	</div>
	</div> 
		<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_name_top2; ?></label>
	<div class="col-sm-9">
	<?php foreach ($languages as $language) { ?>
		<div class="input-group">
		<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<input type="text" class="form-control" name="modern_top_links5[<?php echo $top_link_row5; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link5['name'][$language['language_id']]) ? $top_link5['name'][$language['language_id']] : ''; ?>" size="40" />
		</div>
		<?php } ?>
	</div>
	</div> 
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>
	<div class="col-sm-9">
	<input type="text" class="form-control" name="modern_top_links5[<?php echo $top_link_row5; ?>][faicons_top]" value="<?php echo isset($top_link5['faicons_top']) ? $top_link5['faicons_top'] : ''; ?>" />	
	</div>
	</div> 
	</div>
	<?php $top_link_row5++; ?>
	</div>
	<?php } ?>
</div>
</div> 
</div>	
</div>
<!-- 2 tab FOOTER -->
<div id="panely2" class="tab-pane fade">
<div class="form-group">
<label class="col-sm-3 control-label" for="input-fluid_map_zoom"><?php echo $text_fluid_map_key; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_fluid_map_key" value="<?php echo $modern_fluid_map_key; ?>" id="input-fluid_map_key" class="form-control" />
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label" for="input-footerimg"><?php echo $text_iconmap_footer; ?></label>
<div class="col-sm-9"><a href="" id="thumb-footerimg" data-toggle="image" class="img-thumbnail"><img src="<?php echo $modern_footer_img; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
<input type="hidden" name="modern_footer_imgico" value="<?php echo $modern_footer_imgico; ?>" id="input-footerimg" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_show_fluid_map_footer; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_show_fluid_map_footer) { ?>
	<input type="radio" name="modern_show_fluid_map_footer" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_show_fluid_map_footer" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_show_fluid_map_footer) { ?>
	<input type="radio" name="modern_show_fluid_map_footer" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_show_fluid_map_footer" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-fluid_map_zoom"><?php echo $text_fluid_map_zoom; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_fluid_map_zoom" value="<?php echo $modern_fluid_map_zoom; ?>" id="input-fluid_map_zoom" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_show_contactblock; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_show_contactblock) { ?>
	<input type="radio" name="modern_show_contactblock" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_show_contactblock" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_show_contactblock) { ?>
	<input type="radio" name="modern_show_contactblock" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_show_contactblock" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_show_info_marker_block; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_show_info_marker_block) { ?>
	<input type="radio" name="modern_show_info_marker_block" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_show_info_marker_block" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_show_info_marker_block) { ?>
	<input type="radio" name="modern_show_info_marker_block" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_show_info_marker_block" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_show_logo_footer; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_show_logo_footer) { ?>
	<input type="radio" name="modern_show_logo_footer" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_show_logo_footer" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_show_logo_footer) { ?>
	<input type="radio" name="modern_show_logo_footer" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_show_logo_footer" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_show_itext_footer; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_show_itext_footer) { ?>
	<input type="radio" name="modern_show_itext_footer" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_show_itext_footer" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_show_itext_footer) { ?>
	<input type="radio" name="modern_show_itext_footer" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_show_itext_footer" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_longitude_fluid_map; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_longitude_fluid_map[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_longitude_fluid_map[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_latitude_fluid_map; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_latitude_fluid_map[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_latitude_fluid_map[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>			
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_telephone_footer; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_telephone_footer[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_telephone_footer[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_telephone1_footer; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_telephone1_footer[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_telephone1_footer[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_telephone2_footer; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_telephone2_footer[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_telephone2_footer[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_skype_footer; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_skype_footer[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_skype_footer[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_mail_footer; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_mail_footer[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_mail_footer[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_addres_footer; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_addres_footer[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_addres_footer[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_time_footer; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_time_footer[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_time_footer[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<hr>	
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_contact_footer; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_contact_footer) { ?>
	<input type="radio" name="modern_contact_footer" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_contact_footer" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_contact_footer) { ?>
	<input type="radio" name="modern_contact_footer" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_contact_footer" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_return_footer; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_return_footer) { ?>
	<input type="radio" name="modern_return_footer" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_return_footer" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_return_footer) { ?>
	<input type="radio" name="modern_return_footer" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_return_footer" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_sitemap_footer; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_sitemap_footer) { ?>
	<input type="radio" name="modern_sitemap_footer" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_sitemap_footer" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_sitemap_footer) { ?>
	<input type="radio" name="modern_sitemap_footer" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_sitemap_footer" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_manufacturer_footer; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_manufacturer_footer) { ?>
	<input type="radio" name="modern_manufacturer_footer" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_manufacturer_footer" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_manufacturer_footer) { ?>
	<input type="radio" name="modern_manufacturer_footer" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_manufacturer_footer" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_voucher_footer; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_voucher_footer) { ?>
	<input type="radio" name="modern_voucher_footer" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_voucher_footer" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_voucher_footer) { ?>
	<input type="radio" name="modern_voucher_footer" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_voucher_footer" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_affiliate_footer; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_affiliate_footer) { ?>
	<input type="radio" name="modern_affiliate_footer" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_affiliate_footer" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_affiliate_footer) { ?>
	<input type="radio" name="modern_affiliate_footer" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_affiliate_footer" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_special_footer; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_special_footer) { ?>
	<input type="radio" name="modern_special_footer" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_special_footer" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_special_footer) { ?>
	<input type="radio" name="modern_special_footer" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_special_footer" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_account_footer; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_account_footer) { ?>
	<input type="radio" name="modern_account_footer" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_account_footer" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_account_footer) { ?>
	<input type="radio" name="modern_account_footer" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_account_footer" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_order_footer; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_order_footer) { ?>
	<input type="radio" name="modern_order_footer" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_order_footer" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_order_footer) { ?>
	<input type="radio" name="modern_order_footer" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_order_footer" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_wishlist_footer; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_wishlist_footer) { ?>
	<input type="radio" name="modern_wishlist_footer" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_wishlist_footer" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_wishlist_footer) { ?>
	<input type="radio" name="modern_wishlist_footer" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_wishlist_footer" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_newsletter_footer; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_newsletter_footer) { ?>
	<input type="radio" name="modern_newsletter_footer" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_newsletter_footer" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_newsletter_footer) { ?>
	<input type="radio" name="modern_newsletter_footer" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_newsletter_footer" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<hr>	
<div class="row">
<div class="col-sm-3">
<ul class="nav nav-pills nav-stacked" id="top_link2">
<?php $top_link_row2 = 1; ?>
<?php foreach ($top_links2 as $top_link2) { ?>
	<li><a href="#tab-top_link2-<?php echo $top_link_row2; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-top_link2-<?php echo $top_link_row2; ?>\']').parent().remove(); $('#tab-top_link2-<?php echo $top_link_row2; ?>').remove(); $('#top_link2 a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $top_link_row2; ?></a></li>
	<?php $top_link_row2++; ?>
	<?php } ?>
<li id="top_link2-add"><a onclick="addtop_link2();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_top_link_socseti; ?></a></li> 
</ul>
</div>
<div class="col-sm-9">
<div class="tab-content first2">
<?php $top_link_row2 = 1; ?>
<?php foreach ($top_links2 as $top_link2) { ?>
	<div class="tab-pane" id="tab-top_link2-<?php echo $top_link_row2; ?>">
	<div class="tab-content">
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>
	<div class="col-sm-9">
	<input type="text" class="form-control" name="modern_top_links2[<?php echo $top_link_row2; ?>][faicons_top]" value="<?php echo isset($top_link2['faicons_top']) ? $top_link2['faicons_top'] : ''; ?>" />	
	</div>
	</div> 
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>
	<div class="col-sm-9">
	<input type="text" class="form-control" name="modern_top_links2[<?php echo $top_link_row2; ?>][link_top]" value="<?php echo isset($top_link2['link_top']) ? $top_link2['link_top'] : ''; ?>" />	
	</div>
	</div> 
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_hover; ?></label>
	<div class="col-sm-9">
	<input type="text" class="form-control" name="modern_top_links2[<?php echo $top_link_row2; ?>][tooltipseti]" value="<?php echo isset($top_link2['tooltipseti']) ? $top_link2['tooltipseti'] : ''; ?>" />	
	</div>
	</div> 
	</div>
	<?php $top_link_row2++; ?>
	</div>
	<?php } ?>
</div>
</div> 
</div>	
<hr>	
<div class="form-group">
<label class="col-sm-3 control-label" for="input-footerpay"><?php echo $text_payimg;?></label>
<div class="col-sm-9"><a href="" id="thumb-footerpay" data-toggle="image" class="img-thumbnail"><img src="<?php echo $modern_footerpay; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
<input type="hidden" name="modern_footer_pay" value="<?php echo $modern_footer_pay; ?>" id="input-footerpay" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-footerlogo"><?php echo $text_footerlogo;?></label>
<div class="col-sm-9"><a href="" id="thumb-footerlogo" data-toggle="image" class="img-thumbnail"><img src="<?php echo $modern_footerlogo; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
<input type="hidden" name="modern_footer_logo" value="<?php echo $modern_footer_logo; ?>" id="input-footerlogo" />
</div>
</div>
<ul class="nav nav-tabs" id="language">
<?php foreach ($languages as $language) { ?>
	<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
	<?php } ?>
</ul>
<div class="tab-content">			  
<?php foreach ($languages as $language) { ?>
	<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
	<div class="form-group">
	<label class="col-sm-3 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $text_aboutus;?></label>
	<div class="col-sm-9">
	<textarea name="modern_description[<?php echo $language['language_id']; ?>]" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($modern_description[$language['language_id']]) ? $modern_description[$language['language_id']] : ''; ?></textarea>
	</div>
	</div>
	</div>
	<?php } ?>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-product"><?php echo $text_maps_logo; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
	<input type="text" name="modern_description_map_logo[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_description_map_logo[$language['language_id']]; ?>" id="input-description_map_logo" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-product"><?php echo $text_license; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
	<input type="text" name="modern_license_text[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_license_text[$language['language_id']]; ?>" id="input-modern_license_text" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
</div>
<!--////////////////////////////////////////////////////////////////////////////////////// -->	
<!-- 4 tab -->				
<div id="panely4" class="tab-pane fade">
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_ico_home; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_ico_home) { ?>
	<input type="radio" name="modern_ico_home" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_ico_home" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_ico_home) { ?>
	<input type="radio" name="modern_ico_home" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_ico_home" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_ico_home_text; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_ico_home_text) { ?>
	<input type="radio" name="modern_ico_home_text" value="0"/>
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_ico_home_text" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_ico_home_text) { ?>
	<input type="radio" name="modern_ico_home_text" value="1"/>
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_ico_home_text" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_photos_menu; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_photos_menu) { ?>
	<input type="radio" name="modern_photos_menu" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_photos_menu" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_photos_menu) { ?>
	<input type="radio" name="modern_photos_menu" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_photos_menu" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_photos_menu_manuf; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_photos_menu_manuf) { ?>
	<input type="radio" name="modern_photos_menu_manuf" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_photos_menu_manuf" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_photos_menu_manuf) { ?>
	<input type="radio" name="modern_photos_menu_manuf" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_photos_menu_manuf" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_main_photos_menu; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_main_photos_menu) { ?>
	<input type="radio" name="modern_main_photos_menu" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_main_photos_menu" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_main_photos_menu) { ?>
	<input type="radio" name="modern_main_photos_menu" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_main_photos_menu" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>		
<div class="form-group">
<label class="col-sm-3 control-label" for="input-width"><?php echo $text_photos_menu_width; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_photos_menu_width" value="<?php echo $modern_photos_menu_width; ?>" id="input-width-menu" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-height"><?php echo $text_photos_menu_height; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_photos_menu_height" value="<?php echo $modern_photos_menu_height; ?>" id="input-height-menu" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-width_main"><?php echo $text_photos_width_image_main; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_photos_width_image_main" value="<?php echo $modern_photos_width_image_main; ?>" id="input-width-menu_main" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-height_main"><?php echo $text_photos_height_image_main; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_photos_height_image_main" value="<?php echo $modern_photos_height_image_main; ?>" id="input-height-menu_main" class="form-control" />
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label" for="input-width"><?php echo $text_menuman_column; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_menuman_column" value="<?php echo $modern_menuman_column; ?>" id="input-width-menu" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-width"><?php echo $text_photos_menuman_width; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_photos_menuman_width" value="<?php echo $modern_photos_menuman_width; ?>" id="input-width-menu" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-height"><?php echo $text_photos_menuman_height; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_photos_menuman_height" value="<?php echo $modern_photos_menuman_height; ?>" id="input-height-menu" class="form-control" />
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_3lv_menu; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_3lv_menu) { ?>
	<input type="radio" name="modern_3lv_menu" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_3lv_menu" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_3lv_menu) { ?>
	<input type="radio" name="modern_3lv_menu" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_3lv_menu" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>		
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_info_menu; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_info_menu) { ?>
	<input type="radio" name="modern_info_menu" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_info_menu" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_info_menu) { ?>
	<input type="radio" name="modern_info_menu" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_info_menu" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>		
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_man_menu; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_man_menu) { ?>
	<input type="radio" name="modern_man_menu" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_man_menu" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_man_menu) { ?>
	<input type="radio" name="modern_man_menu" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_man_menu" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_main_link_menu; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_main_link_menu[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_main_link_menu[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_main_link_href_menu; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_main_link_href_menu[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_main_link_href_menu[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<hr>
<div class="row">
<div class="col-sm-3">
<ul class="nav nav-pills nav-stacked" id="top_link4">
<?php $top_link_row4 = 1; ?>
<?php foreach ($top_links4 as $top_link4) { ?>
	<li><a href="#tab-top_link4-<?php echo $top_link_row4; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-top_link4-<?php echo $top_link_row4; ?>\']').parent().remove(); $('#tab-top_link4-<?php echo $top_link_row4; ?>').remove(); $('#top_link4 a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $top_link_row4; ?></a></li>
	<?php $top_link_row4++; ?>
	<?php } ?>
<li id="top_link4-add"><a onclick="addtop_link4();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_top_link4; ?></a></li> 
</ul>
</div>
<div class="col-sm-9">
<div class="tab-content first4">
<?php $top_link_row4 = 1; ?>
<?php foreach ($top_links4 as $top_link4) { ?>
	<div class="tab-pane" id="tab-top_link4-<?php echo $top_link_row4; ?>">
	<div class="tab-content">
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_name_top; ?></label>
	<div class="col-sm-9">
	<?php foreach ($languages as $language) { ?>
		<div class="input-group">
		<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<input type="text" class="form-control" name="modern_top_links4[<?php echo $top_link_row4; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link4['title'][$language['language_id']]) ? $top_link4['title'][$language['language_id']] : ''; ?>" size="40" />
		</div>
		<?php } ?>
	</div>
	</div> 
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>
	<div class="col-sm-9">
	<input type="text" class="form-control" name="modern_top_links4[<?php echo $top_link_row4; ?>][faicons_top]" value="<?php echo isset($top_link4['faicons_top']) ? $top_link4['faicons_top'] : ''; ?>" />	
	</div>
	</div> 
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>
	<div class="col-sm-9">
	<?php foreach ($languages as $language) { ?>
		<div class="input-group">
		<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<input type="text" class="form-control" name="modern_top_links4[<?php echo $top_link_row4; ?>][link_top][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link4['link_top'][$language['language_id']]) ? $top_link4['link_top'][$language['language_id']] : ''; ?>" size="40" />
		</div>
		<?php } ?>
	</div>
	</div> 
	</div>
	<?php $top_link_row4++; ?>
	</div>
	<?php } ?>
</div>
</div> 
</div>		
<hr>	
<hr>
<div class="row">
<div class="col-sm-3">
<ul class="nav nav-pills nav-stacked" id="top_link8">
<?php $top_link_row8 = 1; ?>
<?php foreach ($top_links8 as $top_link8) { ?>
	<li><a href="#tab-top_link8-<?php echo $top_link_row8; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-top_link8-<?php echo $top_link_row8; ?>\']').parent().remove(); $('#tab-top_link8-<?php echo $top_link_row8; ?>').remove(); $('#top_link8 a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $top_link_row8; ?></a></li>
	<?php $top_link_row8++; ?>
	<?php } ?>
<li id="top_link8-add"><a onclick="addtop_link8();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_top_link8; ?></a></li> 
</ul>
</div>
<div class="col-sm-9">
<div class="tab-content first8">
<?php $top_link_row8 = 1; ?>
<?php foreach ($top_links8 as $top_link8) { ?>
	<div class="tab-pane" id="tab-top_link8-<?php echo $top_link_row8; ?>">
	<div class="tab-content">
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_name_top; ?></label>
	<div class="col-sm-9">
	<?php foreach ($languages as $language) { ?>
		<div class="input-group">
		<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<input type="text" class="form-control" name="modern_top_links8[<?php echo $top_link_row8; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link8['title'][$language['language_id']]) ? $top_link8['title'][$language['language_id']] : ''; ?>" size="80" />
		</div>
		<?php } ?>
	</div>
	</div> 
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>
	<div class="col-sm-9">
	<input type="text" class="form-control" name="modern_top_links8[<?php echo $top_link_row8; ?>][faicons_top]" value="<?php echo isset($top_link8['faicons_top']) ? $top_link8['faicons_top'] : ''; ?>" />	
	</div>
	</div> 
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>
	<div class="col-sm-9">
	<?php foreach ($languages as $language) { ?>
		<div class="input-group">
		<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<input type="text" class="form-control" name="modern_top_links8[<?php echo $top_link_row8; ?>][link_top][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link8['link_top'][$language['language_id']]) ? $top_link8['link_top'][$language['language_id']] : ''; ?>" size="80" />
		</div>
		<?php } ?>
	</div>
	</div> 
	</div>
	<?php $top_link_row8++; ?>
	</div>
	<?php } ?>
</div>
</div> 
</div>
<hr>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_seevmenu_menu; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_seevmenu_menu) { ?>
	<input type="radio" name="modern_seevmenu_menu" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_seevmenu_menu" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_seevmenu_menu) { ?>
	<input type="radio" name="modern_seevmenu_menu" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_seevmenu_menu" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_seevmenuico; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_seevmenuico) { ?>
	<input type="radio" name="modern_seevmenuico" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_seevmenuico" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_seevmenuico) { ?>
	<input type="radio" name="modern_seevmenuico" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_seevmenuico" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_vmenu_menu; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_vmenu_menu[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_vmenu_menu[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_seeall_menu; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_seeall_menu[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_seeall_menu[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-countvmenulv"><?php echo $text_countvmenulv; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_countvmenulv" value="<?php echo $modern_countvmenulv; ?>" id="input-countvmenulv-menu" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-link_menucatalog"><?php echo $text_link_menucatalog; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_link_menucatalog" value="<?php echo $modern_link_menucatalog; ?>" id="input-link_menucatalog" class="form-control" />
</div>
</div>
</div>			
<!-- 4 tab END -->					
<!-- 5 tab -->				
<div id="panely5" class="tab-pane fade">
<label><?php echo $text_sticker_for_product;?></label>		 
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_sticker_sale_product_auto; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_sticker_sale_product_auto) { ?>
	<input type="radio" name="modern_sticker_sale_product_auto" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_sticker_sale_product_auto" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_sticker_sale_product_auto) { ?>
	<input type="radio" name="modern_sticker_sale_product_auto" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_sticker_sale_product_auto" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>			 
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_sticker_new_product_auto; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_sticker_new_product_auto) { ?>
	<input type="radio" name="modern_sticker_new_product_auto" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_sticker_new_product_auto" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_sticker_new_product_auto) { ?>
	<input type="radio" name="modern_sticker_new_product_auto" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_sticker_new_product_auto" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_sticker_top_product_auto; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_sticker_top_product_auto) { ?>
	<input type="radio" name="modern_sticker_top_product_auto" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_sticker_top_product_auto" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_sticker_top_product_auto) { ?>
	<input type="radio" name="modern_sticker_top_product_auto" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_sticker_top_product_auto" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_name_sticker_product_new; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_name_sticker_product_new[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_name_sticker_product_new[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_name_sticker_product_top; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_name_sticker_product_top[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_name_sticker_product_top[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-day"><?php echo $text_sticker_product_new_day; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_sticker_product_new_day" value="<?php echo $modern_sticker_product_new_day; ?>" id="input-day-st" class="form-control" />
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_sticker_product_rating_or_viewed; ?></label>
<div class="col-sm-9">
<select name="modern_sticker_product_top_ratinr" class="form-control">
<option value="1"<?php if($modern_sticker_product_top_ratinr == 1) { echo ' selected="selected"'; } ?>><?php echo $text_sticker_product_rating; ?></option>
<option value="2"<?php if($modern_sticker_product_top_ratinr == 2) { echo ' selected="selected"'; } ?>><?php echo $text_sticker_product_viewed; ?></option>
</select>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-rating"><?php echo $text_sticker_product_top_rating; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_sticker_product_top_rating" value="<?php echo $modern_sticker_product_top_rating; ?>" id="input-top-rating" class="form-control" />
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label" for="input-viewed"><?php echo $text_sticker_product_top_viewed; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_sticker_product_top_viewed" value="<?php echo $modern_sticker_product_top_viewed; ?>" id="input-top-viewed" class="form-control" />
</div>
</div>		
</div>				
<!-- 5 tab END -->				
<!-- 6 tab categories -->			
<div id="panely6" class="tab-pane fade">
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_categories_2lv; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_categories_2lv) { ?>
	<input type="radio" name="modern_categories_2lv" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_categories_2lv" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_categories_2lv) { ?>
	<input type="radio" name="modern_categories_2lv" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_categories_2lv" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label" for="input-width"><?php echo $text_categories_2lv_width; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_categories_2lv_width" value="<?php echo $modern_categories_2lv_width; ?>" id="input-width-cat" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-height"><?php echo $text_categories_2lv_height; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_categories_2lv_height" value="<?php echo $modern_categories_2lv_height; ?>" id="input-height-cat" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_description_length; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_description_length) { ?>
	<input type="radio" name="modern_description_length" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_description_length" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_description_length) { ?>
	<input type="radio" name="modern_description_length" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_description_length" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_count_cat; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_count_cat) { ?>
	<input type="radio" name="modern_count_cat" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_count_cat" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_count_cat) { ?>
	<input type="radio" name="modern_count_cat" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_count_cat" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_sort_cat; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_sort_cat) { ?>
	<input type="radio" name="modern_sort_cat" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_sort_cat" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_sort_cat) { ?>
	<input type="radio" name="modern_sort_cat" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_sort_cat" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_description_top_or_bot; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_description_top_or_bot) { ?>
	<input type="radio" name="modern_description_top_or_bot" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_description_top_or_bot" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_description_top_or_bot) { ?>
	<input type="radio" name="modern_description_top_or_bot" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_description_top_or_bot" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>	
</div>
<!-- 6 tab END -->	
<!-- 7 tab product -->			
<div id="panely7" class="tab-pane fade">
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_elevatezoom; ?></label>
<div class="col-sm-9">
<select name="modern_elevatezoom" class="form-control">
<option value="0"<?php if($modern_elevatezoom < 1) { echo ' selected="selected"'; } ?>>Basic Zoom</option>
<option value="1"<?php if($modern_elevatezoom == 1) { echo ' selected="selected"'; } ?>>Tints Zoom</option>
<option value="2"<?php if($modern_elevatezoom == 2) { echo ' selected="selected"'; } ?>>Inner Zoom</option>
<option value="3"<?php if($modern_elevatezoom == 3) { echo ' selected="selected"'; } ?>>Lens Zoom</option>
<option value="4"<?php if($modern_elevatezoom == 4) { echo ' selected="selected"'; } ?>>Image Constrain Zoom</option>
</select>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_product_size; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_product_size) { ?>
	<input type="radio" name="modern_product_size" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_size" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_product_size) { ?>
	<input type="radio" name="modern_product_size" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_size" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_product_weight; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_product_weight) { ?>
	<input type="radio" name="modern_product_weight" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_weight" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_product_weight) { ?>
	<input type="radio" name="modern_product_weight" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_weight" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_product_kod_tovara; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_product_kod_tovara) { ?>
	<input type="radio" name="modern_product_kod_tovara" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_kod_tovara" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_product_kod_tovara) { ?>
	<input type="radio" name="modern_product_kod_tovara" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_kod_tovara" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_product_man_img; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_product_man_img) { ?>
	<input type="radio" name="modern_product_man_img" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_man_img" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_product_man_img) { ?>
	<input type="radio" name="modern_product_man_img" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_man_img" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-product_raiting"><?php echo $text_product_raiting; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_product_raiting" value="<?php echo $modern_product_raiting; ?>" id="input-product_raiting" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_product_timer; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_product_timer) { ?>
	<input type="radio" name="modern_product_timer" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_timer" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_product_timer) { ?>
	<input type="radio" name="modern_product_timer" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_timer" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-width"><?php echo $text_product_man_width; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_product_man_width" value="<?php echo $modern_product_man_width; ?>" id="input-width-man" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-height"><?php echo $text_product_man_height; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_product_man_height" value="<?php echo $modern_product_man_height; ?>" id="input-height-man" class="form-control" />
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label" for="input-optionimg_width"><?php echo $text_product_optionimg_width; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_product_optionimg_width" value="<?php echo $modern_product_optionimg_width; ?>" id="input-optionimg_width" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-optionimg_height"><?php echo $text_product_optionimg_height; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_product_optionimg_height" value="<?php echo $modern_product_optionimg_height; ?>" id="input-optionimg_height" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_product_show_share; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_product_show_share) { ?>
	<input type="radio" name="modern_product_show_share" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_show_share" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_product_show_share) { ?>
	<input type="radio" name="modern_product_show_share" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_show_share" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-height"><?php echo $text_product_share; ?></label>
<div class="col-sm-9">
<textarea name="modern_share" rows="15" placeholder="" id="input-modern_share" class="form-control"><?php echo $modern_share; ?></textarea>	
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_product_show_sku; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_product_show_sku) { ?>
	<input type="radio" name="modern_product_show_sku" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_show_sku" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_product_show_sku) { ?>
	<input type="radio" name="modern_product_show_sku" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_show_sku" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_product_show_upc; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_product_show_upc) { ?>
	<input type="radio" name="modern_product_show_upc" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_show_upc" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_product_show_upc) { ?>
	<input type="radio" name="modern_product_show_upc" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_show_upc" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_product_show_ean; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_product_show_ean) { ?>
	<input type="radio" name="modern_product_show_ean" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_show_ean" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_product_show_ean) { ?>
	<input type="radio" name="modern_product_show_ean" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_show_ean" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_product_show_jan; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_product_show_jan) { ?>
	<input type="radio" name="modern_product_show_jan" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_show_jan" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_product_show_jan) { ?>
	<input type="radio" name="modern_product_show_jan" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_product_show_jan" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_product_sku; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_product_sku[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_product_sku[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_product_upc; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_product_upc[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_product_upc[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_product_ean; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_product_ean[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_product_ean[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label"><?php echo $text_product_jan; ?></label>
<div class="col-sm-9">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="modern_product_jan[<?php echo $language['language_id']; ?>]" value="<?php echo $modern_product_jan[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="row">
<div class="col-sm-3">
<ul class="nav nav-pills nav-stacked" id="top_link7">
<?php $top_link_row7 = 1; ?>
<?php foreach ($top_links7 as $top_link7) { ?>
	<li><a href="#tab-top_link7-<?php echo $top_link_row7; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-top_link7-<?php echo $top_link_row7; ?>\']').parent().remove(); $('#tab-top_link7-<?php echo $top_link_row7; ?>').remove(); $('#top_link7 a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $top_link_row7; ?></a></li>
	<?php $top_link_row7++; ?>
	<?php } ?>
<li id="top_link7-add"><a onclick="addtop_link7();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_top_link7; ?></a></li> 
</ul>
</div>
<div class="col-sm-9">
<div class="tab-content first7">
<?php $top_link_row7 = 1; ?>
<?php foreach ($top_links7 as $top_link7) { ?>
	<div class="tab-pane" id="tab-top_link7-<?php echo $top_link_row7; ?>">
	<div class="tab-content">
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_name_top_add_tabs; ?></label>
	<div class="col-sm-9">
	<?php foreach ($languages as $language) { ?>
		<div class="input-group">
		<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<input type="text" class="form-control" name="modern_top_links7[<?php echo $top_link_row7; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link7['title'][$language['language_id']]) ? $top_link7['title'][$language['language_id']] : ''; ?>" size="70" />
		</div>
		<?php } ?>
	</div>
	</div> 
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>
	<div class="col-sm-9">
	<?php foreach ($languages as $language) { ?>
		<div class="input-group">
		<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>                                                      
		<textarea class="form-control custom-control summernote" cols="3" name="modern_top_links7[<?php echo $top_link_row7; ?>][description][<?php echo $language['language_id']; ?>]" id="description-<?php echo $top_link_row7; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($top_link7['description'][$language['language_id']]) ? $top_link7['description'][$language['language_id']] : ''; ?>     </textarea>
		</div>
		<?php } ?>
	</div>
	</div> 
	</div>
	<?php $top_link_row7++; ?>
	</div>
	<?php } ?>
</div>
</div> 
</div>	
<hr>
<div class="row">
<h1 class="col-sm-12"><?php echo $text_header_link9; ?></h1>
<div class="col-sm-3">
<ul class="nav nav-pills nav-stacked" id="top_link9">
<?php $top_link_row9 = 1; ?>
<?php foreach ($top_links9 as $top_link9) { ?>
	<li><a href="#tab-top_link9-<?php echo $top_link_row9; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-top_link9-<?php echo $top_link_row9; ?>\']').parent().remove(); $('#tab-top_link9-<?php echo $top_link_row9; ?>').remove(); $('#top_link9 a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $top_link_row9; ?></a></li>
	<?php $top_link_row9++; ?>
	<?php } ?>
<li id="top_link9-add"><a onclick="addtop_link9();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_top_link9; ?></a></li> 
</ul>
</div>
<div class="col-sm-9">
<div class="tab-content first9">
<?php $top_link_row9 = 1; ?>
<?php foreach ($top_links9 as $top_link9) { ?>
	<div class="tab-pane" id="tab-top_link9-<?php echo $top_link_row9; ?>">
	<div class="tab-content">
	<div class="form-group">
<label class="col-sm-3 control-label" for="input-block_img<?php echo $top_link_row9; ?>"><?php echo $text_link_image;?></label>
<div class="col-sm-9">
<a href="" id="thumb-block_img<?php echo $top_link_row9; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $top_link9['image_href']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
<input type="hidden" name="modern_top_links9[<?php echo $top_link_row9; ?>][image]" value="<?php echo $top_link9['image']; ?>" id="input-block_img<?php echo $top_link_row9; ?>" />
</div>
</div>
	<div class="form-group">
	<label class="col-sm-3 control-label" ><?php echo $text_text_description; ?></label>
	<div class="col-sm-9">
	<?php foreach ($languages as $language) { ?>
		<div class="input-group">
		<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>                                                      
		<textarea class="form-control custom-control summernote" cols="3" name="modern_top_links9[<?php echo $top_link_row9; ?>][description][<?php echo $language['language_id']; ?>]" id="description_info-<?php echo $top_link_row9; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($top_link9['description'][$language['language_id']]) ? $top_link9['description'][$language['language_id']] : ''; ?>     </textarea>
		</div>
		<?php } ?>
	</div>
	</div> 
	</div>
	<?php $top_link_row9++; ?>
	</div>
	<?php } ?>
</div>
</div> 
</div>
</div>
<!-- 7 tab END -->	
<!-- 8 tab common -->			
<div id="panely8" class="tab-pane fade">
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_header_var; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_header_var) { ?>
	<input type="radio" name="modern_header_var" value="0" />
	<?php echo $text_header_max; ?>
	<?php } else { ?>
	<input type="radio" name="modern_header_var" value="0" checked="checked" />
	<?php echo $text_header_max; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_header_var) { ?>
	<input type="radio" name="modern_header_var" value="1" />
	<?php echo $text_header_mini; ?>
	<?php } else { ?>
	<input type="radio" name="modern_header_var" value="1" checked="checked" />
	<?php echo $text_header_mini; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-cart_img"><?php echo $text_cart;?></label>
<div class="col-sm-9"><a href="" id="thumb-cart_img" data-toggle="image" class="img-thumbnail"><img src="<?php echo $modern_cart_logo; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
<input type="hidden" name="modern_cart_img" value="<?php echo $modern_cart_img; ?>" id="input-cart_img" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_callleft; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_callleft) { ?>
	<input type="radio" name="modern_callleft" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_callleft" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_callleft) { ?>
	<input type="radio" name="modern_callleft" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_callleft" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_wishlist_cat; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_wishlist_cat) { ?>
	<input type="radio" name="modern_wishlist_cat" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_wishlist_cat" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_wishlist_cat) { ?>
	<input type="radio" name="modern_wishlist_cat" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_wishlist_cat" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_comparet_cat; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_compare_cat) { ?>
	<input type="radio" name="modern_compare_cat" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_compare_cat" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_compare_cat) { ?>
	<input type="radio" name="modern_compare_cat" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_compare_cat" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_description_cat; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_description_cat) { ?>
	<input type="radio" name="modern_description_cat" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_description_cat" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_description_cat) { ?>
	<input type="radio" name="modern_description_cat" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_description_cat" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_atribute_cat; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_atribute) { ?>
	<input type="radio" name="modern_atribute" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_atribute" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_atribute) { ?>
	<input type="radio" name="modern_atribute" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_atribute" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_rating_cat; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_rating_cat) { ?>
	<input type="radio" name="modern_rating_cat" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_rating_cat" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_rating_cat) { ?>
	<input type="radio" name="modern_rating_cat" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_rating_cat" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>	
<div class="form-group">
<label class="col-sm-3 control-label" ><?php echo $text_arrowup; ?></label>
<div class="col-sm-9">
<label class="radio-inline">
<?php if ($modern_arrowup) { ?>
	<input type="radio" name="modern_arrowup" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="modern_arrowup" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$modern_arrowup) { ?>
	<input type="radio" name="modern_arrowup" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="modern_arrowup" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-limit_symbols"><?php echo $text_limit_symbols; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_limit_symbolst" value="<?php echo $modern_limit_symbolst; ?>" id="input-limit_symbols" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-3 control-label" for="input-attribute_see"><?php echo $text_pr_attribute_see; ?></label>
<div class="col-sm-9">
<input type="text" name="modern_attribute_see" value="<?php echo $modern_attribute_see; ?>" id="input-attribute_see" class="form-control" />
</div>
</div>
<script src="view/javascript/jscolor/jscolor.js" type="text/javascript"></script>								
								<div class="form-group">
								<label class="col-sm-2 control-label" ><?php echo $text_main_background_color;?></label>
								<div class="col-sm-10">
								<input name="modern_main_background_color" value="<?php echo $modern_main_background_color; ?>" class="color"  />
								</div>
								</div>
								<div class="form-group">
								<label class="col-sm-2 control-label" ><?php echo $text_main_color_text;?></label>
								<div class="col-sm-10">
								<input name="modern_main_color_text" value="<?php echo $modern_main_color_text; ?>" class="color"  />
								</div>
								</div>
								<div class="form-group">
								<label class="col-sm-2 control-label" ><?php echo $text_main_color_text2;?></label>
								<div class="col-sm-10">
								<input name="modern_main_color_text2" value="<?php echo $modern_main_color_text2; ?>" class="color"  />
								</div>
								</div>
								<div class="form-group">
								<label class="col-sm-2 control-label" ><?php echo $text_main_color_text3;?></label>
								<div class="col-sm-10">
								<input name="modern_main_color_text3" value="<?php echo $modern_main_color_text3; ?>" class="color"  />
								</div> 
								</div>
								<div class="form-group">
								<label class="col-sm-2 control-label" ><?php echo $text_background_btn;?></label>
								<div class="col-sm-10">
								<input name="modern_background_btn" value="<?php echo $modern_background_btn; ?>" class="color"  />
								</div>
								</div>							
								<div class="form-group">
								<label class="col-sm-2 control-label" ><?php echo $text_text_color_btn;?></label>
								<div class="col-sm-10">
								<input name="modern_text_color_btn" value="<?php echo $modern_text_color_btn; ?>" class="color"  />
								</div>
								</div>	
								<div class="form-group">
								<label class="col-sm-2 control-label" ><?php echo $text_color_border_btn;?></label>
								<div class="col-sm-10">
								<input name="modern_text_color_border_btn" value="<?php echo $modern_text_color_border_btn; ?>" class="color"  />
								</div>
								</div>								
								<div class="form-group">
								<label class="col-sm-2 control-label" ><?php echo $text_background_btn_hover;?></label>
								<div class="col-sm-10">
								<input name="modern_background_btn_hover" value="<?php echo $modern_background_btn_hover; ?>" class="color"  />
								</div>
								</div>							
								<div class="form-group">
								<label class="col-sm-2 control-label" ><?php echo $text_text_color_btn_hover;?></label>
								<div class="col-sm-10">
								<input name="modern_text_color_btn_hover" value="<?php echo $modern_text_color_btn_hover; ?>" class="color"  />
								</div>
								</div>									
								<div class="form-group">
								<label class="col-sm-2 control-label" ><?php echo $text_color_border_btn_hover;?></label>
								<div class="col-sm-10">
								<input name="modern_text_color_border_btn_hover" value="<?php echo $modern_text_color_border_btn_hover; ?>" class="color"  />
								</div>
								</div>	
								<div class="form-group">
								<label class="col-sm-2 control-label" ><?php echo $text_color_callback;?></label>
								<div class="col-sm-10">
								<input name="modern_color_callback" value="<?php echo $modern_color_callback; ?>" class="color"  />
								</div>
								</div>	
								<div class="form-group">
								<label class="col-sm-2 control-label" ><?php echo $text_color_tittle_news;?></label>
								<div class="col-sm-10">
								<input name="modern_color_tittle_news" value="<?php echo $modern_color_tittle_news; ?>" class="color"  />
								</div>
								</div>									
							    <div class="form-group">
								<label class="col-sm-2 control-label" ><?php echo $text_color_text_news;?></label>
								<div class="col-sm-10">
								<input name="modern_color_text_news" value="<?php echo $modern_color_text_news; ?>" class="color"  />
								</div>
								</div>								
				<input type="button" onClick="start()" class="btn btn-primary" id="color_settings" value="<?php echo $text_color_def;?>" />				
<script>								
$('#color_settings').click(function() {
$("input[name='modern_main_background_color']").val("2f2f2f");
$("input[name='modern_main_color_text']").val("ffffff");
$("input[name='modern_main_color_text2']").val("79C1D4");
$("input[name='modern_main_color_text3']").val("737373");
$("input[name='modern_background_btn']").val("2F2F2F");
$("input[name='modern_text_color_btn']").val("ffffff");
$("input[name='modern_background_btn_hover']").val("51473C");
$("input[name='modern_text_color_btn_hover']").val("ffffff");
$("input[name='modern_text_color_border_btn']").val("737373");
$("input[name='modern_text_color_border_btn_hover']").val("737373");
$("input[name='modern_color_callback']").val("A99D90");
$("input[name='modern_color_tittle_news']").val("A7A7A7");
$("input[name='modern_color_text_news']").val("ffffff");
});
</script>
</div>
<!-- 8 tab END -->	
<!-- 9 tab -->	
<div id="panely9" class="tab-pane fade">
<div class="form-group">
<div class="col-sm-5">
<textarea name="modern_counter" rows="15" placeholder="" id="input-modern_counter" class="form-control"><?php echo $modern_counter; ?></textarea>	
</div>
</div>
</div>
<!-- 10 tab -->	
<div id="panely10" class="tab-pane fade">
<div class="form-group">
<div class="col-sm-5">
<textarea name="modern_css" rows="15" placeholder="" id="input-modern_css" class="form-control"><?php echo $modern_css; ?></textarea>	
</div>
</div>
</div>
</div>				
</div>				
</div>
        </form>
      </div>
    </div>
  </div>
</div>
<style>
.subtle-pattern2{
height:141px;
	margin-bottom:52px;
}
.subtle-pattern{
float: left; 
	margin-left: 15px;
}
.tleft{
	margin-right:45px;				
}
</style>
<script type="text/javascript"><!--
<?php $top_link_row7 = 1; ?>
<?php foreach ($top_links7 as $top_link7) { ?>
	$('#language<?php echo $top_link_row7; ?> li:first-child a').tab('show');
	<?php $top_link_row7++; ?>
	<?php } ?> 
//--></script> 		
<!-- Background --> 
<script type="text/javascript"><!--
$(document).ready(function() {
	var imgBig = $('#bigimg img');
	imgSmall = $('#smallimg img');
	imgSmall.click(function(event) {
		event.preventDefault();
		if (imgBig.attr('src') != $(this).attr('src')) {
			imgBig.hide().attr('src',$(this).attr('src'));
			imgBig.load(function() {
				$(this).fadeIn(100);
			});
		}
		imgSmall.fadeTo(500,1);
		$(this).fadeTo(500,0.6);	
	});
});
//--></script>
<script type="text/javascript"><!--
$(document).ready(function(){
	// Отображается 1 вкладка,
	// т.к. отсчёт начинается с нуля
	$("#myTab2 li:eq(0) a").tab('show');
});
//--></script>
<script type="text/javascript"><!--
$('#top_link2 li:first-child a').tab('show');
//--></script>
<script type="text/javascript"><!--
$('#top_link3 li:first-child a').tab('show');
//--></script>
<script type="text/javascript"><!--
$('#top_link4 li:first-child a').tab('show');
//--></script>
<script type="text/javascript"><!--
$('#top_link5 li:first-child a').tab('show');
//--></script>
<script type="text/javascript">
$('#top_link6 li:first-child a').tab('show');
//--></script>
<script type="text/javascript">
$('#top_link7 li:first-child a').tab('show');
//--></script>
<script type="text/javascript">
$('#top_link8 li:first-child a').tab('show');
//--></script>
<script type="text/javascript">
$('#top_link9 li:first-child a').tab('show');
//--></script>
<!-- add top menu header info -->
<script type="text/javascript"><!--
var top_link_row6 = <?php echo $top_link_row6; ?>;
function addtop_link6() {	
	group_row = 0;
	html  = '<div class="tab-pane" id="tab-top_link6-' + top_link_row6 + '">';
	html += '<div class="tab-content">';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_top_link_title; ?></label>';
	html += '<div class="col-sm-9">';
	<?php foreach ($languages as $language) { ?>
		html += '<div class="input-group">';
		html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
		html += '<input type="text" class="form-control" name="modern_top_links6[' + top_link_row6 + '][title][<?php echo $language['language_id']; ?>]" size="40" />';
		html += '</div>';
		<?php } ?>
	html += '</div>';
	html += '</div>';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>';
	html += '<div class="col-sm-9">';
	html += '<input type="text" class="form-control" name="modern_top_links6[' + top_link_row6 + '][faicons_top]" />';
	html += '</div>';
	html += '</div>';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>';
	html += '<div class="col-sm-9">';
	<?php foreach ($languages as $language) { ?>
		html += '<div class="input-group">';
		html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
		html += '<input type="text" class="form-control" name="modern_top_links6[' + top_link_row6 + '][link_top][<?php echo $language['language_id']; ?>]" size="40" />';
		html += '</div>';
		<?php } ?>
	html += '</div>';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	$('.tab-content.first6').append(html);
	$('#top_link6-add').before('<li><a href="#tab-top_link6-' + top_link_row6 + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link6-' + top_link_row6 + '\\\']\').parent().remove(); $(\'#tab-top_link6-' + top_link_row6 + '\').remove(); $(\'#top_link6 a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row6 + '</a></li>');
	$('#top_link6 a[href=\'#tab-top_link6-' + top_link_row6 + '\']').tab('show');
	top_link_row6++;
}
//--></script>
<!-- add footer social network -->
<script type="text/javascript"><!--
var top_link_row2 = <?php echo $top_link_row2; ?>;
function addtop_link2() {	
	group_row = 0;
	html  = '<div class="tab-pane" id="tab-top_link2-' + top_link_row2 + '">';
	html += '<div class="tab-content">';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>';
	html += '<div class="col-sm-9">';
	html += '<input type="text" class="form-control" name="modern_top_links2[' + top_link_row2 + '][faicons_top]" />';
	html += '</div>';
	html += '</div>';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>';
	html += '<div class="col-sm-9">';
	html += '<input type="text" class="form-control" name="modern_top_links2[' + top_link_row2 + '][link_top]" />';
	html += '</div>';
	html += '</div>';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_hover; ?></label>';
	html += '<div class="col-sm-9">';
	html += '<input type="text" class="form-control" name="modern_top_links2[' + top_link_row2 + '][tooltipseti]" />';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	$('.tab-content.first2').append(html);
	$('#top_link2-add').before('<li><a href="#tab-top_link2-' + top_link_row2 + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link2-' + top_link_row2 + '\\\']\').parent().remove(); $(\'#tab-top_link2-' + top_link_row2 + '\').remove(); $(\'#top_link2 a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row2 + '</a></li>');
	$('#top_link2 a[href=\'#tab-top_link2-' + top_link_row2 + '\']').tab('show');
	top_link_row2++;
}
//--></script>
<!-- add info block header tell -->
<script type="text/javascript"><!--
var top_link_row3 = <?php echo $top_link_row3; ?>;
function addtop_link3() {	
	group_row = 0;
	html  = '<div class="tab-pane" id="tab-top_link3-' + top_link_row3 + '">';
	html += '<div class="tab-content">';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_top_link_title; ?></label>';
	html += '<div class="col-sm-9">';
	<?php foreach ($languages as $language) { ?>
		html += '<div class="input-group">';
		html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
		html += '<input type="text" class="form-control" name="modern_top_links3[' + top_link_row3 + '][title][<?php echo $language['language_id']; ?>]" size="40" />';
		html += '</div>';
		<?php } ?>
	html += '</div>';
	html += '</div>';
		html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_name_top2; ?></label>';
	html += '<div class="col-sm-9">';
	<?php foreach ($languages as $language) { ?>
		html += '<div class="input-group">';
		html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
		html += '<input type="text" class="form-control" name="modern_top_links3[' + top_link_row3 + '][name][<?php echo $language['language_id']; ?>]" size="40" />';
		html += '</div>';
		<?php } ?>
	html += '</div>';
	html += '</div>';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>';
	html += '<div class="col-sm-9">';
	html += '<input type="text" class="form-control" name="modern_top_links3[' + top_link_row3 + '][faicons_top]" />';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	$('.tab-content.first3').append(html);
	$('#top_link3-add').before('<li><a href="#tab-top_link3-' + top_link_row3 + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link3-' + top_link_row3 + '\\\']\').parent().remove(); $(\'#tab-top_link3-' + top_link_row3 + '\').remove(); $(\'#top_link3 a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row3 + '</a></li>');
	$('#top_link3 a[href=\'#tab-top_link3-' + top_link_row3 + '\']').tab('show');
	top_link_row3++;
}
//--></script>
<!-- add menu link  -->
<script type="text/javascript"><!--
var top_link_row4 = <?php echo $top_link_row4; ?>;
function addtop_link4() {	
	group_row = 0;
	html  = '<div class="tab-pane" id="tab-top_link4-' + top_link_row4 + '">';
	html += '<div class="tab-content">';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_top_link_title; ?></label>';
	html += '<div class="col-sm-9">';
	<?php foreach ($languages as $language) { ?>
		html += '<div class="input-group">';
		html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
		html += '<input type="text" class="form-control" name="modern_top_links4[' + top_link_row4 + '][title][<?php echo $language['language_id']; ?>]" size="40" />';
		html += '</div>';
		<?php } ?>
	html += '</div>';
	html += '</div>';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>';
	html += '<div class="col-sm-9">';
	html += '<input type="text" class="form-control" name="modern_top_links4[' + top_link_row4 + '][faicons_top]" />';
	html += '</div>';
	html += '</div>';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>';
	html += '<div class="col-sm-9">';
	<?php foreach ($languages as $language) { ?>
		html += '<div class="input-group">';
		html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
		html += '<input type="text" class="form-control" name="modern_top_links4[' + top_link_row4 + '][link_top][<?php echo $language['language_id']; ?>]" size="40" />';
		html += '</div>';
		<?php } ?>
	html += '</div>';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	$('.tab-content.first4').append(html);
	$('#top_link4-add').before('<li><a href="#tab-top_link4-' + top_link_row4 + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link4-' + top_link_row4 + '\\\']\').parent().remove(); $(\'#tab-top_link4-' + top_link_row4 + '\').remove(); $(\'#top_link4 a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row4 + '</a></li>');
	$('#top_link4 a[href=\'#tab-top_link4-' + top_link_row4 + '\']').tab('show');
	top_link_row4++;
}
//--></script>
<!-- add info block header skype -->
<script type="text/javascript"><!--
var top_link_row5 = <?php echo $top_link_row5; ?>;
function addtop_link5() {	
	group_row = 0;
	html  = '<div class="tab-pane" id="tab-top_link5-' + top_link_row5 + '">';
	html += '<div class="tab-content">';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_top_link_title; ?></label>';
	html += '<div class="col-sm-9">';
	<?php foreach ($languages as $language) { ?>
		html += '<div class="input-group">';
		html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
		html += '<input type="text" class="form-control" name="modern_top_links5[' + top_link_row5 + '][title][<?php echo $language['language_id']; ?>]" size="40" />';
		html += '</div>';
		<?php } ?>
	html += '</div>';
	html += '</div>';
		html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_name_top2; ?></label>';
	html += '<div class="col-sm-9">';
	<?php foreach ($languages as $language) { ?>
		html += '<div class="input-group">';
		html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
		html += '<input type="text" class="form-control" name="modern_top_links5[' + top_link_row5 + '][name][<?php echo $language['language_id']; ?>]" size="40" />';
		html += '</div>';
		<?php } ?>
	html += '</div>';
	html += '</div>';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>';
	html += '<div class="col-sm-9">';
	html += '<input type="text" class="form-control" name="modern_top_links5[' + top_link_row5 + '][faicons_top]" />';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	$('.tab-content.first5').append(html);
	$('#top_link5-add').before('<li><a href="#tab-top_link5-' + top_link_row5 + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link5-' + top_link_row5 + '\\\']\').parent().remove(); $(\'#tab-top_link5-' + top_link_row5 + '\').remove(); $(\'#top_link5 a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row5 + '</a></li>');
	$('#top_link5 a[href=\'#tab-top_link5-' + top_link_row5 + '\']').tab('show');
	top_link_row5++;
}
//--></script>
<!-- add tabs product -->
<script type="text/javascript"><!--
var top_link_row7 = <?php echo $top_link_row7; ?>;
function addtop_link7() {	
	group_row = 0;
	html  = '<div class="tab-pane" id="tab-top_link7-' + top_link_row7 + '">';
	html += '<div class="tab-content">';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_name_top_add_tabs; ?></label>';
	html += '<div class="col-sm-9">';
	<?php foreach ($languages as $language) { ?>
		html += '<div class="input-group">';
		html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
		html += '<input type="text" class="form-control" name="modern_top_links7[' + top_link_row7 + '][title][<?php echo $language['language_id']; ?>]" size="70" />';
		html += '</div>';
		<?php } ?>
	html += '</div>';
	html += '</div>';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_text_description; ?></label>';
	html += '<div class="col-sm-9">';
	<?php foreach ($languages as $language) { ?>
		html += '<div class="input-group">';
		html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
		html += '<textarea name="modern_top_links7[' + top_link_row7 + '][description][<?php echo $language['language_id']; ?>]" id="description-' + top_link_row7 + '-<?php echo $language['language_id']; ?>" class="summernote-' + top_link_row7 + ' form-control"></textarea>';
		html += '</div>';
		<?php } ?>
	html += '</div>';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	$('.tab-content.first7').append(html);
	$('#top_link7-add').before('<li><a href="#tab-top_link7-' + top_link_row7 + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link7-' + top_link_row7 + '\\\']\').parent().remove(); $(\'#tab-top_link7-' + top_link_row7 + '\').remove(); $(\'#top_link7 a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row7 + '</a></li>');
	<?php if ($ckeditor) { ?>
	<?php foreach ($languages as $language) { ?>
	ckeditorInit('description-' + top_link_row7 + '-<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
	<?php } ?>
	<?php } else { ?>
	$('.summernote-' + top_link_row7 ).summernote({ 
    height: 150,   //set editable area's height
	});
	<?php } ?>
	$('#top_link7 a[href=\'#tab-top_link7-' + top_link_row7 + '\']').tab('show');
	top_link_row7++;
}
//--></script>
<!-- add menu link   -->
<script type="text/javascript"><!--
var top_link_row8 = <?php echo $top_link_row8; ?>;
function addtop_link8() {	
	group_row = 0;
	html  = '<div class="tab-pane" id="tab-top_link8-' + top_link_row8 + '">';
	html += '<div class="tab-content">';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_top_link_title; ?></label>';
	html += '<div class="col-sm-9">';
	<?php foreach ($languages as $language) { ?>
		html += '<div class="input-group">';
		html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
		html += '<input type="text" class="form-control" name="modern_top_links8[' + top_link_row8 + '][title][<?php echo $language['language_id']; ?>]" size="80" />';
		html += '</div>';
		<?php } ?>
	html += '</div>';
	html += '</div>';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>';
	html += '<div class="col-sm-9">';
	html += '<input type="text" class="form-control" name="modern_top_links8[' + top_link_row8 + '][faicons_top]" />';
	html += '</div>';
	html += '</div>';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>';
	html += '<div class="col-sm-9">';
	<?php foreach ($languages as $language) { ?>
		html += '<div class="input-group">';
		html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
		html += '<input type="text" class="form-control" name="modern_top_links8[' + top_link_row8 + '][link_top][<?php echo $language['language_id']; ?>]" size="80" />';
		html += '</div>';
		<?php } ?>
	html += '</div>';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	$('.tab-content.first8').append(html);
	$('#top_link8-add').before('<li><a href="#tab-top_link8-' + top_link_row8 + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link8-' + top_link_row8 + '\\\']\').parent().remove(); $(\'#tab-top_link8-' + top_link_row8 + '\').remove(); $(\'#top_link8 a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row8 + '</a></li>');
	$('#top_link8 a[href=\'#tab-top_link8-' + top_link_row8 + '\']').tab('show');
	top_link_row8++;
}
//--></script>
<!-- add block product -->
<script type="text/javascript"><!--
var top_link_row9 = <?php echo $top_link_row9; ?>;
function addtop_link9() {	
	group_row = 0;
	html  = '<div class="tab-pane" id="tab-top_link9-' + top_link_row9 + '">';
	html += '<div class="tab-content">';
	html += '<div class="form-group">';
html += '<label class="col-sm-3 control-label" for="input-block_img' + top_link_row9 + '"><?php echo $text_link_image;?></label>';
html += '<div class="col-sm-9"><a href="" id="thumb-block_img' + top_link_row9 + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" /></a>';
html += '<input type="hidden" name="modern_top_links9[' + top_link_row9 + '][image]" value="" id="input-block_img' + top_link_row9 + '" />';
	html += '</div>';
	html += '</div>';
	html += '<div class="form-group">';
	html += '<label class="col-sm-3 control-label" ><?php echo $text_text_description; ?></label>';
	html += '<div class="col-sm-9">';
	<?php foreach ($languages as $language) { ?>
		html += '<div class="input-group">';
		html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
		html += '<textarea name="modern_top_links9[' + top_link_row9 + '][description][<?php echo $language['language_id']; ?>]" id="description_info-' + top_link_row9 + '-<?php echo $language['language_id']; ?>" class="summernote-' + top_link_row9 + ' form-control"></textarea>';
		html += '</div>';
		<?php } ?>
	html += '</div>';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	$('.tab-content.first9').append(html);
	$('#top_link9-add').before('<li><a href="#tab-top_link9-' + top_link_row9 + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link9-' + top_link_row9 + '\\\']\').parent().remove(); $(\'#tab-top_link9-' + top_link_row9 + '\').remove(); $(\'#top_link9 a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row9 + '</a></li>');
	<?php if ($ckeditor) { ?>
	<?php foreach ($languages as $language) { ?>
	ckeditorInit('description_info-' + top_link_row9 + '-<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
	<?php } ?>
	<?php } else { ?>
	$('.summernote-' + top_link_row9 ).summernote({ 
    height: 150,   //set editable area's height
	});
	<?php } ?>
	$('#top_link9 a[href=\'#tab-top_link9-' + top_link_row9 + '\']').tab('show');
	top_link_row9++;
}
//--></script>
<script type="text/javascript"><!--
$('#language a:first').tab('show');
$('#option a:first').tab('show');
//--></script>
<?php if (!$ckeditor) { ?>
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
<!-- summernote -->	
<script type="text/javascript"><!--
$('.summernote').summernote({
height: 150,   //set editable area's height
});
//--></script>
<?php } ?>
<?php if ($ckeditor) { ?>
<script type="text/javascript"><!--
        <?php foreach ($languages as $language) { ?>
        <?php if ($ckeditor) { ?>
				ckeditorInit('input-description<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
            <?php } ?>
        <?php } ?>
//--></script>
<script type="text/javascript"><!--
<?php $top_link_row7 = 1; ?>
<?php foreach ($top_links7 as $top_link7) { ?>
<?php foreach ($languages as $language) { ?>
ckeditorInit('description-<?php echo $top_link_row7; ?>-<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
<?php } ?>
<?php $top_link_row7++; ?>
<?php } ?>
//--></script>
<script type="text/javascript"><!--
<?php $top_link_row9 = 1; ?>
<?php foreach ($top_links9 as $top_link9) { ?>
<?php foreach ($languages as $language) { ?>
ckeditorInit('description_info-<?php echo $top_link_row9; ?>-<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
<?php } ?>
<?php $top_link_row9++; ?>
<?php } ?>
//--></script>
<?php } ?>
<script type="text/javascript"><!--
function apply() {
	$('#form-theme-modern').append('<input type="hidden" id="apply" name="apply" value="1" />');
	$('#form-theme-modern').submit();
}
//--></script>
<?php echo $footer; ?>