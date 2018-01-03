<?
use app\libs\Form;

/**
 * @var \Template\PHP $this
 */

?>

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Название магазина','config_yandex_market_name',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_yandex_market_name',$config_yandex_market_name,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Название компания','config_yandex_company_name',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_yandex_company_name',$config_yandex_company_name,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Ссылка на сайт','config_yandex_url',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_yandex_url',$config_yandex_url,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Стоимость доставки','config_yandex_delivery',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_yandex_delivery',$config_yandex_delivery,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->




