<?php
use app\core\App;

class ControllerProductProduct extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('product/product');

							$this->load->language('extension/module/modern');
			  

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$this->load->model('catalog/category');
        $data['type_utp'] = '';
        $data['type_products'] = 0;
        $data['file_utp'] = '';

		if (isset($this->request->get['path'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path)
					);
				}
			}

			// Set the last category breadcrumb
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
				$url = '';
                $data['type_utp'] =  $category_info['type_utp'];
                $data['type_products'] =  $category_info['type_products'];
                if (!empty($data['type_utp'])) {
                    $file = DIR_ADD_TPL . $data['type_utp'] . '.tpl';
                    if (file_exists($file)) {
                        $data['file_utp'] = $file;
                    }
                } else {
                    $file = DIR_ADD_TPL . '/utp/product.tpl';
                    if (file_exists($file)) {
                        $data['file_utp'] = $file;
                    }
                }

				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}

				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}

				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}

				$data['breadcrumbs'][] = array(
					'text' => $category_info['name'],
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
				);
			}
		}

		$this->load->model('catalog/manufacturer');

		if (isset($this->request->get['manufacturer_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_brand'),
				'href' => $this->url->link('product/manufacturer')
			);

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {
				$data['breadcrumbs'][] = array(
					'text' => $manufacturer_info['name'],
					'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
				);
			}
		}

		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_search'),
				'href' => $this->url->link('product/search', $url)
			);
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);
        
		if ($product_info) {
            
            $data['aridiusinstock'] = $this->load->controller('module/aridiusinstock');
			

            $data['aridiusfastorder'] = $this->load->controller('module/aridiusfastorder');
			

            $data['aridiusundersell'] = $this->load->controller('module/aridiusundersell');
			
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $product_info['name'],
				'href' => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id'])
			);

			if ($product_info['meta_title']) {
				$this->document->setTitle($product_info['meta_title']);
			} else {
				$this->document->setTitle($product_info['name']);
			}

			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/locale/'.$this->session->data['language'].'.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

			if ($product_info['meta_h1']) {
				$data['heading_title'] = $product_info['meta_h1'];
			} else {
				$data['heading_title'] = $product_info['name'];
			}

			$data['text_select'] = $this->language->get('text_select');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
            $data['text_measure_str'] = $this->language->get('text_measure_str');

			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$data['text_write'] = $this->language->get('text_write');
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['entry_qty'] = $this->language->get('entry_qty');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');

			$data['button_cart'] = $this->language->get('button_cart');

			$this->language->load('extension/module/aridiusinstock');
           $data['buttoninstock_title'] = $this->language->get('buttoninstock_title');
		   $data['aridiusinstock_status'] = $this->config->get('aridiusinstock_status');
			

		   $this->language->load('extension/module/aridiusfastorder');
           $data['button_title'] = $this->language->get('button_title');
		   $data['aridiusfastorder_status'] = $this->config->get('aridiusfastorder_status');
			

		   $this->language->load('extension/module/aridiusundersell');
           $data['buttonundersell_title'] = $this->language->get('buttonundersell_title');
		   $data['aridiusundersell_status'] = $this->config->get('aridiusundersell_status');
			
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');

			$this->load->model('catalog/review');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_attribute'] = $this->language->get('tab_attribute');
			$data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

			$data['product_id'] = (int)$this->request->get['product_id'];
			$data['manufacturer'] = $product_info['manufacturer'];
			$data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$data['model'] = $product_info['model'];

			$data['popupsize'] = $product_info['popupsize'];
			
			$data['reward'] = $product_info['reward'];
			$data['points'] = $product_info['points'];

            $data['measure_str'] = $product_info['measure_str'];

                    $data['length'] = number_format($product_info['length'], 0 ,"","").' '.$this->length->getUnit($product_info['length_class_id']);
                    $data['width']  = number_format($product_info['width'], 0 ,"","").' '.$this->length->getUnit($product_info['length_class_id']);
                    $data['height'] = number_format($product_info['height'], 0 ,"","").' '.$this->length->getUnit($product_info['length_class_id']);
                    $data['weight'] = number_format($product_info['weight'], 0 ,"","").' '.$this->weight->getUnit($product_info['weight_class_id']);
                    $data['upc']  = $product_info['upc'];
			        $data['sku']  = $product_info['sku'];
					$data['ean']  = $product_info['ean'];
					$data['jan']  = $product_info['jan'];
					$data['isbn'] = $product_info['isbn'];
					$data['mpn']  = $product_info['mpn'];
      
			$data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');

			if ($product_info['quantity'] <= 0) {
				$data['stock'] = $product_info['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$data['stock'] = $product_info['quantity'];
			} else {
				$data['stock'] = $this->language->get('text_instock');
			}

			$this->load->model('tool/image');

			$data['language_id'] = $this->config->get('config_language_id');
			$data['aridius_popupsize_top_links'] = $this->config->get('aridius_popupsize_top_links');
			$data['aridius_popupsize_status'] = $this->config->get('aridius_popupsize_status');
			$data['aridius_popupsize_name'] = $this->config->get('aridius_popupsize_name');
			

					$data['language_id'] = $this->config->get('config_language_id');
					$data['text_end_stock'] = $this->language->get('text_end_stock');
					$data['text_lengthp'] = $this->language->get('text_lengthp');
					$data['text_widthp'] = $this->language->get('text_widthp');
					$data['text_heightp'] = $this->language->get('text_heightp');
					$data['text_weightp'] = $this->language->get('text_weightp');
					$data['text_dignity'] = $this->language->get('text_dignity');
					$data['text_limitations'] = $this->language->get('text_limitations');
					$data['button_quickview'] = $this->language->get('button_quickview');
					$data['button_instock'] = $this->language->get('button_instock');	
					$data['day'] = $this->language->get('day');
					$data['hour'] = $this->language->get('hour');
					$data['minute'] = $this->language->get('minute');
					$data['second'] = $this->language->get('second');
					$data['end_special'] = $this->language->get('end_special');			   
					$data['modern_elevatezoom'] = $this->config->get('modern_elevatezoom');
					$manufacturer_dta = $this->model_catalog_manufacturer->getManufacturer($product_info['manufacturer_id']);
                       if(isset($manufacturer_dta['image']) && file_exists(DIR_IMAGE.$manufacturer_dta['image']))
                    {
                       $manufacturer_img = $this->model_tool_image->resize($manufacturer_dta['image'], $this->config->get('modern_product_man_width'), $this->config->get('modern_product_man_height'));
                       $data['manufacturer_img'] = $manufacturer_img;
                    }
	                $data['modern_product_man_img'] = $this->config->get('modern_product_man_img');
					$data['modern_product_timer'] = $this->config->get('modern_product_timer');
					$data['modern_product_show_share'] = $this->config->get('modern_product_show_share');
					$data['modern_product_show_sku']  = $this->config->get('modern_product_show_sku');
					$data['modern_product_show_upc']  = $this->config->get('modern_product_show_upc');
					$data['modern_product_show_ean']  = $this->config->get('modern_product_show_ean');
					$data['modern_product_show_jan']  = $this->config->get('modern_product_show_jan');
					$data['modern_product_show_isbn'] = $this->config->get('modern_product_show_isbn');
					$data['modern_product_show_mpn']  = $this->config->get('modern_product_show_mpn');
					$data['modern_product_sku']  = $this->config->get('modern_product_sku');
					$data['modern_product_upc']  = $this->config->get('modern_product_upc');
					$data['modern_product_ean']  = $this->config->get('modern_product_ean');
					$data['modern_product_jan']  = $this->config->get('modern_product_jan');
					$data['modern_product_isbn'] = $this->config->get('modern_product_isbn');
					$data['modern_product_mpn']  = $this->config->get('modern_product_mpn');
					$data['modern_attribute_see']  = $this->config->get('modern_attribute_see');
					$data['modern_top_links7'] = $this->config->get('modern_top_links7');
					
					$top_links9 = $this->config->get('modern_top_links9');
					$data['modern_top_links9'] = array();
					
			        if(isset($top_links9) && is_array($top_links9)) foreach ($top_links9 as $top_link9) {
					if ($top_link9['image'] && is_file(DIR_IMAGE . $top_link9['image'])) {
						$modern_block_prod = $this->model_tool_image->resize($top_link9['image'], 100, 100);
					} else {
						$modern_block_prod = $this->model_tool_image->resize('no_image.png', 100, 100);
					}
					
					$data['modern_top_links9'][] = array(
						'description' => $top_link9['description'],
						'image_href'  => $modern_block_prod
									
					  );
				    }
					
					$data['modern_name_sticker_product_new'] = $this->config->get('modern_name_sticker_product_new');
					$data['modern_name_sticker_product_top'] = $this->config->get('modern_name_sticker_product_top');		
					$data['modern_sticker_sale_product_auto'] = $this->config->get('modern_sticker_sale_product_auto');	
					$data['modern_sticker_new_product_auto'] = $this->config->get('modern_sticker_new_product_auto');
					$data['modern_sticker_product_new_day'] = $this->config->get('modern_sticker_product_new_day');
					$data['modern_sticker_product_top_rating'] = $this->config->get('modern_sticker_product_top_rating');
					$data['modern_sticker_product_top_viewed'] = $this->config->get('modern_sticker_product_top_viewed');
					$data['modern_sticker_product_top_ratinr'] = $this->config->get('modern_sticker_product_top_ratinr');
					$data['modern_sticker_top_product_auto'] = $this->config->get('modern_sticker_top_product_auto');
					$data['modern_description_cat'] = $this->config->get('modern_description_cat');
					$data['modern_atribute'] = $this->config->get('modern_atribute');
					$data['modern_atribute'] = $this->config->get('modern_atribute');
					$data['modern_limit_symbolst'] = $this->config->get('modern_limit_symbolst');
					$data['modern_rating_cat'] = $this->config->get('modern_rating_cat');
					$data['modern_wishlist_cat'] = $this->config->get('modern_wishlist_cat');
	                $data['modern_compare_cat'] = $this->config->get('modern_compare_cat');
					$data['aridius_qckview_status'] = $this->config->get('aridius_qckview_status');
					$data['modern_share'] = $this->config->get('modern_share');
					$data['modern_product_raiting'] = $this->config->get('modern_product_raiting');
					$data['modern_product_size'] = $this->config->get('modern_product_size');
					$data['modern_product_weight'] = $this->config->get('modern_product_weight');
					$data['modern_product_kod_tovara'] = $this->config->get('modern_product_kod_tovara');
					$data['aridiusinstock_status'] = $this->config->get('aridiusinstock_status');
					$data['modern_product_info_block'] = $this->config->get('modern_product_info_block');
					$data['modern_product_show_infoblock'] = $this->config->get('modern_product_show_infoblock');
					
      

			if ($product_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));
			} else {
				$data['popup'] = '';
			}

			if ($product_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
				$this->document->setOgImage($data['thumb']);
			} else {
				$data['thumb'] = '';
			}

			$data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

			foreach ($results as $result) {
				$data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),

                    'thumb2' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height')),
      
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
				);
			}

			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['price'] = false;
			}


                    $data['sh_currency'] = $this->session->data['currency'];
      
			if ((float)$product_info['special']) {
				$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

                    $data['saving_product'] = round((($product_info['price'] - $product_info['special']) / $product_info['price']) * 100, 0);
					$this->load->model('catalog/product');	
					$special_info = $this->model_catalog_product->getSpecialDates($product_id);
					if ($special_info) {
						$data['special_date_end'] = $special_info['date_end'];
						$data['special_date_start'] = $special_info['date_start'];
					} else {
						$date['special_date_end'] = false;
						$date['special_date_start'] = false;
					}
      
			} else {
				$data['special'] = false;
			}

			if ($this->config->get('config_tax')) {
				$data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
			} else {
				$data['tax'] = false;
			}

			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

			$data['discounts'] = array();

			foreach ($discounts as $discount) {
				$data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
				);
			}


			$data['custom_tabs'] = array();

			$results = $this->model_catalog_product->getProductCustomtabs($this->request->get['product_id']);
			foreach ($results as $result) {
			   $data['custom_tabs'][] = array(
			        'title' => $result['title'],
			        'description' => html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'),
			   );
			}	
			

          $data['raw_price'] = $data['price'];
          $data['raw_special'] = $data['special'];
          if ($data['price']) {
              $data['price'] = '<span class=\'autocalc-product-price\'>' . $data['price'] . '</span>';
          }
          if ($data['special']) {
              $data['special'] = '<span class=\'autocalc-product-special\'>' . $data['special'] . '</span>';
          }
          if ($data['points']) {
              $data['points'] = '<span class=\'autocalc-product-points\'>' . $data['points'] . '</span>';
          }
          $data['price_value'] = $product_info['price'];
          $data['special_value'] = $product_info['special'];
          $data['tax_value'] = (float)$product_info['special'] ? $product_info['special'] : $product_info['price'];
          $data['points_value'] = $product_info['points'];
          $var_currency = array();
          $currency_code = !empty($this->session->data['currency']) ? $this->session->data['currency'] : $this->config->get('config_currency');
          $var_currency['value'] = $this->currency->getValue($currency_code);
          $var_currency['symbol_left'] = $this->currency->getSymbolLeft($currency_code);
          $var_currency['symbol_right'] = $this->currency->getSymbolRight($currency_code);
          $var_currency['decimals'] = $this->currency->getDecimalPlace($currency_code);
          $var_currency['decimal_point'] = $this->language->get('decimal_point');
          $var_currency['thousand_point'] = $this->language->get('thousand_point');
          $data['autocalc_currency'] = $var_currency;
          $currency2_code = $this->config->get('config_currency2');
          if ($this->currency->has($currency2_code) && $currency2_code != $currency_code) {
              $var_currency = array();
              $currency_code = $currency2_code;
              $var_currency['value'] = $this->currency->getValue($currency_code);
              $var_currency['symbol_left'] = $this->currency->getSymbolLeft($currency_code);
              $var_currency['symbol_right'] = $this->currency->getSymbolRight($currency_code);
              $var_currency['decimals'] = $this->currency->getDecimalPlace($currency_code);
              $var_currency['decimal_point'] = $this->language->get('decimal_point');
              $var_currency['thousand_point'] = $this->language->get('thousand_point');
              $data['autocalc_currency2'] = $var_currency;
          }
          $data['dicounts_unf'] = $discounts;
          $data['tax_class_id'] = $product_info['tax_class_id'];
          $data['tax_rates'] = $this->tax->getRates(0, $product_info['tax_class_id']);
          $data['autocalc_option_special'] = $this->config->get('config_autocalc_option_special');
          $data['autocalc_not_mul_qty'] = $this->config->get('config_autocalc_not_mul_qty');
      
			$data['options'] = array();

			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
						} else {
							$price = false;
						}

						$product_option_value_data[] = array(

          'price_value'                   => $option_value['price'],
          'points_value'                  => intval($option_value['points_prefix'].$option_value['points']),
      
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
							
                     'image'                  => $option_value['image'] ? $this->model_tool_image->resize($option_value['image'], $this->config->get('modern_product_optionimg_width'), $this->config->get('modern_product_optionimg_height')) : '',
      

                     'popup'                   => $this->model_tool_image->resize($option_value['image'], 550, 550),
      
							'price'                   => $price,
							'price_prefix'            => $option_value['price_prefix']
						);
					}
				}

				$data['options'][] = array(
					'product_option_id'    => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'value'                => $option['value'],
					'required'             => $option['required']
				);
			}

			if ($product_info['minimum']) {
				$data['minimum'] = $product_info['minimum'];
			} else {
				$data['minimum'] = 1;
			}

			$data['review_status'] = false;

			if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
				$data['review_guest'] = true;
			} else {
				$data['review_guest'] = false;
			}

			if ($this->customer->isLogged()) {
				$data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			} else {
				$data['customer_name'] = '';
			}

			$data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
			$data['rating'] = (int)$product_info['rating'];

                    $data['viewed'] = (int)$product_info['viewed'];
			        $data['dateadded'] = $product_info['date_added'];
					$data['stickers'] = $product_info['stickers'];
					$data['quantity'] = $product_info['quantity'];
      

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
			} else {
				$data['captcha'] = '';
			}

			$data['share'] = $this->url->link('product/product', 'product_id=' . (int)$this->request->get['product_id']);

			$data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

			$data['products'] = array();

			$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}


					$imgadd = $this->model_catalog_product->getProductImages($result['product_id']);
					$img2 = array();
					foreach ($imgadd as $imgi) {
						$img2[] = array(
						'thumb' => $this->model_tool_image->resize($imgi['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'))
						);
					}					
      
				$data['products'][] = array(

					'dateadded'       => $result['date_added'],
					'viewed'          => $result['viewed'],
					'rating'          => $result['rating'],
					'stickers'        => $result['stickers'],	
					'quantity'        => $result['quantity'],	
					'price_sticker'        => $result['price'],
					'special_sticker'      => (isset($result['special']) ? $result['special'] : false),
					'attribute_groups' => $this->model_catalog_product->getProductAttributes($result['product_id']),
					'images' => $img2,					
      
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			$data['tags'] = array();

			if ($product_info['tag']) {
				$tags = explode(',', $product_info['tag']);

				foreach ($tags as $tag) {
					$data['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('product/search', 'tag=' . trim($tag))
					);
				}
			}

			$data['recurrings'] = $this->model_catalog_product->getProfiles($this->request->get['product_id']);

            if ($data['type_products'] == 1) {
                $data['review_status'] = false;
                $data['products'] = false;
                $data['modern_top_links7'] = false;
            }

			$this->model_catalog_product->updateViewed($this->request->get['product_id']);

            $data = $this->getDataTypesFromConfig($data, $product_info);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');



					if(isset($this->request->post['aridius_quickview'])) {
						$data['aridius_qckview_tabs'] = $this->config->get('aridius_qckview_tabs');
						$data['aridius_qckview_tab_description'] = $this->config->get('aridius_qckview_tab_description');
						$data['aridius_qckview_tab_character'] = $this->config->get('aridius_qckview_tab_character');
						$data['aridius_qckview_tab_reviews'] = $this->config->get('aridius_qckview_tab_reviews');
						$data['aridius_qckview_tab_additional'] = $this->config->get('aridius_qckview_tab_additional');
						$data['aridius_qckview_image'] = $this->config->get('aridius_qckview_image');
						$data['aridius_qckview_additional_image'] = $this->config->get('aridius_qckview_additional_image');
						$data['aridius_qckview_button_wish'] = $this->config->get('aridius_qckview_button_wish');
						$data['aridius_qckview_button_compare'] = $this->config->get('aridius_qckview_button_compare');
						$data['aridius_qckview_rating'] = $this->config->get('aridius_qckview_rating');
						$data['aridius_qckview_short_info'] = $this->config->get('aridius_qckview_short_info');
						$data['aridius_qckview_icons_likes'] = $this->config->get('aridius_qckview_icons_likes');
						$data['aridius_qckview_manufacturer'] = $this->config->get('aridius_qckview_manufacturer');
						$data['aridius_qckview_stock'] = $this->config->get('aridius_qckview_stock');
						$data['aridius_qckview_code_product'] = $this->config->get('aridius_qckview_code_product');
						$data['modern_show_attribute']  = $this->config->get('modern_show_attribute');
						$data['modern_attribute_see']  = $this->config->get('modern_attribute_see');
						$data['modern_pr_attribute_name']  = $this->config->get('modern_pr_attribute_name');
						$data['modern_pr_attribute_seeall']  = $this->config->get('modern_pr_attribute_seeall');
						$data['tab_description'] = $this->language->get('tab_description');
						$data['tab_products'] = $this->language->get('tab_products');
						$data['tab_attribute'] = $this->language->get('tab_attribute');
						$data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);
						$data['text_dignity'] = $this->language->get('text_dignity');
						$data['text_limitations'] = $this->language->get('text_limitations');
					}
			
					if(isset($this->request->post['aridius_quickview'])) {
						$data['ard_quckview'] = $this->load->view('product/aridius_quickview', $data);
					} else {
						$data['ard_quckview'] = '';
					}
					

			$this->response->setOutput($this->load->view('product/product', $data));
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/product', $url . '&product_id=' . $product_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

	public function review() {
		$this->load->language('product/product');

							$this->load->language('extension/module/modern');
			  

		$this->load->model('catalog/review');

		$data['text_no_reviews'] = $this->language->get('text_no_reviews');

					$data['text_dignity'] = $this->language->get('text_dignity');
			        $data['text_limitations'] = $this->language->get('text_limitations');
      

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['reviews'] = array();

		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);

		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 5, 5);

		foreach ($results as $result) {
			$data['reviews'][] = array(
				'author'     => $result['author'],
				'text'       => nl2br($result['text']),
				'rating'     => (int)$result['rating'],

					'dignity'       => nl2br($result['dignity']),
					'limitations'   => nl2br($result['limitations']),
      
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));

		$this->response->setOutput($this->load->view('product/review', $data));
	}

	public function write() {
		$this->load->language('product/product');

							$this->load->language('extension/module/modern');
			  

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
				$json['error'] = $this->language->get('error_rating');
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}

			if (!isset($json['error'])) {
				$this->load->model('catalog/review');

				$this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function getRecurringDescription() {
		$this->load->language('product/product');

							$this->load->language('extension/module/modern');
			  
		$this->load->model('catalog/product');

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		if (isset($this->request->post['recurring_id'])) {
			$recurring_id = $this->request->post['recurring_id'];
		} else {
			$recurring_id = 0;
		}

		if (isset($this->request->post['quantity'])) {
			$quantity = $this->request->post['quantity'];
		} else {
			$quantity = 1;
		}

		$product_info = $this->model_catalog_product->getProduct($product_id);
		$recurring_info = $this->model_catalog_product->getProfile($product_id, $recurring_id);

		$json = array();

		if ($product_info && $recurring_info) {
			if (!$json) {
				$frequencies = array(
					'day'        => $this->language->get('text_day'),
					'week'       => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month'      => $this->language->get('text_month'),
					'year'       => $this->language->get('text_year'),
				);

				if ($recurring_info['trial_status'] == 1) {
					$price = $this->currency->format($this->tax->calculate($recurring_info['trial_price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$trial_text = sprintf($this->language->get('text_trial_description'), $price, $recurring_info['trial_cycle'], $frequencies[$recurring_info['trial_frequency']], $recurring_info['trial_duration']) . ' ';
				} else {
					$trial_text = '';
				}

				$price = $this->currency->format($this->tax->calculate($recurring_info['price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

				if ($recurring_info['duration']) {
					$text = $trial_text . sprintf($this->language->get('text_payment_description'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				} else {
					$text = $trial_text . sprintf($this->language->get('text_payment_cancel'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				}

				$json['success'] = $text;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

    protected function getDataTypesFromConfig($data,$productInfo){
        if (!App::$config->idProductServiceOnMainMenu == $productInfo['product_id']) {
            return $data;
        }
        $data['type_products'] =  1;
        $data['type_utp'] =  App::$config->idProductServiceOnMainMenuTypeUtp;
        if (!empty($data['type_utp'])) {
            $file = DIR_ADD_TPL . $data['type_utp'] . '.tpl';
            if (file_exists($file)) {
                $data['file_utp'] = $file;
            }
        } else {
            $file = DIR_ADD_TPL . '/utp/product.tpl';
            if (file_exists($file)) {
                $data['file_utp'] = $file;
            }
        }
        return $data;
	}

}
