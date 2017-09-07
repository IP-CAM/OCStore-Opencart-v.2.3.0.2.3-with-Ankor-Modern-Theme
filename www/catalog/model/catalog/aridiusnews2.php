<?php
class ModelCatalogAridiusNews2 extends Model {

	public function updateViewed($aridius_news_id2) { 
	
		$this->db->query("UPDATE " . DB_PREFIX . "aridius_news2 SET viewed = (viewed + 1) WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");
	}

	public function getaridius_newsStory($aridius_news_id2) {
		
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "aridius_news2 n LEFT JOIN " . DB_PREFIX . "aridius_news_description2 nd ON (n.aridius_news_id2 = nd.aridius_news_id2) LEFT JOIN " . DB_PREFIX . "aridius_news_to_store2 n2s ON (n.aridius_news_id2 = n2s.aridius_news_id2) WHERE n.aridius_news_id2 = '" . (int)$aridius_news_id2 . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1'");

		return $query->row;
	}

	public function getaridius_news($data) {
		
		$sql = "SELECT * FROM " . DB_PREFIX . "aridius_news2 n LEFT JOIN " . DB_PREFIX . "aridius_news_description2 nd ON (n.aridius_news_id2 = nd.aridius_news_id2) LEFT JOIN " . DB_PREFIX . "aridius_news_to_store2 n2s ON (n.aridius_news_id2 = n2s.aridius_news_id2) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1' ORDER BY n.sort_order, n.aridius_news_id2 DESC";
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
		
	}
	public function getaridius_newsShort($limit) {
		
		$aridius_news_data = $this->cache->get('aridius_news2.short.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$limit);

		if (!$aridius_news_data) {
			$aridius_news_data = array();

			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "aridius_news2 n LEFT JOIN " . DB_PREFIX . "aridius_news_description2 nd ON (n.aridius_news_id2 = nd.aridius_news_id2) LEFT JOIN " . DB_PREFIX . "aridius_news_to_store2 n2s ON (n.aridius_news_id2 = n2s.aridius_news_id2) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1'  ORDER BY n.sort_order, n.aridius_news_id2 DESC LIMIT " . (int)$limit);

			foreach ($query->rows as $result) {
				$aridius_news_data[$result['aridius_news_id2']] = $this->getaridius_newsStory($result['aridius_news_id2']);
			}

			$this->cache->set('aridius_news2.short.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$limit, $aridius_news_data);
		}

		return $aridius_news_data;
	}
	
	public function getProductRelated($aridius_news_id2) {
		
		$product_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "aridius_news_product_related2 nr LEFT JOIN " . DB_PREFIX . "aridius_news2 n ON (nr.aridius_news_id2 = n.aridius_news_id2) LEFT JOIN " .          DB_PREFIX . "product_to_store p2s ON (nr.product_id = p2s.product_id) WHERE nr.aridius_news_id2 = '" . (int)$aridius_news_id2 . "' AND n.status = '1' AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		$this->load->model('catalog/product');
		foreach ($query->rows as $result) { 
			$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
		}
		
		return $product_data;
	}	

	public function getaridius_newsRelated($aridius_news_id2) {

		$aridius_news_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "aridius_news2 n LEFT JOIN " . DB_PREFIX . "aridius_news_description2 nd ON (n.aridius_news_id2 = nd.aridius_news_id2) LEFT JOIN " . DB_PREFIX . "aridius_news_to_store2 n2s ON (n.aridius_news_id2 = n2s.aridius_news_id2) LEFT JOIN " . DB_PREFIX . "aridius_news_related2 nr ON (n.aridius_news_id2 = nr.related_aridius_news_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1' AND n.sort_order <> '-1' AND nr.aridius_news_id2 = '" . (int)$aridius_news_id2. "' ORDER BY n.sort_order");			

		return $query->rows;
	}	

	public function getTotalaridius_news() {
		
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "aridius_news2 n LEFT JOIN " . DB_PREFIX . "aridius_news_to_store2 n2s ON (n.aridius_news_id2 = n2s.aridius_news_id2) WHERE n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1'");

		if ($query->row) {
			return $query->row['total'];
		} else {
			return false;
		}
	}
}
