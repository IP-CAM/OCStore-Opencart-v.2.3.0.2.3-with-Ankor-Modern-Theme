<?php
use app\core\App;
use app\models\Callback;

/**
 * Class ControllerCatalogPrides
 */
class ControllerCatalogLoadFromExcel extends Controller {
    const NAME_LIST_PRODUCTS = 'Export Products Sheet';
    const NAME_LIST_GROUPS = 'Export Groups Sheet';
	private $error = array();

	public function index() {
        $data = $this->readFile(DIR_UPLOAD . '/1.xlsx');

	}

	protected function readFile($excelFile) {

        $objReader = PHPExcel_IOFactory::createReader('Excel2007');
        $objPHPExcel = $objReader->load($excelFile);
        $arrayData = [];
        foreach ($objPHPExcel->getWorksheetIterator() as $worksheet) {
            $title = $worksheet->getTitle();
            $arrayData['products'] = [];
            $arrayData['groups'] = [];
            if ($title == self::NAME_LIST_PRODUCTS) {
                $arrayData['products'] = $worksheet->toArray();
            } elseif ($title == self::NAME_LIST_GROUPS) {
                $arrayData['groups'] = $worksheet->toArray();
            }
        }
        return $arrayData;
    }

}
?>