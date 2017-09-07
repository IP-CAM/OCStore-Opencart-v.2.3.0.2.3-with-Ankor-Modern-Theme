<?php
class ModelCatalogAridiusNews2 extends Model {

	public function addaridius_news($data) {
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "aridius_news2 SET status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = '" . $this->db->escape($data['date_added']) . "' ");

		$aridius_news_id2 = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "aridius_news2 SET image = '" . $this->db->escape($data['image']) . "' WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");
		}
		if (isset($data['video'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "aridius_news2 SET video = '" . $this->db->escape($data['video']) . "' WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");
		}
		foreach ($data['aridius_news_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "aridius_news_description2 SET aridius_news_id2 = '" . (int)$aridius_news_id2 . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		if (isset($data['aridius_news_store'])) {
			foreach ($data['aridius_news_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "aridius_news_to_store2 SET aridius_news_id2 = '" . (int)$aridius_news_id2 . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
        if (isset($data['aridius_news_related2'])) {
			foreach ($data['aridius_news_related2'] as $related_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "aridius_news_product_related2 SET aridius_news_id2 = '" . (int)$aridius_news_id2 . "', product_id = '" . (int)$related_id . "'");
			}
        }
		
        if (isset($data['aridius_news_aridius_newsrelated'])) {
			foreach ($data['aridius_news_aridius_newsrelated'] as $related_aridius_news_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "aridius_news_related2 SET aridius_news_id2 = '" . (int)$aridius_news_id2 . "', related_aridius_news_id = '" . (int)$related_aridius_news_id . "'");
			}
        }	

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'aridius_news_id2=" . (int)$aridius_news_id2 . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('aridius_news2');
     	}
	
	public function editaridius_news($aridius_news_id2, $data) {
		
		$this->db->query("UPDATE " . DB_PREFIX . "aridius_news2 SET sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_added = '" . $this->db->escape($data['date_added']) . "' WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "aridius_news2 SET image = '" . $this->db->escape($data['image']) . "' WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");
		}
		if (isset($data['video'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "aridius_news2 SET video = '" . $this->db->escape($data['video']) . "' WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");
		}
		$this->db->query("DELETE FROM " . DB_PREFIX . "aridius_news_description2 WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");

		foreach ($data['aridius_news_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "aridius_news_description2 SET aridius_news_id2 = '" . (int)$aridius_news_id2 . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "aridius_news_to_store2 WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");

		if (isset($data['aridius_news_store'])) {
			foreach ($data['aridius_news_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "aridius_news_to_store2 SET aridius_news_id2 = '" . (int)$aridius_news_id2 . "', store_id = '" . (int)$store_id . "'");
			}
		}

        $this->db->query("DELETE FROM " . DB_PREFIX . "aridius_news_product_related2 WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");
		if (isset($data['aridius_news_related2'])) {
			foreach ($data['aridius_news_related2'] as $related_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "aridius_news_product_related2 SET aridius_news_id2 = '" . (int)$aridius_news_id2 . "', product_id = '" . (int)$related_id . "'");
			}
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "aridius_news_related2 WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");
		if (isset($data['aridius_news_aridius_newsrelated'])) {
			foreach ($data['aridius_news_aridius_newsrelated'] as $related_aridius_news_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "aridius_news_related2 SET aridius_news_id2 = '" . (int)$aridius_news_id2 . "', related_aridius_news_id = '" . (int)$related_aridius_news_id . "'");
			}
        }		

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'aridius_news_id2=" . (int)$aridius_news_id2 . "'");

		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'aridius_news_id2=" . (int)$aridius_news_id2 . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('aridius_news2');
	    }
	public function deletearidius_news($aridius_news_id2) {
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "aridius_news2 WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "aridius_news_description2 WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "aridius_news_to_store2 WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'aridius_news_id2=" . (int)$aridius_news_id2 . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "aridius_news_product_related2 WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "aridius_news_related2 WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");		

		$this->cache->delete('aridius_news2');
	}
	
	public function resetViews($aridius_news_id2) {
		
		$this->db->query("UPDATE " . DB_PREFIX . "aridius_news2 SET viewed = '0' WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");

		$this->cache->delete('aridius_news2');
	}

	public function getaridius_newsStory($aridius_news_id2) {
		
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'aridius_news_id2=" . (int)$aridius_news_id2 . "') AS keyword FROM " . DB_PREFIX . "aridius_news2 n LEFT JOIN " . DB_PREFIX . "aridius_news_description2 nd ON (n.aridius_news_id2 = nd.aridius_news_id2) WHERE n.aridius_news_id2 = '" . (int)$aridius_news_id2 . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getaridius_news($data = array()) {
		
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "aridius_news2 n LEFT JOIN " . DB_PREFIX . "aridius_news_description2 nd ON (n.aridius_news_id2 = nd.aridius_news_id2) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND LOWER(nd.title) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}
			$sort_data = array(
				'nd.title',
				'n.date_added',
				'n.viewed',
				'n.sort_order',
				'n.status'
			);
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY nd.title";
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}

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

		} else {
			$aridius_news_data = $this->cache->get('aridius_news2.' . (int)$this->config->get('config_language_id'));

			if (!$aridius_news_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "aridius_news2 n LEFT JOIN " . DB_PREFIX . "aridius_news_description2 nd ON (n.aridius_news_id2 = nd.aridius_news_id2) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY nd.title");

				$aridius_news_data = $query->rows;

				$this->cache->set('aridius_news2.' . (int)$this->config->get('config_language_id'), $aridius_news_data);
			}

			return $aridius_news_data;
		}
	}

	public function getaridius_newsDescriptions($aridius_news_id2) {
		
		$aridius_news_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "aridius_news_description2 WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");

		foreach ($query->rows as $result) {
			$aridius_news_description_data[$result['language_id']] = array(
				'title'              => $result['title'],
				'meta_description' 	 => $result['meta_description'],
				'meta_title' 	     => $result['meta_title'],
				'meta_keyword'    	 => $result['meta_keyword'],
				'description'      	 => $result['description']
			);
		}

		return $aridius_news_description_data;
	}
	
    public function getaridius_newsRelated($aridius_news_id2) {
		
		$aridius_news_related_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "aridius_news_product_related2 WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");
		
		foreach ($query->rows as $result) {
			$aridius_news_related_data[] = $result['product_id'];
		}
		
		return $aridius_news_related_data;
    }		
	
    public function getaridius_newsaridius_newsrelated($aridius_news_id2) {
		
		$aridius_news_aridius_newsrelated_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "aridius_news_related2 WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");
		
		foreach ($query->rows as $result) {
			$aridius_news_aridius_newsrelated_data[] = $result['related_aridius_news_id'];
		}
		
		return $aridius_news_aridius_newsrelated_data;
     }	

	public function getaridius_newsStores($aridius_news_id2) {
		
		$aridius_newspage_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "aridius_news_to_store2 WHERE aridius_news_id2 = '" . (int)$aridius_news_id2 . "'");

		foreach ($query->rows as $result) {
			$aridius_newspage_store_data[] = $result['store_id'];
		}

		return $aridius_newspage_store_data;
	}

	public function getTotalaridius_news() {
		
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "aridius_news2");

		return $query->row['total'];
	}
}
