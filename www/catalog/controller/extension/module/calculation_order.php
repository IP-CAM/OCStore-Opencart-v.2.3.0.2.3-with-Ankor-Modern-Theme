<?php
use app\models\CalculatingOrder;
use app\models\Callback;

class ControllerExtensionModuleCalculationOrder extends Controller {
	public $data=[];

	public function index() {
        $this->data['productId'] = '';
        if (isset($this->request->get['productId'])) {
            $this->data['productId'] = $this->request->get['productId'];
        }
        $this->getForm();
	}

    public function getForm(){
        $this->response->setOutput($this->load->view('art/calculation_order/form', $this->data));
	}

    public function save(){

        $order = new CalculatingOrder();
        $data = $this->request->post;
        if (isset($data['productId'])) {
            $data['url'] = $this->url->link('product/product',['product_id' => $data['productId']]);
        }
        if ($order->validate($data)) {
            $order->load($data);
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
        $data["message"] = 'Заказ расчета успешно отправлен';
        $data["title"] = 'Заказ расчета';
        $this->response->setOutput($this->load->view('art/modal_succes', $data));
    }

}

