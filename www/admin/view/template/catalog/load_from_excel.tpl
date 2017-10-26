<?

use app\libs\Form;

?>

<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">

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
                <h3 class="panel-title"><i class="fa fa-pencil"></i><?=$title?></h3>
            </div>
            <div class="panel-body">
                <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                    <div class="form-group">
                        <?=Form::label("Название файла( должен лежать в папке 'system/storage/upload')",'nameFile',['class'=>'col-sm-4 control-label']);?>
                        <div class="col-sm-8">
                            <?=Form::text('nameFile',$nameFile,['class'=>'form-control'])?>
                        </div>
                    </div>
                    <div class="form-group text-center">
                        <?=Form::hidden('do_load_from_excel','y')?>
                        <button type="submit" class="btn btn-primary">Загрузить данные</button>
                        <input type="submit" name="do_image" value="Загрузить только картинки" class="btn btn-danger" >
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>
