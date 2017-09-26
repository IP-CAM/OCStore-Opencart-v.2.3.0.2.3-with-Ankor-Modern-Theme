<?php use app\libs\Form;

echo $header; ?><?php echo $column_left;
/**
 * @var \app\models\Certificate $item
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
					<h3 class="panel-title"><i class="fa fa-pencil"></i>Сертификат</h3>
				</div>
				<div class="panel-body">
					<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-news" class="form-horizontal">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo 'Основные'; ?></a></li>
							<li class=""><a href="#tab-files" data-toggle="tab"><?php echo 'Картинки'; ?></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab-general">

								<div class="form-group">
									<?=Form::label('Название','title',['class'=>'col-sm-2 control-label']);?>
									<div class="col-sm-10">
										<?=Form::text('title',$item->title,['class'=>'form-control'])?>
									</div>
								</div>

								<div class="form-group">
									<?=Form::label('Сортировка','sort',['class'=>'col-sm-2 control-label']);?>
									<div class="col-sm-10">
										<?=Form::text('sort',$item->sort,['class'=>'form-control'])?>
									</div>
								</div>

								<div class="form-group">
									<?=Form::label('Статус','status',['class'=>'col-sm-2 control-label']);?>
									<div class="col-sm-4">
										<?=Form::select('status',
											\app\models\Documents::getLabelsStatus(), $item->status,
											['class' => 'form-control']
										)?>
									</div>
								</div>

								<div class="form-group">
									<?=Form::label('Мета заголовок','metaTitle',['class'=>'col-sm-2 control-label']);?>
									<div class="col-sm-10">
										<?=Form::text('metaTitle',$item->metaTitle,['class'=>'form-control'])?>
									</div>
								</div>

								<div class="form-group">
									<?=Form::label('Мета описание','metaDescription',['class'=>'col-sm-2 control-label']);?>
									<div class="col-sm-10">
										<?=Form::text('metaDescription',$item->metaDescription,['class'=>'form-control'])?>
									</div>
								</div>

							</div>
							<div class="tab-pane" id="tab-files">
								<div class="form-group">
									<label class="col-sm-2 control-label">
										Дополнительные изображения
									</label>
									<div class="col-sm-10">
										<div class="row">
											<? $counterMorePhoto = 0;?>
											<? if (isset($more_images)):?>
												<? foreach ($more_images as $more_img):?>
													<div class="col-sm-2">
														<div class="more_image">
															<a href="" id="thumb-image_<?=$counterMorePhoto?>" data-toggle="image" class="img-thumbnail">
																<img src="<?=$more_img['thumb']?>" alt="" title=""
																	 data-placeholder="<?php echo $placeholder; ?>"
																/>
															</a>
															<input type="hidden" name="moreImage[<?=$counterMorePhoto?>]" value="<?php echo $more_img['src']; ?>" id="input-image_<?=$counterMorePhoto?>" />
														</div>
													</div>
													<? $counterMorePhoto += 1;?>
												<?endforeach;?>
											<?endif;?>
											<a href="javascript:void(0)" class="btn btn-default" id="addMorePhoto">Добавить</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
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

	<?php echo $footer; ?>