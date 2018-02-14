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
            if (!$document->id) {
                $this->setOutput404();
                return;
            }
            $document->getFiles();
            $this->setMeta($document);

        } else {
            $this->setOutput404();
            return;
        }
        $this->setBreadcrumbs($document);
        $this->data['document'] = $document;
        $this->data['heading_title'] = $document->title;
        $this->data['controller'] = $this;
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

    protected function setOutput404(){
        $this->language->load('information/documents');
        $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');
        $data['breadcrumbs'][] = array(
            'href' => $this->url->link('common/home'),
            'text' => $this->language->get('text_home')
        );

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_error'] = 'Записей не найдено';

        $data['button_continue'] = $this->language->get('button_continue');
        $data['continue'] = $this->url->link('common/home');

        $this->document->setTitle('Документы');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('error/not_found', $data));

    }

    protected function setMeta(Documents $document){
        $this->document->setTitle($document->title);
        if ($document->metaTitle) {
            $this->document->setTitle($document->metaTitle);
        }
        $this->document->setDescription($document->metaDescription);
    }

    public function getFile() {
        if (isset($this->request->get['id'])) {
            $file = Documents::getFile($this->request->get['id']);
            if ($this->request->get['request'] == 'open'){
                \app\libs\Download::openFile($file['path']);
            }else{
                \app\libs\Download::downloadFile($file['path']);
            }
        } else {
            $this->response->redirect('/');
        }
    }

}