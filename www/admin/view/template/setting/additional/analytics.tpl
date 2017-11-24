<?
use app\libs\Form;

/**
 * @var \Template\PHP $this
 */

?>

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Код для яндекс метрики','config_art_analyticsCodeYandex',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::textArea('config_art_analyticsCodeYandex',htmlspecialchars_decode($config_art_analyticsCodeYandex),['class'=>'form-control','rows' => 15])?>
    </div>
</div><!-- Конец группы для input -->
<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Код для гугл аналитики','config_art_analyticsCodeGoogle',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::textArea('config_art_analyticsCodeGoogle',htmlspecialchars_decode($config_art_analyticsCodeGoogle),['class'=>'form-control','rows' => 15])?>
    </div>
</div><!-- Конец группы для input -->





