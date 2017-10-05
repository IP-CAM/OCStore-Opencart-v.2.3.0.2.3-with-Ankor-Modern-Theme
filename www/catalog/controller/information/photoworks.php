<?php

use app\models\Photowork;

class ControllerInformationPhotoworks extends \app\core\Controller {
    protected $limitTitle = 80;
    protected $limitTitleImage = 42;
    protected $data = [];

	public function index(){
		$this->load->language('information/photoworks');
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

		$total = Photowork::totalCount();
		$items = Photowork::getActiveList();
        $data['breadcrumbs'][] = array(
            'href' => $this->url->link('information/photoworks'),
            'text' => $this->language->get('heading_title')
        );
		if ($items) {
            $setting = array();
            $setting['description_limit'] = '300';
            $setting['news_thumb_width'] = '220';
            $setting['news_thumb_height'] = '220';

			foreach ($items as $result) {

				if($result->image){
					$image = $this->model_tool_image->resize($result->image, 360, 360);
				}else{
					$image = false;
				}

				$data['items'][] = array(
					'title' => getLimitStr($result->title,$this->limitTitle),
					'originalTitle' => $result->title,
					'thumb' => $image,
					'description' => utf8_substr(strip_tags(html_entity_decode($result->description, ENT_QUOTES,
						'UTF-8')), 0, 55),
					'href' => $this->url->link('information/photoworks/info', 'id=' . $result->id),
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
				'href' => $this->url->link('information/photoworks', $url . '&limit=' . $value)
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
		$pagination->url = $this->url->link('information/photoworks', $url . '&page={page}');

		$data['pagination'] = $pagination->render();
		$data['results'] = sprintf($this->language->get('text_pagination'), ($total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($total - $limit)) ? $total : ((($page - 1) * $limit) + $limit), $total, ceil($total / $limit));

		// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
		if ($page == 1) {
			$this->document->addLink($this->url->link('information/photoworks', '', true), 'canonical');
		} elseif ($page == 2) {
			$this->document->addLink($this->url->link('information/photoworks', '', true), 'prev');
		} else {
			$this->document->addLink($this->url->link('information/photoworks', '&page=' . ($page - 1), true), 'prev');
		}

		if ($limit && ceil($total / $limit) > $page) {
			$this->document->addLink($this->url->link('information/photoworks', '&page=' . ($page + 1), true), 'next');
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

        $this->response->setOutput($this->load->view('art/photoworks/list', $data));
    }

	public function info(){
		$this->language->load('information/photoworks');

		$data['breadcrumbs'] = array();
        $this->data = &$data;
		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('common/home'),
			'text' => $this->language->get('text_home')
		);

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('information/photoworks'),
			'text' => $this->language->get('heading_title')
		);

		if (isset($this->request->get['id'])) {
			$id = $this->request->get['id'];
		} else {
			$id = 0;
		}
        $data['hrefList'] = $this->url->link('information/photoworks');
		$item = Photowork::findOneById($id);

		if ($item) {
            $data['item'] = $item;
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');

			if ($item->metaTitle) {
				$this->document->setTitle($item->metaTitle);
			} else {
				$this->document->setTitle($item->title);
			}

			$this->document->setDescription($item->metaDescription);


            $data['heading_title'] = $item->title;


			$data['breadcrumbs'][] = array(
				'text' => $item->title,
				'href' => $this->url->link('information/photoworks/info', 'id=' . $id)
			);

			$this->document->addLink($this->url->link('information/photoworks', 'id=' . $this->request->get['id']),
				'canonical');
			$this->load->model('tool/image');

			$data['images'] = $this->getDataImage($item);
			$data['photoworks'] = $this->url->link('information/photoworks');
			$data['continue'] = $this->url->link('common/home');
			if (isset($_SERVER['HTTP_REFERER'])) {
				$data['referred'] = $_SERVER['HTTP_REFERER'];
			}

			$data['description'] = html_entity_decode($item->description, ENT_QUOTES, 'UTF-8');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('art/photoworks/item', $data));

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
        $item->getImages();
        $image = [];
        if ($item->image) {
            $image = $this->getResizeImage($item->image);
            $image['name'] = getLimitStr($item->nameImage,$this->limitTitleImage);
            $image['nameOriginal'] = $item->nameImage;
            $images[] = $image;
        }
        foreach ($item->images as $more_image) {
            $image = $this->getResizeImage($more_image['src']);
            $image['name'] = getLimitStr($more_image['name'],$this->limitTitleImage);
            $image['nameOriginal'] = $more_image['name'];
            $images[] = $image;
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