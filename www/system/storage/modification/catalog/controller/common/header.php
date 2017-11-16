<?php
use app\core\App;

class ControllerCommonHeader extends Controller {
    protected $data;
	public function index() {

        $this->document->addStyle('catalog/view/theme/modern/stylesheet/aridiuscallback.css');
        // Analytics
		$this->load->model('extension/extension');
        $this->data = &$data;
        $data['aridiusfastorder'] = $this->load->controller('module/aridiuscallback');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

                    $this->load->language('extension/module/modern');
					
      
		$data['og_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
		$data['og_image'] = $this->document->getOgImage();

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_page'] = $this->language->get('text_page');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');

           $data['button_title'] = $this->language->get('button_title');
		   $data['aridiuscallback_status'] = $this->config->get('aridiuscallback_status');
			
		$data['telephone'] = $this->config->get('config_telephone');

	  		   $data['compare'] = $this->url->link('product/compare');
			   $data['searchlink'] = $this->url->link('product/search');
	             	$data['text_information'] = $this->language->get('text_information');
	            	$data['text_contact'] = $this->language->get('text_contact');
					$data['text_manufacturer'] = $this->language->get('text_manufacturer');
					$data['text_continue'] = $this->language->get('text_continue');					
					$data['text_continue2'] = $this->language->get('text_continue2');					
					$data['text_wishlist2'] = $this->language->get('text_wishlist2');
					$data['text_compare2'] = $this->language->get('text_compare2');
			        $data['href_manufacturer'] = $this->url->link('product/manufacturer');
					$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));	
                    $data['button_compare'] = $this->language->get('button_compare');
					$data['text_homel'] = $this->language->get('text_homel');
      

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

					$this->load->model('tool/image');
      

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {

					if ($category['image']) {
					$image_main = $this->model_tool_image->resize($category['image'],$this->config->get('modern_photos_width_image_main'), $this->config->get('modern_photos_height_image_main'));
					} else {		
					$image_main = '';
					};
      
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {

					$children_lv3_data = array();
					$children_lv3 = $this->model_catalog_category->getCategories($child['category_id']);
					foreach ($children_lv3 as $child_lv3) {
					$filter_data_lv3 = array(
					'filter_category_id'  => $child_lv3['category_id'],
					'filter_sub_category' => true
					);		
					$children_lv3_data[] = array(
					'name'  => $child_lv3['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data_lv3) . ')' : ''),
					'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child_lv3['category_id'])
					);
						}	
					if ($child['image']) {
					$img_lv2 = $this->model_tool_image->resize($child['image'],$this->config->get('modern_photos_menu_width'), $this->config->get('modern_photos_menu_height'));
					} else {		
					$img_lv2 = '';
					};
      
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),

					'children_lv3' => $children_lv3_data,
		            'column'   => $child['column'] ? $child['column'] : 1,
		            'image2' => $img_lv2,
      
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1

					if (isset($this->request->get['path'])) {
						$parts = explode('_', (string)$this->request->get['path']);
					} else {
						$parts = array();
					}
					if (isset($parts[0])) {
						$data['category_id'] = $parts[0];
					} else {
						$data['category_id'] = 0;
					}
      
				$data['categories'][] = array(

					'top'     => $category['top'],
					'category_id' => $category['category_id'],

			       'image_main' => $image_main,
      
      
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}


					$this->load->model('catalog/information');
					$this->load->language('common/footer');
					$this->load->model('catalog/manufacturer');
					$data['informations'] = array();
					foreach ($this->model_catalog_information->getInformations() as $result) {
						if ($result['bottom']) {
							$data['informations'][] = array(
								'title' => $result['title'],
								'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
							);
						}
					}
			        $data['manufacturers'] = array();
			        $manufacturers = $this->model_catalog_manufacturer->getManufacturers();
			     	foreach($manufacturers as $manufacturer){
					if ($manufacturer['image']) {
		             $img_manufacturer = $this->model_tool_image->resize($manufacturer['image'],$this->config->get('modern_photos_menuman_width'), $this->config->get('modern_photos_menuman_height'));
		            	} else {		
		            $img_manufacturer = $this->model_tool_image->resize('placeholder.png', 90, 90);
		                };	
					if($manufacturer){
				      $data['manufacturers'][] = array(
						'name' => $manufacturer['name'],
						'manufacturer_image' => $img_manufacturer,
						'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id='.$manufacturer['manufacturer_id'])
					);
				       }
				          }
      
		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		       $data['language_id'] = $this->config->get('config_language_id');
		            $data['modern_account_top'] = $this->config->get('modern_account_top');
					$data['modern_top_links3'] = $this->config->get('modern_top_links3');
					$data['modern_top_links4'] = $this->config->get('modern_top_links4');
					$data['modern_top_links5'] = $this->config->get('modern_top_links5');
					$data['modern_top_links6'] = $this->config->get('modern_top_links6');
					$data['modern_top_links8'] = $this->config->get('modern_top_links8');
					$data['modern_tittle_name'] = $this->config->get('modern_tittle_name');
					$data['modern_telephone_top'] = $this->config->get('modern_telephone_top');
					$data['modern_wishlist_top'] = $this->config->get('modern_wishlist_top');
					$data['modern_compare_top'] = $this->config->get('modern_compare_top');
					$data['modern_cart_top'] = $this->config->get('modern_cart_top');
					$data['modern_checkout_top'] = $this->config->get('modern_checkout_top');
					$data['modern_calltop'] = $this->config->get('modern_calltop');
					$data['modern_order_top'] = $this->config->get('modern_order_top');
					$data['modern_transaction_top'] = $this->config->get('modern_transaction_top');
					$data['modern_download_top'] = $this->config->get('modern_download_top');
					$data['modern_telephone_mainheader'] = $this->config->get('modern_telephone_mainheader');
					$data['modern_telephone_mainheader2'] = $this->config->get('modern_telephone_mainheader2');
					$data['modern_mail_header'] = $this->config->get('modern_mail_header');
				    $data['modern_sticky_menu'] = $this->config->get('modern_sticky_menu');
					$data['modern_photos_menu'] = $this->config->get('modern_photos_menu');
					$data['modern_photos_menu_manuf'] = $this->config->get('modern_photos_menu_manuf');
					$data['modern_3lv_menu'] = $this->config->get('modern_3lv_menu');
					$data['modern_info_menu'] = $this->config->get('modern_info_menu');
					$data['modern_man_menu'] = $this->config->get('modern_man_menu');
					$data['modern_main_link_menu'] = $this->config->get('modern_main_link_menu');
					$data['modern_main_link_href_menu'] = $this->config->get('modern_main_link_href_menu');
					$data['modern_arrowup'] = $this->config->get('modern_arrowup');
					$data['modern_header_var'] = $this->config->get('modern_header_var');
					$data['modern_callleft'] = $this->config->get('modern_callleft');
			        $data['modern_menuman_column'] = $this->config->get('modern_menuman_column');
					$data['modern_css'] = $this->config->get('modern_css');
					$data['modern_main_photos_menu'] = $this->config->get('modern_main_photos_menu');
					$data['modern_ico_home'] = $this->config->get('modern_ico_home');
					$data['modern_vmenu_menu'] = $this->config->get('modern_vmenu_menu');
					$data['modern_seeall_menu'] = $this->config->get('modern_seeall_menu');
					$data['modern_countvmenulv'] = $this->config->get('modern_countvmenulv');
					$data['modern_seevmenuico'] = $this->config->get('modern_seevmenuico');
					$data['modern_seevmenu_menu'] = $this->config->get('modern_seevmenu_menu');
					$data['modern_link_menucatalog'] = $this->config->get('modern_link_menucatalog');
					$data['modern_ico_home_text'] = $this->config->get('modern_ico_home_text');
					$data['modern_main_background_color'] = $this->config->get('modern_main_background_color');
					$data['modern_main_color_text'] = $this->config->get('modern_main_color_text');					
				    $data['modern_main_color_text2'] = $this->config->get('modern_main_color_text2');				
					$data['modern_main_color_text3'] = $this->config->get('modern_main_color_text3');
					$data['modern_background_btn'] = $this->config->get('modern_background_btn');					
					$data['modern_text_color_btn'] = $this->config->get('modern_text_color_btn');
					$data['modern_text_color_border_btn'] = $this->config->get('modern_text_color_border_btn');
					$data['modern_background_btn_hover'] = $this->config->get('modern_background_btn_hover');
                    $data['modern_text_color_btn_hover'] = $this->config->get('modern_text_color_btn_hover');
                    $data['modern_text_color_border_btn_hover'] = $this->config->get('modern_text_color_border_btn_hover');
                    $data['modern_color_callback'] = $this->config->get('modern_color_callback');
					$data['modern_color_tittle_news'] = $this->config->get('modern_color_tittle_news');
					$data['modern_color_text_news'] = $this->config->get('modern_color_text_news');
					
					if ($this->request->server['HTTPS']) {
						$server = $this->config->get('config_ssl');
					} else {
						$server = $this->config->get('config_url');
					}

					if (is_file(DIR_IMAGE . $this->config->get('aridius_news_footer_back'))) {
						$data['footer_back'] = $server . 'image/' . $this->config->get('aridius_news_footer_back');
					} else {
						$data['footer_back'] = '';
					}
					
					if (is_file(DIR_IMAGE . $this->config->get('aridius_news2_footer_back'))) {
						$data['footer_back2'] = $server . 'image/' . $this->config->get('aridius_news2_footer_back');
					} else {
						$data['footer_back2'] = '';
					}
					
					if (is_file(DIR_IMAGE . $this->config->get('aridius_letters_footer_back'))) {
						$data['letters_back'] = $server . 'image/' . $this->config->get('aridius_letters_footer_back');
					} else {
						$data['letters_back'] = '';
					}

					if (is_file(DIR_IMAGE . $this->config->get('modern_footer_logo'))) {
						$data['footer_logo'] = $server . 'image/' . $this->config->get('modern_footer_logo');
					} else {
						$data['footer_logo'] = '';
					}
				
      

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

        $data = $this->addServiceToMenu($data);
        $data['categoryMenu'] = $this->load->view('common/menu/main_category',$data);

        $this->setLinkDocuments();
		return $this->load->view('common/header', $this->data);
	}

	protected function addServiceToMenu($data) {
	    if (App::$config->idProductServiceOnMainMenu) {
            $this->load->model('catalog/product');
            $product_info = $this->model_catalog_product->getProduct(App::$config->idProductServiceOnMainMenu);
            $data['categories'][] = array(
                'name'     => $product_info['name'],
                'children' => [],
                'column'   => 1,
                'category_id'   => -1,
                'href'     => $this->url->link('product/product', ['product_id' => App::$config->idProductServiceOnMainMenu]),
            );
        }
        return $data;
    }

    protected function setLinkDocuments() {
        foreach ($this->data['modern_top_links6'] as &$link) {
            $link['isDocuments'] = $this->isLinkDocuments($link);
            if (!$link['isDocuments'] ) {
                continue;
            }
            $link['dataDoc']['items'] = $this->getDocuments();
        }
    }

    protected function isLinkDocuments($dataLink) {
        if ($dataLink['link_top'][1] == '#documents') {
            return true;
        }
        return false;
    }

    protected function getDocuments() {
        $items = \app\models\Documents::getActiveList();
        $result = [];
        foreach ($items as $item) {
            $result[] = [
                'title' => $item->title,
                'link' => $this->url->link('information/documents/info',['id'=>$item->id])
            ];
        }
        $result[] = [
            'title' => 'Сертификаты',
            'link' => $this->url->link('information/certificates')
        ];
        $result[] = [
            'title' => 'Карточка предприятия',
            'link' => $this->url->link('information/information',['information_id'=>8])
        ];
        return $result;
    }
}
