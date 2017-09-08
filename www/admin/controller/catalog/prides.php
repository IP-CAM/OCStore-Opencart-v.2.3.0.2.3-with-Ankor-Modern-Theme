<?php
use App\core\App;

/**
 * Class ControllerCatalogPrides
 * @property ModelCatalogPrides model_catalog_prides
 */
class ControllerCatalogPrides extends Controller {
	private $error = array();

	public function index() {

		$this->load->language('catalog/prides');

		$this->load->model('catalog/prides');

		$this->document->setTitle($this->language->get('heading_title'));
	
		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting(prides, $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('catalog/prides', 'token=' . $this->session->data['token'], true));
	
		}
	
		$this->getList();
	}

	public function add() {
		$this->load->language('catalog/prides');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/prides');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_prides->add($this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
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
			$this->response->redirect($this->url->link('catalog/prides', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('catalog/prides');
		$this->load->model('catalog/prides');
        $this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_prides->edit($this->request->get['id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('catalog/prides', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}
	
	public function delete() {
		$this->load->language('catalog/prides');
        $this->load->model('catalog/prides');
		$this->document->setTitle($this->language->get('heading_title'));
        $selected = [];
        if (isset($this->request->post['selected'])) {
            $selected = $this->request->post['selected'];
        } elseif ($this->request->get['id']) {
            $selected[] = $this->request->get['id'];
        }

		if (!empty($selected) && $this->validateDelete()) {
			foreach ($selected as $id) {
				$this->model_catalog_prides->delete($id);
			}
			$this->session->data['success'] = $this->language->get('text_success');
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
			$this->response->redirect($this->url->link('catalog/prides', 'token=' . $this->session->data['token'] . $url, true));
		}
		$this->getList();
	}

	private function getList() {
        $prides = $this->model_catalog_prides->find();
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'nd.title';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		$this->load->language('catalog/prides');

		$this->load->model('catalog/prides');

		$data['heading_title'] = $this->language->get('heading_title');
	
		$data['text_list'] = $this->language->get('text_list');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_no_results'] = $this->language->get('text_no_results');
	
		$data['column_image'] = $this->language->get('column_image');		
		$data['column_title'] = $this->language->get('column_title');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_viewed'] = $this->language->get('column_viewed');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');		
	
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_setting'] = $this->language->get('button_setting');
	
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
	
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
	
		$data['breadcrumbs'] = $this->getBreadcrumbs();
	
		$data['add'] = $this->url->link('catalog/prides/add', 'token=' . $this->session->data['token'], true);
		$data['delete'] = $this->url->link('catalog/news/delete', 'token=' . $this->session->data['token'], true);
		$data['setting'] = $this->url->link('catalog/news/setting', 'token=' . $this->session->data['token'], true);
	
		$news_total = $this->model_catalog_prides->totalCount();
	
		$this->load->model('tool/image');
	
		$data['news'] = array();
	
        $filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$results = [];
	
    	foreach ($prides as $pride) {

			if ($pride['image'] && file_exists(DIR_IMAGE . $pride['image'])) {
				$image = $this->model_tool_image->resize($pride['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', 40, 40);
			}
		
			$data['items'][] = array(
				'id'     	=> $pride['id'],
				'title'       	=> $pride['title'],
				'image'      	=> $image,
				'status'     	=> ($pride['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'selected'    	=> isset($this->request->post['selected']) && in_array($pride['id'], $this->request->post['selected']),
				'edit'      	=> $this->url->link('catalog/prides/edit', 'token=' . $this->session->data['token'] . '&id=' . $pride['id'], true),
				'delete'      	=> $this->url->link('catalog/prides/delete', 'token=' . $this->session->data['token'] . '&id=' . $pride['id'], true)
			);
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_title'] = $this->url->link('catalog/pride', 'token=' . $this->session->data['token'] . '&sort=nd.title' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $news_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/pride', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($news_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($news_total - $this->config->get('config_limit_admin'))) ? $news_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $news_total, ceil($news_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;
	
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('catalog/prides_list', $data));

	}

    private function getBreadcrumbs(){

        $breadcrumbs = array();

        $breadcrumbs[] = array(
            'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true),
            'text'      => $this->language->get('text_home'),
            'separator' => false
        );

        $breadcrumbs[] = array(
            'href'      => $this->url->link('catalog/prides', 'token=' . $this->session->data['token'], true),
            'text'      => $this->language->get('heading_title'),
            'separator' => ' :: '
        );
        return $breadcrumbs;

	}

	private function setLanguage(&$data, $method = 'getForm') {
        $data['heading_title'] = $this->language->get('heading_title');
        $data['token'] = $this->session->data['token'];
        $methodRun = 'setLang' . lcfirst($method);
        $this->$methodRun($data);
    }

    private function setLangGetForm(&$data){
        $data['text_form'] = !isset($this->request->get['id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_default'] = $this->language->get('text_default');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_image_manager'] = $this->language->get('text_image_manager');
        $data['text_browse'] = $this->language->get('text_browse');
        $data['text_clear'] = $this->language->get('text_clear');

        $data['text_select_all'] = $this->language->get('text_select_all');
        $data['text_unselect_all'] = $this->language->get('text_unselect_all');
        $data['column_date_added'] = $this->language->get('column_date_added');

        $data['entry_title'] = $this->language->get('entry_title');
        $data['entry_meta_title'] = $this->language->get('entry_meta_title');
        $data['entry_meta_h1'] = $this->language->get('entry_meta_h1');
        $data['entry_meta_description'] = $this->language->get('entry_meta_description');
        $data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
        $data['entry_description'] = $this->language->get('entry_description');
        $data['entry_date_added'] = $this->language->get('entry_date_added');
        $data['entry_store'] = $this->language->get('entry_store');
        $data['entry_keyword'] = $this->language->get('entry_keyword');
        $data['entry_image'] = $this->language->get('entry_image');
        $data['entry_status'] = $this->language->get('entry_status');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $data['tab_general'] = $this->language->get('tab_general');
        $data['tab_data'] = $this->language->get('tab_data');

        $data['help_keyword'] = $this->language->get('help_keyword');
    }

	private function getForm() { 

		$this->load->language('catalog/prides');
		$this->load->model('catalog/prides');

        $this->document->setTitle($this->language->get('heading_title'));
        $data = [];
        $fields = $this->model_catalog_prides->getColumns();
        foreach ($fields as $field) {
            $data[$field] = null;
        }
        $findItem = false;
        if ((isset($this->request->get['id'])) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $findItem = $this->model_catalog_prides->findOne($this->request->get['id']);
        }
        $data = array_merge($data,$findItem);

        $this->setLanguage($data,'getForm');
	
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = array();
		}

		if (isset($this->error['description'])) {
			$data['error_description'] = $this->error['description'];
		} else {
			$data['error_description'] = '';
		}

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = array();
		}

		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}
	
		$data['breadcrumbs'] = $this->getBreadcrumbs();
	
		if (!isset($this->request->get['id'])) {
			$data['action'] = $this->url->link('catalog/prides/add', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('catalog/prides/edit', 'token=' . $this->session->data['token'] . '&id=' . $this->request->get['id'], true);
		}
		$data['cancel'] = $this->url->link('catalog/prides', 'token=' . $this->session->data['token'], true);

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($findItem) && is_file(DIR_IMAGE . $findItem['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($findItem['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

	
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('catalog/prides_form', $data));

	}

	public function setting() {
		$this->load->language('catalog/prides');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		$this->load->model('catalog/prides');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateSetting()) {
			$this->model_setting_setting->editSetting('prides_setting', $this->request->post);
				if (isset($this->request->post['news_url'])) {
					$this->model_catalog_news->setNewsListUrl($this->request->post['news_url']);
				}	
			$this->session->data['success'] = $this->language->get('text_success');

			$this->cache->delete('news_setting');

			$this->response->redirect($this->url->link('catalog/news', 'token=' . $this->session->data['token'], true));
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['thumb'])) {
			$data['error_thumb'] = $this->error['thumb'];
		} else {
			$data['error_thumb'] = '';
		}

		if (isset($this->error['popup'])) {
			$data['error_popup'] = $this->error['popup'];
		} else {
			$data['error_popup'] = '';
		}

		if (isset($this->error['description_limit'])) {
			$data['error_limit'] = $this->error['description_limit'];
		} else {
			$data['error_limit'] = '';
		}		

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['entry_thumb'] = $this->language->get('entry_thumb');
		$data['entry_popup'] = $this->language->get('entry_popup');
		$data['entry_share'] = $this->language->get('entry_share');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_news_url'] = $this->language->get('entry_news_url');

		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');

		$data['action'] = $this->url->link('catalog/news/setting', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('catalog/news', 'token=' . $this->session->data['token'], true);
	
		$data['breadcrumbs'] = array();
	
		$data['breadcrumbs'][] = array(
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true),
			'text'      => $this->language->get('text_home'),
			'separator' => false
		);
	
		$data['breadcrumbs'][] = array(
			'href'      => $this->url->link('catalog/news', 'token=' . $this->session->data['token'], true),
			'text'      => $this->language->get('heading_title'),
			'separator' => ' :: '
		);

		$data['breadcrumbs'][] = array(
			'href'      => $this->url->link('catalog/news/setting', 'token=' . $this->session->data['token'], true),
			'text'      => $this->language->get('text_news_setting'),
			'separator' => ' :: '
		);	

		if (isset($this->request->post['news_setting'])) {
			$news_setting = $this->request->post['news_setting'];
		} elseif ($this->config->get('news_setting')) {
			$news_setting = $this->config->get('news_setting');
		} else {
			$news_setting = array();
		}

		if (isset($news_setting['news_thumb_width'])) {
			$data['news_thumb_width'] = $news_setting['news_thumb_width'];
		} else {
			$data['news_thumb_width'] = '';
		}	

		if (isset($news_setting['news_thumb_height'])) {
			$data['news_thumb_height'] = $news_setting['news_thumb_height'];
		} else {
			$data['news_thumb_height'] = '';
		}	

		if (isset($news_setting['news_popup_width'])) {
			$data['news_popup_width'] = $news_setting['news_popup_width'];
		} else {
			$data['news_popup_width'] = '';
		}	

		if (isset($news_setting['news_popup_height'])) {
			$data['news_popup_height'] = $news_setting['news_popup_height'];
		} else {
			$data['news_popup_height'] = '';
		}	

		if (isset($news_setting['description_limit'])) {
			$data['description_limit'] = $news_setting['description_limit'];
		} else {
			$data['description_limit'] = '';
		}

		if (isset($news_setting['news_share'])) {
			$data['news_share'] = $news_setting['news_share'];
		} else {
			$data['news_share'] = '';
		}								

		$news_url = $this->model_catalog_news->getNewsListUrl('information/news');

		if($news_url){
			$data['news_url'] = $news_url;
		}else{
			$data['news_url'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('catalog/news_setting', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/prides')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/prides')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
	
		return !$this->error;
	}

	protected function validateSetting() {
		if (!$this->user->hasPermission('modify', 'catalog/prides')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		$news_setting = $this->request->post['news_setting'];

		if (!$news_setting['news_thumb_width'] || !$news_setting['news_thumb_height']) {
			$this->error['thumb'] = $this->language->get('error_thumb');
		}
	
		if (!$news_setting['news_popup_width'] || !$news_setting['news_popup_height']) {
			$this->error['popup'] = $this->language->get('error_popup');
		}

		if (!$news_setting['description_limit']) {
			$this->error['description_limit'] = $this->language->get('error_description_limit');
		}		
	
		return !$this->error;
	}
}
?>