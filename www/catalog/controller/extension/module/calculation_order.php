<?php
use app\models\CalculatingOrder;
use app\models\Callback;

class ControllerExtensionModuleCalculationOrder extends Controller {
	
	public function index() {
        $this->getForm();
	}

    public function getForm(){
        $data['productLink'] = $this->url->link('product/product',['id' => '1']);
        $this->response->setOutput($this->load->view('art/calculation_order/form', $data));
	}

    public function save(){

        $order = new CalculatingOrder();
        if ($order->validate($this->request->post)) {
            $order->load($this->request->post);
            if ($order->save()) {
                $data['success'] = true;
            }
        }else {
            $data['errors'] = $order->errors;
        }
        echo json_encode($data);
        die();
    }

    public function success(){
        $data["message"] = 'Заказ успешно отправлен';
        $data["message"] = 'Заказ расчета';
        $this->response->setOutput($this->load->view('art/callback/callback_succes', $data));
    }

}

