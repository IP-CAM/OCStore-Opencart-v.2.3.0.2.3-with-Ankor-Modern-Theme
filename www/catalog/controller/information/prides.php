<?php

class ControllerInformationPrides extends \app\core\Controller {

	public function index(){
		$this->load->language('information/prides');
		$this->load->model('catalog/prides');
		$this->load->model('tool/image');

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'sort';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
		}
		$this->document->setTitle($this->language->get('heading_title'));
		$data = $this->language->all();
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'href' => $this->url->link('common/home'),
            'text' => $this->language->get('text_home')
        );
		$filter_data = array(
			'sort' => $sort,
			'order' => $order,
			'start' => ($page - 1) * $limit,
			'limit' => $limit
		);

		$total = $this->model_catalog_prides->totalCount();
		$items = $this->model_catalog_prides->find($filter_data);
        $data['breadcrumbs'][] = array(
            'href' => $this->url->link('information/prides'),
            'text' => $this->language->get('heading_title')
        );
		if ($items) {
            $setting = array();
            $setting['description_limit'] = '300';
            $setting['news_thumb_width'] = '220';
            $setting['news_thumb_height'] = '220';

			foreach ($items as $result) {

				if($result['image']){
					$image = $this->model_tool_image->resize($result['image'], 560, 315);
				}else{
					$image = false;
				}

				$data['items'][] = array(
					'title' => $result['title'],
					'titleOrigin' => $result['titleOrigin'],
					'thumb' => $image,
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES,
						'UTF-8')), 0, 90),
					'href' => $this->url->link('information/prides/info', 'id=' . $result['id']),
				);
			}

		}
		$url = '';

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		$data['limits'] = array();

		$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

		sort($limits);

		foreach ($limits as $value) {
			$data['limits'][] = array(
				'text' => $value,
				'value' => $value,
				'href' => $this->url->link('information/prides', $url . '&limit=' . $value)
			);
		}

		$url = '';

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}		

		$pagination = new Pagination();
		$pagination->total = $total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('information/prides', $url . '&page={page}');

		$data['pagination'] = $pagination->render();
		$data['results'] = sprintf($this->language->get('text_pagination'), ($total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($total - $limit)) ? $total : ((($page - 1) * $limit) + $limit), $total, ceil($total / $limit));

		// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
		if ($page == 1) {
			$this->document->addLink($this->url->link('information/prides', '', true), 'canonical');
		} elseif ($page == 2) {
			$this->document->addLink($this->url->link('information/prides', '', true), 'prev');
		} else {
			$this->document->addLink($this->url->link('information/prides', '&page=' . ($page - 1), true), 'prev');
		}

		if ($limit && ceil($total / $limit) > $page) {
			$this->document->addLink($this->url->link('information/prides', '&page=' . ($page + 1), true), 'next');
		}

		$data['limit'] = $limit;

        $data['continue'] = $this->url->link('common/home');
        $data['template'] = $this->config->get('config_template');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('information/prides_list', $data));
    }

	public function info(){
		$this->language->load('information/prides');
		$this->load->model('catalog/prides');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('common/home'),
			'text' => $this->language->get('text_home')
		);

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('information/prides'),
			'text' => $this->language->get('heading_title')
		);

		if (isset($this->request->get['id'])) {
			$id = $this->request->get['id'];
		} else {
			$id = 0;
		}

		$item = $this->model_catalog_prides->findOne($id);

		if ($item) {
            $data['item'] = $item;
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');

			if ($item['meta_title']) {
				$this->document->setTitle($item['meta_title']);
			} else {
				$this->document->setTitle($item['title']);
			}

			$this->document->setDescription($item['meta_description']);
			$this->document->setKeywords($item['meta_keyword']);

			if (isset($item['meta_h1']) && $item['meta_h1']) {
				$data['heading_title'] = $item['meta_h1'];
			} else {
				$data['heading_title'] = $item['title'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $item['title'],
				'href' => $this->url->link('information/prides/info', 'id=' . $id)
			);

			$this->document->addLink($this->url->link('information/prides', 'id=' . $this->request->get['id']),
				'canonical');

			$data['description'] = html_entity_decode($item['description']);

			if(isset($news_setting['news_share'])){
				$data['news_share'] = $news_setting['news_share'];
			}else{
				$data['news_share'] = false;
			}
			$this->load->model('tool/image');

			$data['images'] = $this->getDataImage($item);
			$data['prides'] = $this->url->link('information/prides');
			$data['continue'] = $this->url->link('common/home');
			if (isset($_SERVER['HTTP_REFERER'])) {
				$data['referred'] = $_SERVER['HTTP_REFERER'];
			}

			$data['description'] = html_entity_decode($item['description'], ENT_QUOTES, 'UTF-8');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('information/prides_item', $data));

		} else {
			$url = '';

			if (isset($this->request->get['id'])) {
				$url .= 'id=' . $this->request->get['id'];
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
				'href' => $this->url->link('information/news/info', $url)
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

    protected function getDataImage($item){
        $images = [];
        if (isset($item['image'])) {
            $images[] = $this->getResizeImage($item['image']);
        }
        if (isset($item['more_images'])) {
            foreach ($item['more_images'] as $more_image) {
                $images[] = $this->getResizeImage($more_image['src']);
            }
        }
        return $images;
	}

    protected function getResizeImage($image){
        $setting['news_thumb_width']  = '300';
        $setting['news_thumb_height'] = '300';
        $setting['news_popup_width']  = '800';
        $setting['news_popup_height'] = '800';

        if(!empty($image)){
            $thumb = $this->model_tool_image->resize($image, $setting['news_thumb_width'],
                $setting['news_thumb_height']);
            $popup = $this->model_tool_image->resize($image, $setting['news_popup_width'],
                $setting['news_popup_height']);
        }else{
            $thumb = false;
            $popup = false;
        }
        return compact('thumb','popup');
    }
}