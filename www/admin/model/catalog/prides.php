<?php
class ModelCatalogPrides extends Model {

    protected $tableName = 'artprides';

	public function add($data) {
        $newPride = R::dispense($this->tableName);
        $newPride = $this->setDataPride($newPride, $data);
		R::store($newPride);
	}

	public function edit($id,$data) {
        $pride = R::findOne($this->tableName,'id = ?',[$id]);
        $pride = $this->setDataPride($pride, $data);
        R::store($pride);
	}

    public function setDataPride($pride, $data){
        $columns = $this->getColumns();
        foreach ($data as $key => $value) {
            if (in_array($key,$columns)) {
                $pride->$key = $value;
            }
        }
        $pride->ownPridemoreimageList = array();
        if (isset($data['moreImage'])) {
            foreach ($data['moreImage'] as $imgSrc) {
                if (empty($imgSrc)) {
                    continue;
                }
                $image = R::dispense('pridemoreimage');
                $image->src = $imgSrc;
                $pride->xownPridemoreimageList[] = $image;
            }
        }
        return $pride;
	}

	public function findOne($id) {
        $pride = R::findOne($this->tableName,'id = ?',[$id]);
        $result =  $pride->export();
        foreach ($pride->xownPridemoreimageList as $item) {
            $result['more_images'][] = $item->export();
        }
        return $result;
    }

	public function delete($id) {
        $pride = R::findOne($this->tableName,'id = ?',[$id]);
        R::trash($pride);
	}

	public function find($data = []) {

	    $start = 0;
        $limit = 100;
        if (isset($data['start']) && $data['start']>0) {
            $start = $data['start'];
        }
        if (isset($data['limit']) && $data['limit'] > 1) {
            $limit = $data['limit'];
        }

        $prides  = R::find($this->tableName,
            'ORDER BY sort DESC,id DESC LIMIT :start,:count',
            [
                ':start' => $start,
                ':count' => $limit,
            ]
        );
        $results = R::beansToArray($prides);
		return $results;
	}

    public function totalCount(){
        return R::count($this->tableName);
	}

    public function getColumns() {
        return array_keys(R::getColumns($this->tableName));
	}

}

?>