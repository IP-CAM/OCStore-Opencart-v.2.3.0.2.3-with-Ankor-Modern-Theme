<?php

class ModelCatalogPrides extends Model {
	protected $tableName = 'artprides';
	protected $limitTitle = 80;

	public function totalCount(){
		return R::count($this->tableName);
	}

	public function find($data = []) {
		$start = 0;
		$limit = 20;

		if (isset($data['start']) && $data['start']>0) {
			$start = (int)$data['start'];
		}
		if (isset($data['limit']) && $data['limit'] > 1) {
			$limit = (int)$data['limit'];
		}

		$order = 'sort desc, id desc';
		$prides  = R::find($this->tableName,
			'status = :status ORDER BY ' . $order . ' LIMIT :start,:count',
			[
				':start' => $start,
				':count' => $limit,
				':status' => 1,
			]
		);
		$results = R::beansToArray($prides);
		foreach ($results as &$result) {
			$result['title'] = $this->getDescWithLimit($result['title']);
		}
		return $results;
	}

	public function findOne($id) {
		$pride = R::findOne($this->tableName,'id = ?',[$id]);
		$result =  $pride->export();
		foreach ($pride->xownPridemoreimageList as $item) {
			$result['more_images'][] = $item->export();
		}

		return $result;
	}

	public function getListForMain($count = 5){
		$prides  = R::find($this->tableName,
			'status = :status and show_on_main = :show ORDER BY sort Desc,id DESC LIMIT :count',
			[
				':count' => $count,
				':status' => 1,
				':show' => 1,
			]
		);
		$results = R::beansToArray($prides);
		foreach ($results as &$result) {
			$result['title'] = $this->getDescWithLimit($result['title']);
		}
		return $results;
	}

	protected function getDescWithLimit($str) {
		if (utf8_strlen($str) <= ($this->limitTitle - 3)) {
			return $str;
		}
		$res = utf8_substr($str,0, $this->limitTitle) . '...';
		return $res;
	}
}
?>
