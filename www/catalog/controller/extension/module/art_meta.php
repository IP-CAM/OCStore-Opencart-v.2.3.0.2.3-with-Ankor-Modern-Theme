<?php
class ControllerExtensionModuleArtMeta extends Controller {


	public function index($settings) {
	    $this->load->language('information/art_meta');
        if ($settings['route'] === $this->language->get($settings['route'])) {
            return;
        }
        $data = $this->language->get($settings['route']);
        $this->document->setTitle($data['title']);
        $this->document->setDescription($data['desc']);

	}
}