<?php

class ControllerInformationPrides extends \App\core\Controller {

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
		$this->language->load('information/news');

		$this->load->model('catalog/news');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('common/home'),
			'text' => $this->language->get('text_home')
		);

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('information/news'),
			'text' => $this->language->get('heading_title')
		);

		if (isset($this->request->get['news_id'])) {
			$news_id = $this->request->get['news_id'];
		} else {
			$news_id = 0;
		}

		$news_info = $this->model_catalog_news->getNewsStory($this->request->get['news_id']);

		if ($news_info) {

			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');

			if ($news_info['meta_title']) {
				$this->document->setTitle($news_info['meta_title']);
			} else {
				$this->document->setTitle($news_info['title']);
			}

			$this->document->setDescription($news_info['meta_description']);
			$this->document->setKeywords($news_info['meta_keyword']);

			if ($news_info['meta_h1']) {
				$data['heading_title'] = $news_info['meta_h1'];
			} else {
				$data['heading_title'] = $news_info['title'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $news_info['title'],
				'href' => $this->url->link('information/news/info', 'news_id=' . $news_id)
			);

			$this->document->addLink($this->url->link('information/news', 'news_id=' . $this->request->get['news_id']),
				'canonical');

			$data['description'] = html_entity_decode($news_info['description']);

			$data['viewed'] = sprintf($this->language->get('text_viewed'), $news_info['viewed']);
			$data['posted'] = date($this->language->get('date_format_short'), strtotime($news_info['date_added']));

			if ($this->config->get('news_setting')) {
				$news_setting = $this->config->get('news_setting');
			}else{
				$news_setting['news_thumb_width']  = '220';
				$news_setting['news_thumb_height'] = '220';
				$news_setting['news_popup_width']  = '560';
				$news_setting['news_popup_height'] = '560';
			}

			if(isset($news_setting['news_share'])){
				$data['news_share'] = $news_setting['news_share'];
			}else{
				$data['news_share'] = false;
			}
			$this->load->model('tool/image');

			if ($news_info['image']) {
				$data['image'] = true;
			} else {
				$data['image'] = false;
			}
			if($news_info['image']){
				$data['thumb'] = $this->model_tool_image->resize($news_info['image'], $news_setting['news_thumb_width'],
				$news_setting['news_thumb_height']);
				$data['popup'] = $this->model_tool_image->resize($news_info['image'], $news_setting['news_popup_width'],
				$news_setting['news_popup_height']);
			}else{
				$data['thumb'] = false;
				$data['popup'] = false;
			}

			$data['button_news'] = $this->language->get('button_news');
			$data['button_continue'] = $this->language->get('button_continue');

			$data['news_list'] = $this->url->link('information/news');
			$data['continue'] = $this->url->link('common/home');

			if (isset($_SERVER['HTTP_REFERER'])) {
				$data['referred'] = $_SERVER['HTTP_REFERER'];
			}

			$data['refreshed'] = 'http://' . $_SERVER['HTTP_HOST'] . '' . $_SERVER['REQUEST_URI'];

			if (isset($data['referred'])) {
				$this->model_catalog_news->updateViewed($this->request->get['news_id']);
			}

			$data['description'] = html_entity_decode($news_info['description'], ENT_QUOTES, 'UTF-8');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('information/news', $data));

		} else {
			$url = '';

			if (isset($this->request->get['news_id'])) {
				$url .= '&news_id=' . $this->request->get['news_id'];
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
}