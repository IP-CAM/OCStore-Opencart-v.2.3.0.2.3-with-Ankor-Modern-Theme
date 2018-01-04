<?
use app\libs\Form;

/**
 * @var \Template\PHP $this
 */

?>

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Название магазина','config_art_ymlMarketName',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_art_ymlMarketName',$config_art_ymlMarketName,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Название компания','config_art_ymlcompanyName',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_art_ymlcompanyName',$config_art_ymlcompanyName,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Ссылка на сайт','config_art_ymlUrl',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_art_ymlUrl',$config_art_ymlUrl,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Стоимость доставки','config_art_ymldelivery',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_art_ymldelivery',$config_art_delivery,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->




