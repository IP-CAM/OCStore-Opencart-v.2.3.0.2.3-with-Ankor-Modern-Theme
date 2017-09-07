<?php
class ControllerExtensionModuleAridiusNewsCategory extends Controller {

	public function index($setting) {
		
		$this->load->language('extension/module/aridius_news_category');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_all_news'] = $this->language->get('text_all_news');
		
        $data['aridius_newslist'] = $this->url->link('information/aridius_news');
		
		$this->document->addStyle('catalog/view/theme/modern/stylesheet/aridius_news_category.css');

		$check=array();
		$check = $setting['aridius_news_category2'];

		if (isset($this->request->get['aridius_news_id'])) {
			$parts = explode('_', (string)$this->request->get['aridius_news_id']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['aridius_news_id'] = $parts[0];
		} else {
			$data['aridius_news_id'] = 0;
		}

		$this->load->model('catalog/aridiusnews');
	    $this->load->model('tool/image');
		$data['news'] = array();

		$news = $this->model_catalog_aridiusnews->getaridius_news(0);

		foreach ($news as $new) {

	  if (isset($check) && (in_array($new['aridius_news_id'], $check ))) {	
				if ($new['image']) {
                $new['image'] = $this->model_tool_image->resize($new['image'], $setting['width'], $setting['height']);
            } else {
                $new['image'] = '';
            }
			if ($new['video']) {
				$video = $new['video'];
				} else {
				$video = false;
			}

			$data['news'][] = array(
				'aridius_news_id'  	=> $new['aridius_news_id'],
				'href'				=> $this->url->link('information/aridius_news', 'aridius_news_id=' . $new['aridius_news_id']),
				'title'				=> $new['title'],
				'video'			=> $video,
				'description'       => utf8_substr(strip_tags(html_entity_decode($new['description'], ENT_QUOTES, 'UTF-8')), 0, 70) . '..',
				'thumb'             => $new['image']
			);
		  }
		}
		
		$this->load->model('catalog/aridiusnews');	
		$data['aridius_news_count'] = $this->model_catalog_aridiusnews->getTotalaridius_news();
	    
		if ($data['aridius_news_count'] > count($check)) {
			$data['showbutton'] = true;
		} else {
			$data['showbutton'] = false;
		}

		return $this->load->view('extension/module/aridius_news_category', $data);
	}
}