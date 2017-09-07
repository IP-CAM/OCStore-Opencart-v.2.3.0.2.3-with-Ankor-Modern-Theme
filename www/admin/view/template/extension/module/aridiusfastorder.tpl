<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
<div class="container-fluid">
<div class="pull-right">
<a href="<?php echo $aridiusfastorder; ?>" data-toggle="tooltip" title="<?php echo $text_aridiusfastorder; ?>" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a>        
<button type="submit" form="form-fastorder" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>   
<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a> 
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
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
</div>
<div class="panel-body">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-fastorder"
class="form-horizontal">
<div class="form-group">
<div class="col-sm-12">
<ul id="myTab2" class="nav nav-tabs">
<li><a data-toggle="tab" href="#panely1"><?php echo $tab_main; ?></a></li>
<li><a data-toggle="tab" href="#panely2"><?php echo $tab_text; ?></a></li>
</ul>
<div class="tab-content">
<div id="panely1" class="tab-pane fade in active">
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_description; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridiusfastorder_descriptionshow) { ?>
	<input type="radio" name="aridiusfastorder_descriptionshow" value="0"/>
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_descriptionshow" value="0"
	checked="checked"/>
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridiusfastorder_descriptionshow) { ?>
	<input type="radio" name="aridiusfastorder_descriptionshow" value="1"/>
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_descriptionshow" value="1"
	checked="checked"/>
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_adddescription; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridiusfastorder_adddescriptionshow) { ?>
	<input type="radio" name="aridiusfastorder_adddescriptionshow" value="1" checked="checked"/>
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_adddescriptionshow" value="1" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridiusfastorder_adddescriptionshow) { ?>
	<input type="radio" name="aridiusfastorder_adddescriptionshow"  value="0" checked="checked"/>
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_adddescriptionshow" value="0" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_img; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridiusfastorder_img) { ?>
	<input type="radio" name="aridiusfastorder_img" value="0"/>
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_img" value="0"
	checked="checked"/>
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridiusfastorder_img) { ?>
	<input type="radio" name="aridiusfastorder_img" value="1"/>
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_img" value="1"
	checked="checked"/>
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_price; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridiusfastorder_price) { ?>
	<input type="radio" name="aridiusfastorder_price" value="0"/>
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_price" value="0"
	checked="checked"/>
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridiusfastorder_price) { ?>
	<input type="radio" name="aridiusfastorder_price" value="1"/>
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_price" value="1"
	checked="checked"/>
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_quantity; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridiusfastorder_quantity) { ?>
	<input type="radio" name="aridiusfastorder_quantity" value="0"/>
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_quantity" value="0"
	checked="checked"/>
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridiusfastorder_quantity) { ?>
	<input type="radio" name="aridiusfastorder_quantity" value="1"/>
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_quantity" value="1"
	checked="checked"/>
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<hr>
<hr>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_firstnameshow; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridiusfastorder_firstnameshow) { ?>
	<input type="radio" name="aridiusfastorder_firstnameshow" value="0"/>
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_firstnameshow" value="0"
	checked="checked"/>
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridiusfastorder_firstnameshow) { ?>
	<input type="radio" name="aridiusfastorder_firstnameshow" value="1"/>
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_firstnameshow" value="1"
	checked="checked"/>
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_firstnamevalid; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridiusfastorder_firstnamevalid) { ?>
	<input type="radio" name="aridiusfastorder_firstnamevalid" value="0"/>
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_firstnamevalid" value="0"
	checked="checked"/>
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridiusfastorder_firstnamevalid) { ?>
	<input type="radio" name="aridiusfastorder_firstnamevalid" value="1"/>
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_firstnamevalid" value="1"
	checked="checked"/>
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_placeholderfirstname; ?></label>
<div class="col-sm-10">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="aridiusfastorder_placeholderfirstname[<?php echo $language['language_id']; ?>]"
	value="<?php echo $aridiusfastorder_placeholderfirstname[$language['language_id']]; ?>"
	class="form-control"/>
	</div>
	<?php } ?>
</div>
</div>
<hr>
<hr>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_mask; ?></label>
<div class="col-sm-10">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="aridiusfastorder_mask[<?php echo $language['language_id']; ?>]"
	value="<?php echo $aridiusfastorder_mask[$language['language_id']]; ?>"
	class="form-control"/>
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_placeholdertell; ?></label>
<div class="col-sm-10">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="aridiusfastorder_placeholdertell[<?php echo $language['language_id']; ?>]"
	value="<?php echo $aridiusfastorder_placeholdertell[$language['language_id']]; ?>"
	class="form-control"/>
	</div>
	<?php } ?>
