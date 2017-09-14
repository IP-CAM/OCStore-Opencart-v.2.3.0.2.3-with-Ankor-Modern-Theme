<?php use app\libs\Form;

echo $header; ?><?php echo $column_left;
$collectTumbler = ['0' => 'Отключено','1' => 'Включено'];
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
			<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
			<?php } ?>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
				</div>
				<div class="panel-body">
					<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-news" class="form-horizontal">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
							<li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab-general">
<!--								title-->
								<div class="form-group required">
									<label class="col-sm-2 control-label" for="input-title">
										<span data-toggle="tooltip" title="">
											Заголовок
										</span>
									</label>
									<div class="col-sm-10">
										<input type="text"
											   name="title"
											   value="<?php echo $title; ?>"
											   placeholder="Заголовок"
											   id="input-title" class="form-control"
										/>
										<?php if ($error_title) { ?>
											<div class="text-danger"><?php echo $error_title; ?></div>
										<?php } ?>
									</div>
								</div>

								<div class="form-group">
									<?=Form::label('Показывать на главной','show_on_main',['class'=>'col-sm-2 control-label']);?>
									<div class="col-sm-4">
										<?=Form::select('show_on_main',
											$collectTumbler, $show_on_main,
											['class' => 'form-control']
										)?>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-sort">
										<span>
											Сортировка
										</span>
									</label>
									<div class="col-sm-4">
										<input type="text"
											   name="sort"
											   value="<?php echo $sort; ?>"
											   placeholder="0"
											   id="input-sort" class="form-control"
										/>
									</div>
								</div>


								<div class="form-group required">
									<label class="col-sm-2 control-label" for="input-description">
										<?php echo $entry_description; ?>
									</label>
									<div class="col-sm-10">
										<textarea name="description"
												  placeholder="<?php echo $entry_description; ?>"
												  id="input-description"
												  class="form-control summernote">
											<?php echo isset($description) ? $description : ''; ?>
										</textarea>
										<?php if (isset($error_description)) { ?>
											<div class="text-danger"><?php echo $error_description; ?></div>
										<?php } ?>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-meta-title">
										<span>
											Заголовок H1
										</span>
									</label>
									<div class="col-sm-10">
										<input type="text"
											   name="meta_title"
											   value="<?php echo $meta_title; ?>"
											   placeholder=""
											   id="input-meta-title" class="form-control"
										/>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-meta-title">
										<span>
											Мета описание
										</span>
									</label>
									<div class="col-sm-10">
										<input type="text"
											   name="meta_description"
											   value="<?php echo $meta_description; ?>"
											   placeholder=""
											   id="input-meta-title" class="form-control"
										/>
									</div>
								</div>

							</div>

							<div class="tab-pane" id="tab-data">
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
									<div class="col-sm-10">
										<a href="" id="thumb-image" data-toggle="image" class="img-thumbnail">
											<img src="<?php echo $thumb; ?>" alt="" title=""
												 data-placeholder="<?php echo $placeholder; ?>"
											/>
										</a>
									<input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
									</div>
								</div>

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

								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
									<div class="col-sm-10">
										<select name="status" id="input-status" class="form-control">
											<?php if ($status) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
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