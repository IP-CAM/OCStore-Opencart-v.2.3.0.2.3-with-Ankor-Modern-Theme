<?php use app\libs\Form;

echo $header; ?><?php echo $column_left;
/**
 * @var \app\models\CalculatingOrder $item
 */
?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-news" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
				<h1><?php echo $heading_title; ?></h1>
				<ul class="breadcrumb">
					<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
					<?php } ?>
				</ul>
			</div>
		</div>
		<div class="container-fluid">
			<?php if (isset($error_warning) && $error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
			<?php } ?>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-pencil"></i>Запрос обратного звонка </h3>
				</div>
				<div class="panel-body">
					<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-news" class="form-horizontal">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo 'Основные'; ?></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab-general">

								<div class="form-group">
									<?=Form::label('Имя','firstName',['class'=>'col-sm-2 control-label']);?>
									<div class="col-sm-10">
										<?=Form::text('firstName',$item->firstName,['class'=>'form-control'])?>
									</div>
								</div>

								<div class="form-group">
									<?=Form::label('Телефон','phone',['class'=>'col-sm-2 control-label']);?>
									<div class="col-sm-10">
										<?=Form::text('phone',$item->phone,['class'=>'form-control'])?>
									</div>
								</div>

								<div class="form-group">
									<?=Form::label('Ссылка','url',['class'=>'col-sm-2 control-label']);?>
									<div class="col-sm-8">
										<?=Form::text('url',$item->url,['class'=>'form-control'])?>
									</div>
									<div class="col-sm-2">
										<a href="<?=$item->url?>" target="_blank">Перейти</a>
									</div>
								</div>

								<div class="form-group">
									<?=Form::label('Комментарий','comment',['class'=>'col-sm-2 control-label']);?>
									<div class="col-sm-10">
										<?=Form::textArea('comment',$item->comment,['class'=>'form-control'])?>
									</div>
								</div>

								<div class="form-group">
									<?=Form::label('Тип конструкции','typeConstruction',['class'=>'col-sm-2 control-label']);?>
									<div class="col-sm-10">
										<?=Form::text('typeConstruction',$item->typeConstruction,['class'=>'form-control'])?>
									</div>
								</div>

								<div class="form-group">
									<?=Form::label('Размер конструкции','sizeConstruction',['class'=>'col-sm-2 control-label']);?>
									<div class="col-sm-10">
										<?=Form::text('sizeConstruction',$item->sizeConstruction,['class'=>'form-control'])?>
									</div>
								</div>

								<div class="form-group">
									<?=Form::label('Статус','status',['class'=>'col-sm-2 control-label']);?>
									<div class="col-sm-4">
										<?=Form::select('status',
											\app\models\Callback::getLabelsStatus(), $item->status,
											['class' => 'form-control']
										)?>
									</div>
								</div>

							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
		<script type="text/javascript"><!--
		$('.date').datetimepicker({
			pickTime: false
		});
		$('#language a:first').tab('show');
	//-->
			var morePhotoCounter = <?=$counterMorePhoto?>;
			var noImage = "<?=$noImage?>";
			var $elAddMorePhoto = $('#addMorePhoto');
			$elAddMorePhoto.on('click',function (e) {
				morePhotoCounter += 1;
				var html = '<div class="col-sm-2"><div class="more_image">' +
					'<a href="javascript:void(0)" id="thumb-image_' + morePhotoCounter + '" data-toggle="image" class="img-thumbnail">' +
					'<img src="' + noImage + '" alt="" title="" data-placeholder=""/>' +
					'</a>' +
					'<input type="hidden" name="moreImage['  + morePhotoCounter + ']" value="" id="input-image_' + morePhotoCounter + '" />' +
					'</div></div>';
				$elAddMorePhoto.before(html);
			});
		</script>


</div>
	<?php echo $footer; ?>