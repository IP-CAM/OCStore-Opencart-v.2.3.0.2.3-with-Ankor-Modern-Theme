<?php
use app\models\Callback;

class ControllerExtensionModuleCallback extends Controller {
	
	public function index() {
        $this->getForm();
	}

    public function getForm(){
        $data['url'] = $this->request->get['url'];
        $this->response->setOutput($this->load->view('art/callback/callback_form', $data));
	}

    public function saveCallback(){
        $callback = new Callback();
        if ($callback->validate($this->request->post)) {
            $callback->load($this->request->post);
            if ($callback->save()) {
                $data['success'] = true;
            }
        }else {
            $data['errors'] = $callback->errors;
        }
        echo json_encode($data);
        die();
    }

    public function success(){
        $data["message"] = 'Заказ успешно отправлен';
        $data["title"] = 'Заказ обратного звонка';
        $this->response->setOutput($this->load->view('art/modal_succes', $data));
    }

}

