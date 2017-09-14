<?php
/**
 * Created by PhpStorm.
 * User: korns
 * Date: 11.09.2017
 * Time: 14:09
 */

namespace app\core;


class Controller extends \Controller {

    public function getBreadcrumbs(){
        $url = '';
        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        if (isset($this->request->get['limit'])) {
            $url .= '&limit=' . $this->request->get['limit'];
        }

        $breadcrumbs[] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link($this->request->get['route'], $url)
        );
        return $breadcrumbs;
    }

}