</div>
</div>
<hr>
<hr>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_emailshow; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridiusfastorder_emailshow) { ?>
	<input type="radio" name="aridiusfastorder_emailshow" value="0"/>
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_emailshow" value="0"
	checked="checked"/>
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridiusfastorder_emailshow) { ?>
	<input type="radio" name="aridiusfastorder_emailshow" value="1"/>
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_emailshow" value="1"
	checked="checked"/>
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_emailvalid; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridiusfastorder_emailvalid) { ?>
	<input type="radio" name="aridiusfastorder_emailvalid" value="0"/>
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_emailvalid" value="0"
	checked="checked"/>
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridiusfastorder_emailvalid) { ?>
	<input type="radio" name="aridiusfastorder_emailvalid" value="1"/>
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_emailvalid" value="1"
	checked="checked"/>
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_placeholderemail; ?></label>
<div class="col-sm-10">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="aridiusfastorder_placeholderemail[<?php echo $language['language_id']; ?>]"
	value="<?php echo $aridiusfastorder_placeholderemail[$language['language_id']]; ?>"
	class="form-control"/>
	</div>
	<?php } ?>
</div>
</div>
<hr>
<hr>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_commentshow; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridiusfastorder_commentshow) { ?>
	<input type="radio" name="aridiusfastorder_commentshow" value="0"/>
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_commentshow" value="0"
	checked="checked"/>
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridiusfastorder_commentshow) { ?>
	<input type="radio" name="aridiusfastorder_commentshow" value="1"/>
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridiusfastorder_commentshow" value="1"
	checked="checked"/>
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_placeholdercomment; ?></label>
<div class="col-sm-10">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="aridiusfastorder_placeholdercomment[<?php echo $language['language_id']; ?>]"
	value="<?php echo $aridiusfastorder_placeholdercomment[$language['language_id']]; ?>"
	class="form-control"/>
	</div>
	<?php } ?>
</div>
</div>
<hr>
<hr>
<div class="form-group">
<label class="col-sm-2 control-label"
for="input-limit"><?php echo $entry_status; ?></label>
<div class="col-sm-10">
<select name="aridiusfastorder_status" class="form-control">
<?php if ($module_status) { ?>
	<option value="1"
	selected="selected"><?php echo $text_enabled; ?></option>
	<option value="0"><?php echo $text_disabled; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_enabled; ?></option>
	<option value="0"
	selected="selected"><?php echo $text_disabled; ?></option>
	<?php } ?>
</select>
</div>
</div>
</div>
<div id="panely2" class="tab-pane fade">
<ul class="nav nav-tabs" id="language">
<?php foreach ($languages as $language) { ?>
	<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
	<?php } ?>
</ul>
<div class="tab-content">
<?php foreach ($languages as $language) { ?>
	<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
	<div class="form-group">
	<label class="col-sm-2 control-label"
	for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
	<div class="col-sm-10">
	<textarea name="aridiusfastorder_description[<?php echo $language['language_id']; ?>]" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($aridiusfastorder_description[$language['language_id']]) ? $aridiusfastorder_description[$language['language_id']] : ''; ?></textarea>
	</div>
	</div>
	<div class="form-group">
	<label class="col-sm-2 control-label"
	for="input-description2<?php echo $language['language_id']; ?>"><?php echo $entry_description2; ?></label>
	<div class="col-sm-10">
	<textarea name="aridiusfastorder_description2[<?php echo $language['language_id']; ?>]" id="input-description2<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($aridiusfastorder_description2[$language['language_id']]) ? $aridiusfastorder_description2[$language['language_id']] : ''; ?></textarea>
	</div>
	</div>
	</div>
	<?php } ?>
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
<?php if ($ckeditor) { ?>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor_init.js"></script>
<?php } ?>
<script type="text/javascript"><!--
$('#language a:first').tab('show');
$('#option a:first').tab('show');
//--></script>
<script type="text/javascript"><!--
$(document).ready(function(){
	$("#myTab2 li:eq(0) a").tab('show');
});
//--></script>
<?php if (!$ckeditor) { ?>
  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
<?php } ?>
<script type="text/javascript"><!--
        <?php foreach ($languages as $language) { ?>
        <?php if ($ckeditor) { ?>
                ckeditorInit('input-description<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
            <?php } ?>
        <?php } ?>
//--></script>
<script type="text/javascript"><!--
        <?php foreach ($languages as $language) { ?>
        <?php if ($ckeditor) { ?>
                ckeditorInit('input-description2<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
            <?php } ?>
        <?php } ?>
//--></script>
<?php echo $footer; ?>