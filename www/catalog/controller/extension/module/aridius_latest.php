<?php
class ControllerExtensionModuleAridiusLatest extends Controller {
	
	public function index($setting) {
		
		static $module = 0;
		
		$this->load->language('extension/module/aridius_latest');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['button_quickview'] = $this->language->get('button_quickview');
		$data['button_instock'] = $this->language->get('button_instock');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');
		
		$this->document->addStyle('catalog/view/theme/modern/js/jquery/owl-carousel/owl.carousel.css');
		$this->document->addScript('catalog/view/theme/modern/js/jquery/owl-carousel/owl.carousel.min.js');	

		$data['products'] = array();
		
		$data['language_id'] = $this->config->get('config_language_id');
		$data['modern_name_sticker_product_new'] = $this->config->get('modern_name_sticker_product_new');
		$data['modern_name_sticker_product_top'] = $this->config->get('modern_name_sticker_product_top');		
		$data['modern_sticker_sale_product_auto'] = $this->config->get('modern_sticker_sale_product_auto');	
		$data['modern_sticker_new_product_auto'] = $this->config->get('modern_sticker_new_product_auto');
		$data['modern_sticker_product_new_day'] = $this->config->get('modern_sticker_product_new_day');
		$data['modern_sticker_product_top_rating'] = $this->config->get('modern_sticker_product_top_rating');
		$data['modern_sticker_product_top_viewed'] = $this->config->get('modern_sticker_product_top_viewed');
		$data['modern_sticker_product_top_ratinr'] = $this->config->get('modern_sticker_product_top_ratinr');
		$data['modern_sticker_top_product_auto'] = $this->config->get('modern_sticker_top_product_auto');
		$data['modern_limit_symbolst'] = $this->config->get('modern_limit_symbolst');
		$data['aridiusinstock_status'] = $this->config->get('aridiusinstock_status');
		$data['aridius_qckview_status'] = $this->config->get('aridius_qckview_status');
		$data['modern_attribute_see'] = $this->config->get('modern_attribute_see');
		
		$data['items'] = $setting['items'];
		$data['pag_speed'] = $setting['pag_speed'];
		$data['rew_speed'] = $setting['rew_speed'];
		$data['autoplay'] = $setting['autoplay'];
		$data['stophover'] = $setting['stophover'];
		$data['pagination'] = $setting['pagination'];
		$data['navigation'] = $setting['navigation'];
		$data['desc'] = $setting['desc'];
		$data['attribute'] = $setting['attribute'];
		$data['rat'] = $setting['rat'];
		$data['wish'] = $setting['wish'];
		$data['comp'] = $setting['comp'];

		$filter_data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_catalog_product->getProducts($filter_data);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
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
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				$imgadd = $this->model_catalog_product->getProductImages($result['product_id']);
				$img2 = array();
				foreach ($imgadd as $imgi) {
					$img2[] = array(
					'thumb' => $this->model_tool_image->resize($imgi['image'], $setting['width'], $setting['height'])
					);
				}
				
				$data['products'][] = array(
					'dateadded'  => $result['date_added'],
					'viewed'     => $result['viewed'],
					'rating'     => $result['rating'],
					'stickers'   => $result['stickers'],
                    'quantity'   => $result['quantity'],
					'price_sticker'        => $result['price'],
					'special_sticker'      => (isset($result['special']) ? $result['special'] : false),					
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'images' => $img2,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'attribute_groups' => $this->model_catalog_product->getProductAttributes($result['product_id']),
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				);
			}
			
           $data['module'] = $module++;

		   return $this->load->view('extension/module/aridius_latest', $data);
		}
	}
}