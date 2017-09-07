<?php
class ControllerExtensionModuleAridiusPopuptext extends Controller {
	
	public function index($setting) {

        $this->document->addStyle('catalog/view/theme/modern/stylesheet/aridius_popuptext.css');	

		$data['language_id'] = $this->config->get('config_language_id');
		$data['aridius_popuptext_time'] = $setting['aridius_popuptext_time'];
		$data['aridius_popuptext_delay'] = $setting['aridius_popuptext_delay'];
		$data['aridius_popuptext_day'] = $setting['aridius_popuptext_day'];
		
		$data['aridius_popuptext_description'] = $setting['aridius_popuptext_description'];

		return $this->load->view('extension/module/aridius_popuptext', $data);
	}
}

