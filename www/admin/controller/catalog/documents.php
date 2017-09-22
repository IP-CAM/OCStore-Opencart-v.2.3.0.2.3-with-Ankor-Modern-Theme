<?php
use app\core\App;
use app\models\Callback;
use app\models\Documents;

class ControllerCatalogDocuments extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('catalog/documents');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

                $this->response->redirect($this->url->link('catalog/documents', 'token=' . $this->session->data['token'], true));
	
		}

		$this->getList();
	}

	public function add() {
		$this->load->language('catalog/documents');

		$this->document->setTitle($this->language->get('heading_title'));



		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

            $item = new Documents();
            $item->load($this->request->post);
            $item->save();
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
			$this->response->redirect($this->url->link('catalog/documents', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('catalog/documents');

        $this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $item = Documents::findOneById($this->request->get['id']);
            $item->load($this->request->post);
            $item->saveFiles($this->request->files);
            $item->save();
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
			$this->response->redirect($this->url->link('catalog/documents', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}
	
	public function delete() {
		$this->load->language('catalog/documents');
		$this->document->setTitle($this->language->get('heading_title'));
        $selected = [];
        if (isset($this->request->post['selected'])) {
            $selected = $this->request->post['selected'];
        } elseif ($this->request->get['id']) {
            $selected[] = $this->request->get['id'];
        }

		if (!empty($selected) && $this->validateDelete()) {
			foreach ($selected as $id) {
                Documents::delete($id);
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
			$this->response->redirect($this->url->link('catalog/documents', 'token=' . $this->session->data['token'] . $url, true));
		}
		$this->getList();
	}

	private function getList() {
        $data = $this->language->all();
        $data = $this->getAlerts($data);
        $data['controller'] = $this;
        $data['breadcrumbs'] = $this->getBreadcrumbs();
        $data['add'] = $this->url->link('catalog/documents/add', 'token=' . $this->session->data['token'], true);
        $data['delete'] = $this->url->link('catalog/documents/delete', 'token=' . $this->session->data['token'], true);
        $data['setting'] = $this->url->link('catalog/documents/setting', 'token=' . $this->session->data['token'], true);

        $data['pagination'] = $this->getPagination(Documents::totalCount());

        $data['items'] = Documents::getListAdmin($data);

        //MAIN DATA
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/documents/list', $data));

	}

	private function getPagination($total) {
	    if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }
        $pagination = new Pagination();
        $pagination->total = $total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->limit = 150;
        $pagination->url = $this->url->link('catalog/documents', 'token=' . $this->session->data['token'] . '' . '&page={page}', true);

        return $pagination->render();
    }

	private function getAlerts($data) {
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
        return $data;
    }

    private function getBreadcrumbs(){

        $breadcrumbs = array();

        $breadcrumbs[] = array(
            'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true),
            'text'      => $this->language->get('text_home'),
            'separator' => false
        );

        $breadcrumbs[] = array(
            'href'      => $this->url->link('catalog/documents', 'token=' . $this->session->data['token'], true),
            'text'      => $this->language->get('heading_title'),
            'separator' => ' :: '
        );
        return $breadcrumbs;

	}

	private function getForm() { 

		$this->load->language('catalog/documents');

        $this->document->setTitle($this->language->get('heading_title'));
        $data = [];
        if ((isset($this->request->get['id'])) ) {
            $item = Documents::findOneById($this->request->get['id']);
        } else {
            $item = new Documents();
        }
        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            $item->load($this->request->post);
        }

        if (!isset($this->request->get['id'])) {
            $data['action'] = $this->url->link('catalog/documents/add', 'token=' . $this->session->data['token'], true);
        } else {
            $data['action'] = $this->url->link('catalog/documents/edit', 'token=' . $this->session->data['token'] . '&id=' . $this->request->get['id'], true);
        }

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

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['cancel'] = $this->url->link('catalog/documents', 'token=' . $this->session->data['token'], true);

        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_setting'] = $this->language->get('button_setting');

        $data = $this->getAlerts($data);

        $data['breadcrumbs'] = $this->getBreadcrumbs();

        $data['item'] = $item;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('catalog/documents/form', $data));

	}

	public function setting() {
		$this->load->language('catalog/documents');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		$this->load->model('catalog/documents');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateSetting()) {
			$this->model_setting_setting->editSetting('documents_setting', $this->request->post);
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
		if (!$this->user->hasPermission('modify', 'catalog/documents')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/documents')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
	
		return !$this->error;
	}

	protected function validateSetting() {
		if (!$this->user->hasPermission('modify', 'catalog/documents')) {
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