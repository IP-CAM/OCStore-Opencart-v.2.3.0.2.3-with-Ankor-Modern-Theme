<?
/**
 * @var \app\models\CalculatingOrder[] $items
 */
?>

<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a href="<?php echo $setting; ?>" data-toggle="tooltip" title="<?php echo $button_setting; ?>" class="btn btn-primary"><i class="fa fa-cog"></i>&nbsp;<?php echo $button_setting; ?></a>
                <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-success"><i class="fa fa-plus"></i></a>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-news').submit() : false;"><i class="fa fa-trash-o"></i></button>
            </div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <?php if ($success) { ?>
            <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-news">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                                <td class="center">Имя</td>
                                <td class="center">Телефон</td>
                                <td class="center">Ссылка</td>
                                <td class="left">Статус</td>
                                <td class="left">Редактировать</td>
                            </tr>
                            </thead>
                            <tbody>
                            <?if ($items):?>
                                <?php $class = 'odd'; ?>
                                <?foreach ($items as $item):?>
                                    <tr class="<?php echo $class; ?>">
                                        <!--											//select-->
                                        <td align="center">
<!--                                            --><?php //if ($item['selected']) { ?>
<!--                                                <input type="checkbox" name="selected[]" value="--><?php //echo $item->id; ?><!--" checked="checked" />-->
<!--                                            --><?php //} else { ?>
<!--                                                <input type="checkbox" name="selected[]" value="--><?php //echo $item->id; ?><!--" />-->
<!--                                            --><?php //} ?>
                                        </td>
                                        <?//image?>
                                        <td class="center">
                                            <?=$item->firstName?>
                                        </td>
                                        <!--											title-->
                                        <td class="left">
                                            <?=$item->phone?>
                                        </td>
                                        <td class="left">
                                            <a href="<?=$item->url?>" target="_blank"><?=$item->url?></a>
                                        </td>
                                        <td class="left">
                                            <?=$item->getLabelStatus()?>
                                        </td>

                                        <? $edit = $controller->url->link('catalog/calculating_order/edit', 'token=' . $controller->session->data['token'] . '&id=' . $item->id, true)?>
                                        <? $delete = $controller->url->link('catalog/calculating_order/delete', 'token=' . $controller->session->data['token'] . '&id=' . $item->id, true)?>
                                        <td class="text-right">
                                            <a href="<?php echo $edit; ?>"
                                               data-toggle="tooltip" title="<?php echo $button_edit; ?>"
                                               class="btn btn-primary"
                                            >
                                                <i class="fa fa-pencil"></i>
                                            </a>
                                            <a href="<?php echo $delete; ?>"
                                               data-toggle="tooltip" title="Удалить"
                                               class="btn btn-danger"
                                            >
                                                <i class="fa fa-remove"></i>
                                            </a>
                                        </td>
                                    </tr>
                                <?endforeach;?>
                            <?endif;?>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
<!--                    <div class="col-sm-6 text-right">--><?php //echo $results; ?><!--</div>-->
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>