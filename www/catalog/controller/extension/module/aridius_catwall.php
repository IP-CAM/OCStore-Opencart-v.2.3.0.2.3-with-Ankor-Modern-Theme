<?php
class ControllerExtensionModuleAridiusCatWall extends Controller {
	
    public function index($setting) {

        $this->load->language('extension/module/aridius_catwall');
        $data['heading_title'] = $this->language->get('heading_title');
		$data['Seeall'] = $this->language->get('Seeall');

		$data['child_visible'] = $setting['child_visible'];

		$this->document->addStyle('catalog/view/theme/modern/stylesheet/aridius_catwall.css');
		
		$check=array();
	    $check = $setting['aridius_catwall_cat'];

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		if (isset($parts[2])) {
		 $data['sisters_id'] = $parts[2];
	    } else {
		 $data['sisters_id'] = 0;
	    }

		
		$data['add_img'] = $setting['add_img'];
		
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
		
		$children_data = array();

		$sister_data = array();

		$children = $this->model_catalog_category->getCategories($category['category_id']);
					
				foreach ($setting['child_visible'] ? $children : array_slice($children, 0, ($setting['limit_child'])) as $child) {
			
				
                $filter_data = array(
				'filter_category_id'  => $child['category_id'],
				'filter_sub_category' => true
			    );			
				
				$sister_data = array();
				$sisters = $this->model_catalog_category->getCategories($child['category_id']);
	
		if ($child['image']) {
                $img_lv2 = $this->model_tool_image->resize($child['image'], $setting['width'], $setting['height']);
            } else {
                $img_lv2 = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
            }
			
				if($sisters) {
				   foreach (array_slice($sisters, 0, ($setting['limit_child'])) as $sisterMember) {
				   $child_filter_data = array('filter_category_id' => $sisterMember['category_id'], 'filter_sub_category' => true);
					
			    if (isset($check) && (in_array($category['category_id'], $check ))) {	
					  $sister_data[] = array(
						 'category_id' =>$sisterMember['category_id'],
						 'name'        => $sisterMember['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($child_filter_data) . ')' : ''),
						 'href'		=> $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']. '_' . $sisterMember['category_id'])  
					  );					
					}			
				 }
				
				if (isset($check) && (in_array($category['category_id'], $check ))) {	
				   $children_data[] = array(
						 'category_id' => $child['category_id'],
						 'sister_id'   => $sister_data,
						 'name'        => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                          'image' => $img_lv2,
						 'href'		=> $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])  
					  );  
					   }
				} else {	

                if (isset($check) && (in_array($category['category_id'], $check ))) {	
				   $children_data[] = array(
					  'category_id' => $child['category_id'],
					  'sister_id'	=>'',
					 'image' => $img_lv2,
					  'name'        => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
					  'href'		=> $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])  
				  );  
			    }
			  }
            }	

	     if ($category['image']) {
                $image = $this->model_tool_image->resize($category['image'], $setting['width'], $setting['height']);
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
            }		
	
			$filter_data = array(
				'filter_category_id'  => $category['category_id'],
				'filter_sub_category' => true
			);

            if (isset($check) && (in_array($category['category_id'], $check ))) {	
			$data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
				'children'    => $children_data,
				 'image' => $image,
				'sister'	=> $sister_data,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);
		  }
        }

		return $this->load->view('extension/module/aridius_catwall', $data);
    }
}