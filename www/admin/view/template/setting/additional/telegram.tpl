<?
use app\libs\Form;

/**
 * @var \Template\PHP $this
 */

?>

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Токен телеграм','config_art_tokenTelegram',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_art_tokenTelegram',$config_art_tokenTelegram,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Чат для заказов обратной связи','config_art_chatCallBackTg',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_art_chatCallBackTg',$config_art_chatCallBackTg,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Чат для заказов расчета','config_art_chatCalculationOrderTg',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_art_chatCalculationOrderTg',$config_art_chatCalculationOrderTg,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->




