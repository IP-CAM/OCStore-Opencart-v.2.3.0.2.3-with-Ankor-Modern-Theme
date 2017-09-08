<?php
class ModelCatalogPrides extends Model {

    protected $tableName = 'artprides';

	public function add($data) {
        $newPride = R::dispense($this->tableName);
        foreach ($data as $key => $value) {
            $newPride->$key = $value;
		}
		R::store($newPride);
	}

	public function editNews($news_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "news SET status = '" . (int)$data['status'] . "' WHERE news_id = '" . (int)$news_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "news SET image = '" . $this->db->escape($data['image']) . "' WHERE news_id = '" . (int)$news_id . "'");
		}
		
		if (isset($data['date_added'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "news SET date_added = '" . $this->db->escape($data['date_added']) . "' WHERE news_id = '" . (int)$news_id . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'");
	
		foreach ($data['news_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_description SET news_id = '" . (int)$news_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "',  meta_h1 = '" . $this->db->escape($value['meta_h1']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}
	
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_store WHERE news_id = '" . (int)$news_id . "'");
	
		if (isset($data['news_store'])) {		
			foreach ($data['news_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_to_store SET news_id = '" . (int)$news_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
	
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$news_id . "'");
	
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_id=" . (int)$news_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
	
		$this->cache->delete('news');
	}

	public function deleteNews($news_id) { 
		$this->db->query("DELETE FROM " . DB_PREFIX . "news WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_store WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$news_id . "'");
	
		$this->cache->delete('news');
	}

	public function find($data = []) {

	    $start = 0;
        $limit = 20;
        if (isset($data['start']) && $data['start']>0) {
            $start = $data['start'];
        }
        if (isset($data['limit']) && $data['limit'] > 1) {
            $limit = $data['limit'];
        }

        $prides  = R::find($this->tableName,
            'ORDER BY id DESC LIMIT :start,:count',
            [
                ':start' => $start,
                ':count' => $limit,
            ]
        );
		return R::beansToArray($prides);
	}

    public function totalCount(){
        return R::count($this->tableName);
	}


	public function getNewsStory($news_id) { 
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$news_id . "') AS keyword FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id) WHERE n.news_id = '" . (int)$news_id . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
	
		return $query->row;
	}

	public function getNewsDescriptions($news_id) { 
		$news_description_data = array();
	
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'");
	
		foreach ($query->rows as $result) {
			$news_description_data[$result['language_id']] = array(
				'title'            	=> $result['title'],
				'description'      	=> $result['description'],
				'meta_title'        => $result['meta_title'],
				'meta_h1'           => $result['meta_h1'],
				'meta_description' 	=> $result['meta_description'],
				'meta_keyword'		=> $result['meta_keyword'],
			);
		}
	
		return $news_description_data;
	}

	public function getNewsStores($news_id) { 
		$newspage_store_data = array();
	
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_to_store WHERE news_id = '" . (int)$news_id . "'");
		
		foreach ($query->rows as $result) {
			$newspage_store_data[] = $result['store_id'];
		}
	
		return $newspage_store_data;
	}

	public function setNewsListUrl($url) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE query = 'information/news'");
		if ($query) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'information/news'");
			$this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` SET `query` = 'information/news', `keyword` = '" . $this->db->escape($url) . "'");
		}else{
			$this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` SET `query` = 'information/news', `keyword` = '" . $this->db->escape($url) . "'");
		}
	}

	public function getNewsListUrl($query) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE query = '" . $this->db->escape($query) . "'");
			if($query->rows){
				return $query->row['keyword'];
			}else{
				return false;
			}
	}
}
?>