<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

					$data['content_top1'] =  $this->load->controller('common/content_top1');
                    $data['content_top2'] =  $this->load->controller('common/content_top2');
                    $data['content_bot1'] =  $this->load->controller('common/content_bot1');
                    $data['content_bot2'] =  $this->load->controller('common/content_bot2');
                    $data['content_bot3'] =  $this->load->controller('common/content_bot3');
                    $data['content_fluid'] =  $this->load->controller('common/content_fluid');
                    $data['content_slleft'] =  $this->load->controller('common/content_slleft');
      

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
