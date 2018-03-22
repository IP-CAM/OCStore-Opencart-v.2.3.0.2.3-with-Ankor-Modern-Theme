<?php use app\libs\Form;

echo $header; ?><?php echo $column_left;
/**
 * @var \app\models\Documents $item
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
							<li class=""><a href="#tab-files" data-toggle="tab"><?php echo 'Файлы'; ?></a></li>
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
									<?=Form::label('Seo Url','keyword',['class'=>'col-sm-2 control-label']);?>
									<div class="col-sm-10">
										<?=Form::text('keyword',$keyword,['class'=>'form-control'])?>
									</div>
								</div>
								<div class="form-group">
									<?=Form::label('Title','metaTitle',['class'=>'col-sm-2 control-label']);?>
									<div class="col-sm-10">
										<?=Form::text('metaTitle',$item->metaTitle,['class'=>'form-control'])?>
									</div>
								</div>

								<div class="form-group">
									<?=Form::label('Description','metaDescription',['class'=>'col-sm-2 control-label']);?>
									<div class="col-sm-10">
										<?=Form::text('metaDescription',$item->metaDescription,['class'=>'form-control'])?>
									</div>
								</div>

							</div>
							<div class="tab-pane" id="tab-files">

								<div id="blockFiles">
									<table class="table table-bordered table-hover">
										<thead>
										<tr>
											<td class="center"></td>
											<td class="center">Наименование</td>
											<td class="left">Редактировать</td>
										</tr>
										</thead>
										<tbody>
										<? foreach ($item->files as $file):?>
											<?
												$params = [
													'token' => $controller->session->data['token'],
													'id' => $item->id,
													'file_id' => $file['id'],
												];
												$deleteFile   = $controller->url->link('catalog/documents/delete-file', $params, true);
												$downloadFile = $controller->url->link('catalog/documents/get-file',['id'=>$file['id'],'token'=>$params['token']],true);
											?>
											<tr>
												<td></td>
												<td><?=$file['original_filename']?></td>
												<td>
													<a href="<?=$downloadFile?>">Скачать файл</a>
													<a href="<?php echo $deleteFile; ?>"
													   data-toggle="tooltip" title="Удалить"
													   class="btn btn-danger"
													>
														<i class="fa fa-remove"></i>
													</a>
												</td>


											</tr>
										<? endforeach;?>
										</tbody>
									</table>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">Новый файл</div>
									<div class="panel-body">
										<input type="file" name="file_0">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
</div>

	<script>

	</script>

	<?php echo $footer; ?>