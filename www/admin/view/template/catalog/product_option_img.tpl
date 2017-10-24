<?
use app\core\App;
use app\libs\Form;
$counterMorePhoto = 0;
$image = $noImage;
$sort = 0;
$htmlBlock = <<<HTML
 <div class="row">
    <div class="col-sm-3">
                <a href="" id="thumb-image_0" data-toggle="image" class="img-thumbnail">
                    <img src="$image" alt="" title=""
                         data-placeholder="$placeholder"
                    />
                </a>
                <input type="hidden"
                       name="moreImage[$optionId][$optionValueId][]['src']"
                       value=""
                />
            </div>
            <div class="col-sm-6">
                <input type="text"
                       name="moreImage[$optionId][$optionValueId][]['sort']"
                       class="form-control"
                       value=""
                       placeholder="Сортировка"
                />
            </div>
</div>
<hr>
HTML;
?>
<div class="modal-content">
    <div class="modal-header"><button class="close" type="button" data-dismiss="modal">×</button>
        <h4 class="modal-title">Картинки товаров</h4>
    </div>
    <div class="modal-body">
        <?
        foreach ($optionImages as $item) {
            $image = $item['src'];
            $imageThumb = $item['thumb'];
            $sort = $item['sort'];
            $htmlBlock = <<<HTML
 <div class="row">
    <div class="col-sm-3">
                <a href="" id="thumb-image_{$optionId}_{$optionValueId}_{$counterMorePhoto}" data-toggle="image" class="img-thumbnail">
                    <img src="$imageThumb" alt="" title=""
                         data-placeholder="$placeholder"
                    />
                </a>
                <input type="hidden"
                       name="moreImageOption[$optionId][$optionValueId][$counterMorePhoto][src]"
                       value="$image"
                       id="input-image_{$optionId}_{$optionValueId}_{$counterMorePhoto}"
                />
            </div>
            <div class="col-sm-6">
                <input type="text"
                       name="moreImageOption[$optionId][$optionValueId][$counterMorePhoto][sort]"
                       class="form-control"
                       value="$sort"
                       placeholder="Сортировка"
                />
            </div>
</div>
<hr>
HTML;
            echo $htmlBlock;
            $counterMorePhoto++;
        }
        ?>
        <a href="javascript:void(0)" class="btn btn-default addOptionMorePhoto"
           data-noImage="<?=$noImage?>"
           data-optionId="<?=$optionId?>"
           data-placeholder="<?=$placeholder?>"
           data-optionValueId="<?=$optionValueId?>"
           data-counterMorePhoto="<?=$counterMorePhoto?>"
        >
            Добавить
        </a>
    </div>
    <div class="modal-footer"><button class="btn btn-default" type="button" data-dismiss="modal">Закрыть</button></div>

</div>

