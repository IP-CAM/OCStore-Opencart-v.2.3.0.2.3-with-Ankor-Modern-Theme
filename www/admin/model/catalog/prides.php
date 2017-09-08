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
        return $pride;
	}

	public function findOne($id) {
        $pride[] = R::findOne($this->tableName,'id = ?',[$id]);
        $result =  R::beansToArray($pride);
        return $result[0];
    }

	public function delete($id) {
        $pride = R::findOne($this->tableName,'id = ?',[$id]);
        R::trash($pride);
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
        $results = R::beansToArray($prides);
        foreach ($results as &$result) {
            $result['more_image'] = [
                'src' => 'catalog/category/ Monitors, TVs/sony_kd55xd8005br2_1.jpg'
            ];
        }
		return $results;
	}

    public function totalCount(){
        return R::count($this->tableName);
	}

    public function getColumns() {
        return array_keys(R::getColumns($this->tableName));
	}

    public function saveMoreImages($pride, $moreImages){
        foreach ($moreImages as $moreImage) {
            $image = R::dispense($this->tableName . 'images');
            $image->src = $moreImage;
            $pride->ownMoreImages[] = $image;
        }
        return $pride;
	}

}

?>