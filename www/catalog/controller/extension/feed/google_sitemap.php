<?php
use app\core\App;

/**
 * Class ControllerExtensionFeedGoogleSitemap
 * @property ModelCatalogAridiusNews model_catalog_aridiusnews
 */
class ControllerExtensionFeedGoogleSitemap extends Controller {
    protected $output;


	public function index() {
        if (isset($this->request->get['clear_cache']) && $this->request->get['clear_cache'] == 'y') {
            App::$cache->delete('sitemap_xml');
        }
		if ($this->config->get('google_sitemap_status')) {
            $cache = App::$cache->get('sitemap_xml');
            if ($cache) {
                $this->output = $cache;
            } else {
                $this->setOutputFromDb();
                $hours = 24;
                if (App::$config->cacheTimeSitemap) {
                    $hours = (int)App::$config->cacheTimeSitemap;
                }
                App::$cache->set('sitemap_xml',$this->output, $hours * 3600);
            }
			$this->response->addHeader('Content-Type: application/xml');
			$this->response->setOutput($this->output);
		}
	}

	protected function setOutputFromDb() {
        $this->output  = '<?xml version="1.0" encoding="UTF-8"?>';
        $this->output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">';

        $this->setProducts();
        $this->setCategories();
        $this->setManufacturers();
        $this->setInformation();
        $this->setStaticPage();
        $this->setAridiusNews();

        $this->output .= '</urlset>';
    }

	protected function getCategories($parent_id, $current_path = '') {
		$output = '';

		$results = $this->model_catalog_category->getCategories($parent_id);

		foreach ($results as $result) {
			if (!$current_path) {
				$new_path = $result['category_id'];
			} else {
				$new_path = $current_path . '_' . $result['category_id'];
			}

			$output .= '<url>';
			$output .= '<loc>' . $this->url->link('product/category', 'path=' . $new_path) . '</loc>';
			$output .= '<changefreq>weekly</changefreq>';
			$output .= '<priority>0.7</priority>';
			$output .= '</url>';

			$products = $this->model_catalog_product->getProducts(array('filter_category_id' => $result['category_id']));

			foreach ($products as $product) {
				$output .= '<url>';
				$output .= '<loc>' . $this->url->link('product/product', 'path=' . $new_path . '&product_id=' . $product['product_id']) . '</loc>';
				$output .= '<changefreq>weekly</changefreq>';
				$output .= '<priority>1.0</priority>';
				$output .= '</url>';
			}

			$output .= $this->getCategories($result['category_id'], $new_path);
		}

		return $output;
	}

	protected function setStaticPage() {
	    $pages =  [
            $this->url->link('information/information',['information_id' => 4]),
            $this->url->link('information/contact'),
            $this->url->link('product/manufacturer'),
        ];
        foreach ($pages as $page) {
            $this->output .= '<url>';
            $this->output .= '<loc>' . $page . '</loc>';
            $this->output .= '<changefreq>weekly</changefreq>';
            $this->output .= '<priority>0.5</priority>';
            $this->output .= '</url>';
        }
    }

    protected function setInformation(){
        return;
        $this->load->model('catalog/information');
        $informations = $this->model_catalog_information->getInformations();
        foreach ($informations as $information) {
            $this->output .= '<url>';
            $this->output .= '<loc>' . $this->url->link('information/information', 'information_id=' . $information['information_id']) . '</loc>';
            $this->output .= '<changefreq>weekly</changefreq>';
            $this->output .= '<priority>0.7</priority>';
            $this->output .= '</url>';
        }
    }

    protected function setManufacturers(){
        return;
        $this->load->model('catalog/manufacturer');
        $manufacturers = $this->model_catalog_manufacturer->getManufacturers();
        foreach ($manufacturers as $manufacturer) {
            $this->output .= '<url>';
            $this->output .= '<loc>' . $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id']) . '</loc>';
            $this->output .= '<changefreq>weekly</changefreq>';
            $this->output .= '<priority>0.7</priority>';
            $this->output .= '</url>';

            $products = $this->model_catalog_product->getProducts(array('filter_manufacturer_id' => $manufacturer['manufacturer_id']));

            foreach ($products as $product) {
                $this->output .= '<url>';
                $this->output .= '<loc>' . $this->url->link('product/product', 'manufacturer_id=' . $manufacturer['manufacturer_id'] . '&product_id=' . $product['product_id']) . '</loc>';
                $this->output .= '<changefreq>weekly</changefreq>';
                $this->output .= '<priority>1.0</priority>';
                $this->output .= '</url>';
            }
        }
    }

    protected function setProducts(){
        $this->load->model('catalog/product');
        $this->load->model('tool/image');

        $products = $this->model_catalog_product->getProducts();

        foreach ($products as $product) {
            if ($product['image']) {
                $this->output .= '<url>';
                $this->output .= '<loc>' . $this->url->link('product/product', 'product_id=' . $product['product_id']) . '</loc>';
                $this->output .= '<changefreq>weekly</changefreq>';
                $this->output .= '<lastmod>' . date('Y-m-d\TH:i:sP', strtotime($product['date_modified'])) . '</lastmod>';
                $this->output .= '<priority>1.0</priority>';
                $this->output .= '<image:image>';
                $this->output .= '<image:loc>' . $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')) . '</image:loc>';
                $this->output .= '<image:caption>' . $product['name'] . '</image:caption>';
                $this->output .= '<image:title>' . $product['name'] . '</image:title>';
                $this->output .= '</image:image>';
                $this->output .= '</url>';
            }
        }
    }

    protected function setCategories(){
        $this->load->model('catalog/category');
        $this->output .= $this->getCategories(0);

    }

    protected function setAridiusNews() {
        $this->load->model('catalog/aridiusnews');
        $news = $this->model_catalog_aridiusnews->getaridius_news([]);
        foreach ($news as $item) {
            $this->output .= '<url>';
            $this->output .= '<loc>' .
                $this->url->link('information/aridius_news', ['aridius_news_id' => $item['aridius_news_id']])
                . '</loc>';
            $this->output .= '<changefreq>weekly</changefreq>';
            $this->output .= '<priority>0.7</priority>';
            $this->output .= '</url>';
        }
    }

}
