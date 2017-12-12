<?php
use app\core\App;

class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

	               $this->load->language('extension/module/modern');
				   if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
						$data['logo'] = 'image/' . $this->config->get('config_logo');
					} else {
						$data['logo'] = '';
					}
      

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

	  		        $data['og_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
		            $data['home'] = $this->url->link('common/home');
					$data['text_footer_map'] = $this->language->get('text_footer_map');
					$data['text_footer_social'] = $this->language->get('text_footer_social');
					$data['text_footer_pay'] = $this->language->get('text_footer_pay');
	  		        $data['text_footer_contacts'] = $this->language->get('text_footer_contacts');
			        $data['text_footer_aboutus'] = $this->language->get('text_footer_aboutus');
					$data['text_footer_send'] = $this->language->get('text_footer_send');
					$data['text_footer_mailtext'] = $this->language->get('text_footer_mailtext');
	                $data['language_id'] = $this->config->get('config_language_id');
			        $data['modern_top_links2'] = $this->config->get('modern_top_links2');
					$data['modern_telephoneon_footer'] = $this->config->get('modern_telephoneon_footer');	
					$data['modern_telephone1on_footer'] = $this->config->get('modern_telephone1on_footer');	
					$data['modern_telephone2on_footer'] = $this->config->get('modern_telephone2on_footer');	
					$data['modern_skype_footeron'] = $this->config->get('modern_skype_footeron');	
					$data['modern_mail_footeron'] = $this->config->get('modern_mail_footeron');	
					$data['modern_addres_footeron'] = $this->config->get('modern_addres_footeron');	
					$data['modern_time_footeron'] = $this->config->get('modern_time_footeron');	
					$data['modern_telephone_footer'] = $this->config->get('modern_telephone_footer');
					$data['modern_telephone1_footer'] = $this->config->get('modern_telephone1_footer');
					$data['modern_telephone2_footer'] = $this->config->get('modern_telephone2_footer');
					$data['modern_skype_footer'] = $this->config->get('modern_skype_footer');
					$data['modern_mail_footer'] = $this->config->get('modern_mail_footer');
					$data['modern_addres_footer'] = $this->config->get('modern_addres_footer');
					$data['modern_time_footer'] = $this->config->get('modern_time_footer');
					$data['modern_contact_footer'] = $this->config->get('modern_contact_footer');	
					$data['modern_return_footer'] = $this->config->get('modern_return_footer');	
					$data['modern_sitemap_footer'] = $this->config->get('modern_sitemap_footer');	
					$data['modern_manufacturer_footer'] = $this->config->get('modern_manufacturer_footer');	
					$data['modern_voucher_footer'] = $this->config->get('modern_voucher_footer');	
					$data['modern_affiliate_footer'] = $this->config->get('modern_affiliate_footer');	
					$data['modern_special_footer'] = $this->config->get('modern_special_footer');
					$data['modern_account_footer'] = $this->config->get('modern_account_footer');
					$data['modern_order_footer'] = $this->config->get('modern_order_footer');
					$data['modern_wishlist_footer'] = $this->config->get('modern_wishlist_footer');
					$data['modern_newsletter_footer'] = $this->config->get('modern_newsletter_footer');
					$data['modern_show_fluid_map_footer'] = $this->config->get('modern_show_fluid_map_footer');
					$data['modern_longitude_fluid_map'] = $this->config->get('modern_longitude_fluid_map');					
					$data['modern_latitude_fluid_map'] = $this->config->get('modern_latitude_fluid_map');
					$data['modern_description'] = $this->config->get('modern_description');
					$data['modern_show_contactblock'] = $this->config->get('modern_show_contactblock');
					$data['modern_fluid_map_zoom'] = $this->config->get('modern_fluid_map_zoom');
					$data['modern_license_text'] = $this->config->get('modern_license_text');
					$data['modern_counter'] = $this->config->get('modern_counter');
					$data['modern_description_map_logo'] = $this->config->get('modern_description_map_logo');
					$data['modern_fluid_map_key'] = $this->config->get('modern_fluid_map_key');
					$data['modern_show_info_marker_block'] = $this->config->get('modern_show_info_marker_block');
					$data['modern_show_logo_footer'] = $this->config->get('modern_show_logo_footer');
					$data['modern_show_itext_footer'] = $this->config->get('modern_show_itext_footer');

					if ($this->request->server['HTTPS']) {
						$server = $this->config->get('config_ssl');
					} else {
						$server = $this->config->get('config_url');
					}
					if (is_file(DIR_IMAGE . $this->config->get('modern_footer_imgico'))) {
						$data['map_img'] = $server . 'image/' . $this->config->get('modern_footer_imgico');
					} else {
						$data['map_img'] = '';
					}
					if (is_file(DIR_IMAGE . $this->config->get('modern_footer_pay'))) {
						$data['footer_pay'] = $server . 'image/' . $this->config->get('modern_footer_pay');
					} else {
						$data['footer_pay'] = '';
					}
					
					if (is_file(DIR_IMAGE . $this->config->get('modern_footer_logo'))) {
						$data['footer_logo'] = $server . 'image/' . $this->config->get('modern_footer_logo');
					} else {
						$data['footer_logo'] = '';
					}
					
					$data['name'] = $this->config->get('config_name');
      

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

        $data['content_mail'] =  $this->load->controller('common/content_mail');

        $data['codeJivoSite'] = $this->load->view('art/jivoSite', ['isWork' => \app\core\App::$config->isWorkSite()]);

        $data['counterMailRu'] = '';
        if (App::$config->isWorkSite()) {
            $data['counterMailRu'] = htmlspecialchars_decode(App::$config->counterMailRu);
        }

		return $this->load->view('common/footer', $data);
	}
}
