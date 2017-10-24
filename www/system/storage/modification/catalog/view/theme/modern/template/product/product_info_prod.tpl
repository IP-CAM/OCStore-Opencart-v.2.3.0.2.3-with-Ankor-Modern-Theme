

    <div class="linetoppr">
        <?php if ($review_status) { ?>
            <div class="rating">
                <p>
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                        <?php if ($rating < $i) { ?>
                            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                        <?php } else { ?>
                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                        <?php } ?>
                    <?php } ?>
                    <a class="review_profile" href="" onclick="$('a[href=\'#review_tab\']').trigger('click'); return false;">&nbsp;&nbsp;<?php echo $reviews; ?></a> <span>/</span> <a class="review_profile" href="" onclick="$('a[href=\'#review_tab\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
                    <?php if ($rating) { ?>
                        <span itemprop="aggregateRating" itemscope itemtype = "http://schema.org/AggregateRating">
		<meta itemprop='ratingValue' content='<?php echo $rating; ?>' />
		<meta itemprop='bestRating' content='5' />
		<meta itemprop='worstRating' content='1' />
		<meta itemprop="reviewCount" content="<?php echo rtrim(preg_replace("/[^0-9\.]/", "", ($reviews)), '.'); ?>" />
		</span>
                    <?php } ?>
                </p>
            </div>
        <?php } ?>
        <ul class="list-unstyled">
            <?php if ($manufacturer) { ?>
                <?php if ($modern_product_man_img !=1) { ?>
                    <li>
                            <?php if( isset($manufacturer_img) ) { ?>
                                <img  class="pull-right brand_img hidden-xs" src="<?php echo $manufacturer_img ; ?>" alt="<?php echo $manufacturer; ?>" title="<?php echo $manufacturer; ?>">
                            <?php } ?>
                        </a></li>
                <?php } ?>
                <li><span><?php echo $text_manufacturer; ?></span>&nbsp;&nbsp;<a itemprop="manufacturer" href="<?php echo $linkBrands; ?>"><?php echo $manufacturer; ?></a></li>
            <?php } ?>
            <!--<li><?php echo $text_stock; ?>&nbsp;&nbsp;<?php echo ($quantity > 0) ? '<span class = "rewardin">'. $stock .'</span>' : '<span class = "rewardoff">'. $stock .'</span>'; ?></li> -->
            <?php if ($modern_product_kod_tovara !=1) { ?>
                <li><span><?php echo $text_model; ?></span>&nbsp;&nbsp;<span itemprop="model"><?php echo $model; ?></span></li>
            <?php } ?>
            <?php if ($reward) { ?>
                <li><span><?php echo $text_reward; ?></span>&nbsp;&nbsp;<?php echo $reward; ?></li>
            <?php } ?>
            <?php if ($length && $width && $height && $modern_product_size !=1 ) { ?>
                <li><?php if ($length > 0) { ?><?php echo $text_lengthp; ?> <?php echo $length; ?> <?php if (($length > 0 && $width > 0)||($length > 0 && $height > 0)) { ?>x<?php } ?> <?php } ?><?php if ($width > 0) { ?><?php echo $text_widthp; ?> <?php echo $width; ?> <?php if ($width > 0 && $height > 0) { ?>x<?php } ?> <?php } ?><?php if ($height > 0) { ?><?php echo $text_heightp; ?> <?php echo $height; ?><?php } ?></li>
            <?php } ?>
            <?php if ($weight > 0 && $modern_product_weight !=1 ) { ?>
                <li><?php echo $text_weightp; ?> <?php echo $weight; ?></li>
            <?php } ?>
            <?php if ($modern_product_show_sku !=1) { ?>
                <li><?php if ($sku) { echo $modern_product_sku[$language_id]; } ?> <?php echo $sku; ?></li>
            <?php } ?>
            <?php if ($modern_product_show_upc !=1) { ?>
                <li><?php if ($upc) { echo $modern_product_upc[$language_id]; } ?> <?php echo $upc; ?></li>
            <?php } ?>
            <?php if ($modern_product_show_ean !=1) { ?>
                <li><?php if ($ean) { echo $modern_product_ean[$language_id]; } ?> <?php echo $ean; ?></li>
            <?php } ?>
            <?php if ($modern_product_show_jan !=1) { ?>
                <li><?php if ($jan) { echo $modern_product_jan[$language_id]; } ?> <?php echo $jan; ?></li>
            <?php } ?>
            <?php if ($aridius_popupsize_status && $popupsize == 1) { ?>
                <li> <i class="fa fa-calendar"></i>&nbsp;<a class="popup-modal" href="#popup-modal"><?php echo $aridius_popupsize_name[$language_id]; ?></a> </li>
            <?php } ?>
        </ul>
    </div>

    <?php if ($price) { ?>
        <span itemprop="offers" itemscope itemtype = "http://schema.org/Offer">
	<meta itemprop="price" content="<?php echo rtrim(preg_replace("/[^0-9\.]/", "", ($special ? $special : $price)), '.'); ?>" />
	<meta itemprop="priceCurrency" content="<?php echo $sh_currency; ?>" />
	</span>
        <div class="line-product">
            <?php if (!$special) { ?>
                <span class="priceproduct-new"><?php echo $price;?>/<?php echo $measure_str; ?></span>
            <?php } else { ?>
                <span class="priceproduct-new"><?php echo $special;?>/<?php echo $measure_str;?></span>&nbsp;&nbsp;<span class="priceproduct-old"><?php echo $price;?>/<?php echo $measure_str;?></span>
            <?php } ?><br />
            <?php if ($aridiusundersell_status) { ?>
                <i class="fa fa-area-chart" aria-hidden="true"></i>&nbsp;<a id="undersell-order"><?php echo $buttonundersell_title; ?></a>
            <?php } ?>
        </div>
        <hr>
        <ul class="list-unstyled">
            <?php if ($tax) { ?>
                <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
            <?php } ?>
            <?php if ($points) { ?>
                <li><?php echo $text_points; ?> <?php echo $points; ?></li>
            <?php } ?>
            <?php if ($discounts) { ?>
                <li>
                    <hr>
                </li>
                <?php foreach ($discounts as $discount) { ?>
                    <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
                <?php } ?>
            <?php } ?>
        </ul>
    <?php } ?>
    <div id="product">
        <?php if ($options) { ?>
            <h3><?php echo $text_option; ?></h3>
            <?php foreach ($options as $option) { ?>
                <?php if ($option['type'] == 'select') { ?>
                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                            <option value=""><?php echo $text_select; ?></option>
                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <option value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"><?php echo $option_value['name']; ?>
                                    <?php if ($option_value['price']) { ?>
                                        (<?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>)
                                    <?php } ?>
                                </option>
                            <?php } ?>
                        </select>
                    </div>
                <?php } ?>
                <?php if ($option['type'] == 'radio') { ?>
                    <div class="options_group form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label"><?php echo $option['name']; ?></label>
                        <div id="input-option<?php echo $option['product_option_id']; ?>">
                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="radio">
                                    <label>
                                        <?php if ($option_value['image']) { ?>
                                            <input style="margin-left:0px;" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" />
                                            <br />
                                            <a href="<?php echo $option_value['popup']; ?>" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="imgpopcat">
                                                <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <br /><?php echo $option_value['name']; ?></a>
                                            <?php if ($option_value['price']) { ?>
                                                <br />
                                                <?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>
                                            <?php } ?>
                                        <?php } else { ?>
                                            <input type="radio" class="options_none"
                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                   data-option-id="<?php echo $option['product_option_id']; ?>"
                                                   data-change-image="<?php echo $option_value['changeImage']; ?>"
                                                   value="<?php echo $option_value['product_option_value_id']; ?>"
                                                   data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>"
                                                   data-prefix="<?php echo $option_value['price_prefix']; ?>"
                                                   data-price="<?php echo $option_value['price_value']; ?>" />
                                            <span class="im_option"><?php echo $option_value['name']; ?></span>
                                            <?php if ($option_value['price']) { ?>
                                                <?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>
                                            <?php } ?><span class = "options-prheight"></span>
                                        <?php } ?>
                                    </label>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                <?php } ?>
                <?php if ($option['type'] == 'checkbox') { ?>
                    <div class="options_group form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label"><?php echo $option['name']; ?></label>
                        <div id="input-option<?php echo $option['product_option_id']; ?>">
                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="checkbox">
                                    <label>
                                        <?php if ($option_value['image']) { ?>
                                            <input style="margin-left:0px;" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" />
                                            <br />
                                            <a href="<?php echo $option_value['popup']; ?>" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="imgpopcat">
                                                <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <br /><?php echo $option_value['name']; ?></a>
                                            <?php if ($option_value['price']) { ?>
                                                <br />
                                                <?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>
                                            <?php } ?>
                                        <?php } else { ?>
                                            <input type="checkbox" class="options_none" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" />
                                            <span class="im_option"><?php echo $option_value['name']; ?></span>
                                            <?php if ($option_value['price']) { ?>
                                                <?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>
                                            <?php } ?><span class = "options-prheight"></span>
                                        <?php } ?>
                                    </label>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                <?php } ?>
                <?php if ($option['type'] == 'text') { ?>
                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                    </div>
                <?php } ?>
                <?php if ($option['type'] == 'textarea') { ?>
                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
                    </div>
                <?php } ?>
                <?php if ($option['type'] == 'file') { ?>
                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label"><?php echo $option['name']; ?></label>
                        <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                        <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
                    </div>
                <?php } ?>
                <?php if ($option['type'] == 'date') { ?>
                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <div class="input-group date">
                            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                            <span class="input-group-btn">
			<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
			</span></div>
                    </div>
                <?php } ?>
                <?php if ($option['type'] == 'datetime') { ?>
                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <div class="input-group datetime">
                            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                            <span class="input-group-btn">
			<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
			</span></div>
                    </div>
                <?php } ?>
                <?php if ($option['type'] == 'time') { ?>
                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <div class="input-group time">
                            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                            <span class="input-group-btn">
			<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
			</span></div>
                    </div>
                <?php } ?>
            <?php } ?>
        <?php } ?>
        <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring; ?></h3>
            <div class="form-group required">
                <select name="recurring_id" class="form-control">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php foreach ($recurrings as $recurring) { ?>
                        <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                    <?php } ?>
                </select>
                <div class="help-block" id="recurring-description"></div>
            </div>
        <?php } ?>
        <div class="form-group plus_minus">
            <div class="wrap-btn-product">
            <div class="plus_minus_pull">
            <div class="pull-left">
                <input type="text" name="quantity" value="<?php echo $minimum; ?>" data-toggle="tooltip" title="<?php echo $entry_qty; ?>" size="2" id="input-quantity" class="form-control" />
                <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
            </div>
            <div class="custom pull-left">
                <button type="button" id="plus" class="items-count" ><i class="fa fa-angle-up">&nbsp;</i></button>
                <button type="button" id="minus" class="items-count"><i class="fa fa-angle-down">&nbsp;</i></button>
            </div>
            <?php if ($modern_wishlist_cat !=1) { ?>
                <button type="button" data-toggle="tooltip" class="btn-wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
            <?php } ?>
            <?php if ($modern_compare_cat !=1) { ?>
                <button type="button" data-toggle="tooltip" class="btn-compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
            <?php } ?>
            </div>
            <div class="plus_minus_pull">
                <div class="cart pull-left" >
                    <?php if ($quantity <= 0 && $aridiusinstock_status ) { ?>
                        <button type="button" class="btn-instock" onclick="instock.add('<?php echo $product_id; ?>');" data-product-id="<?php echo $product_id; ?>"><?php echo $button_instock; ?></button>
                    <?php } else { ?>
                    <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn-cart"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
                </div>
            </div>
            <div class="plus_minus_pull">
            <div class="cart pull-left">
                <?php if ($aridiusfastorder_status) { ?>
                    <button type="button" id="fast-order" data-loading-text="<?php echo $text_loading; ?>" class="btn-cart"><i class="fa fa-clock-o"></i> <?php echo $button_title; ?></button>
                <?php } ?>
                <?php } ?>
            </div>
            </div>
            </div>
        </div>
       <!-- <div class="clearfix"></div>
        <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
        <?php } ?> -->
    </div>
    <?php if ($modern_product_show_share !=1) { ?>
        <div class="rating">
            <p>
                <?php if (empty($modern_share)) { ?>
                <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
            <!-- AddThis Button END -->
            <?php } else { ?>
                <?php echo htmlspecialchars_decode($modern_share);?>
            <?php } ?>
        </div>
    <?php } ?>
    <br />
