<?
use app\libs\Form;

/**
 * @var \Template\PHP $this
 */

?>
<div class="form-group">
    <?=Form::label('Количество слов,которые берутся из названия товара/услуги','',['class'=>'col-sm-6 control-label']);?>
</div>
<!-- Начало группы для input -->
<div class="form-group">
    <?=Form::label('Количество слов для тайтл (товар)','config_meta_words_title_prod_count',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_meta_words_title_prod_count',$config_meta_words_title_prod_count,['class'=>'form-control'])?>
    </div>
</div>
<!-- Конец группы для input -->
<!-- Начало группы для input -->
<div class="form-group">
    <?=Form::label('Количество слов для тайтл (услуга)','config_meta_words_title_serv_count',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_meta_words_title_serv_count',$config_meta_words_title_serv_count,['class'=>'form-control'])?>
    </div>
</div>
<!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Количество слов для description (товар)','config_meta_words_desc_prod_count',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_meta_words_desc_prod_count',$config_meta_words_desc_prod_count,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Количество слов для description (услуга)','config_meta_words_desc_serv_count',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_meta_words_desc_serv_count',$config_meta_words_desc_serv_count,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Слова исключаемые из подсчета количества(через запятую, без пробелов)','config_meta_words_exception_count',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_meta_words_exception_count',$config_meta_words_exception_count,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Шаблоны текста для title (используемая конструкция для названия {%title%} )','',['class'=>'col-sm-6 control-label']);?>
</div><!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Шаблон текста для title (товары)','config_meta_pattern_title_prod',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_meta_pattern_title_prod',$config_meta_pattern_title_prod,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Шаблон текста для title (услуги)','config_meta_pattern_title_serv',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::text('config_meta_pattern_title_serv',$config_meta_pattern_title_serv,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Шаблоны текста для description (используемая конструкция для названия {%title%} , для цен за единицу измерения {%price%} )','',['class'=>'col-sm-9 control-label']);?>
</div><!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Шаблон текста для description (товары)','config_meta_pattern_desc_prod',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::textArea('config_meta_pattern_desc_prod',$config_meta_pattern_desc_prod,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->

<div class="form-group"><!-- Начало группы для input -->
    <?=Form::label('Шаблон текста для description (услуги)','config_meta_pattern_desc_serv',['class'=>'col-sm-2 control-label']);?>
    <div class="col-sm-10">
        <?=Form::textArea('config_meta_pattern_desc_serv',$config_meta_pattern_desc_serv,['class'=>'form-control'])?>
    </div>
</div><!-- Конец группы для input -->
