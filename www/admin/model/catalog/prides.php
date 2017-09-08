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

	public function edit($id,$data) {
        $pride = R::findOne($this->tableName,'id = ?',[$id]);
        foreach ($data as $key => $value) {
            $pride->$key = $value;
        }
        R::store($pride);
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
		return R::beansToArray($prides);
	}

    public function totalCount(){
        return R::count($this->tableName);
	}

    public function getColumns() {
        return array_keys(R::getColumns($this->tableName));
	}
}
?>