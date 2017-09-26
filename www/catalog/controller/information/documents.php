<?php

use app\models\Documents;

class ControllerInformationDocuments extends \app\core\Controller {
    protected $data = [];

	public function info(){
        $this->data['continue'] = $this->url->link('common/home');
        $this->data['template'] = $this->config->get('config_template');
        $document = new Documents();
        if (isset($this->request->get['id'])) {
            $document = Documents::findOneById($this->request->get['id']);
            $document->getFiles();
            $this->document->setTitle($document->title);

        }
        $this->setBreadcrumbs($document);
        $this->data['document'] = $document;
        $this->data['heading_title'] = $document->title;
        $this->data['column_left'] = $this->load->controller('common/column_left');
        $this->data['column_right'] = $this->load->controller('common/column_right');
        $this->data['content_top'] = $this->load->controller('common/content_top');
        $this->data['content_bottom'] = $this->load->controller('common/content_bottom');
        $this->data['footer'] = $this->load->controller('common/footer');
        $this->data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('art/documents_list', $this->data));
    }

    protected function setBreadcrumbs($document){
        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'href' => $this->url->link('common/home'),
            'text' => $this->language->get('text_home')
        );
        if (isset($this->request->get['id'])) {
            $this->data['breadcrumbs'][] = array(
                'href' => $this->url->link('information/documents', ['id'=>$this->request->get['id']]),
                'text' => $document->title,
        );
        }

    }


}