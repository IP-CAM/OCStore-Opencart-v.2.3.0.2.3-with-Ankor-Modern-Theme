<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
<div class="container-fluid">
<div class="pull-right">
<a href="<?php echo $aridius_news2; ?>" data-toggle="tooltip" title="<?php echo $button_news; ?>" class="btn btn-primary"><i class="fa fa-plus"></i> <?php echo $button_news; ?></a>
<a href="<?php echo $aridius_news_reviews; ?>" data-toggle="tooltip" title="<?php echo $button_news_reviews; ?>" class="btn btn-primary"><i class="fa fa-comment-o"></i> <?php echo $button_news_reviews; ?></a>
<a onclick="apply()" class="btn btn-primary" data-toggle="tooltip" title="<?php echo $button_apply; ?>" ><i class="fa fa-check"></i></a>
<button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
</div>  
<div class="panel-body">   
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" name="aridius_newsform" class="form-horizontal">
<div class="form-group required">
<label class="col-sm-2 control-label" for="input-headline"><?php echo $entry_home_limit; ?></label>
<div class="col-sm-10">
<input type="text" name="aridius_news2_home_limit" value="<?php echo $aridius_news2_home_limit; ?>" id="input-headline" class="form-control" />
<?php if ($error_home_limit) { ?>
	<div class="text-danger"><?php echo $error_home_limit; ?></div>
	<?php } ?>
</div>
</div>	
<div class="form-group required">
<label class="col-sm-2 control-label" for="input-headline"><?php echo $entry_home_chars; ?></label>
<div class="col-sm-10">
<input type="text" name="aridius_news2_home_chars" value="<?php echo $aridius_news2_home_chars; ?>" id="input-headline" class="form-control" />
<?php if ($error_home_numchars) { ?>
	<div class="text-danger"><?php echo $error_home_numchars; ?></div>
	<?php } ?>
</div>
</div>	
<div class="form-group required">
<label class="col-sm-2 control-label" for="input-headline"><?php echo $entry_headline_chars; ?></label>
<div class="col-sm-10">
<input type="text" name="aridius_news2_headline_chars" value="<?php echo $aridius_news2_headline_chars; ?>" id="input-headline" class="form-control" />
<?php if ($error_headline_chars) { ?>
	<div class="text-danger"><?php echo $error_headline_chars; ?></div>
	<?php } ?>
</div>
</div>		
<div class="form-group">
<label class="col-sm-2 control-label" ><?php echo $entry_newspage_addthis; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridius_news2_aridius_newspage_addthis) { ?>
	<input type="radio" name="aridius_news2_aridius_newspage_addthis" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_aridius_newspage_addthis" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridius_news2_aridius_newspage_addthis) { ?>
	<input type="radio" name="aridius_news2_aridius_newspage_addthis" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_aridius_newspage_addthis" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>	
<div class="form-group">
<label class="col-sm-2 control-label" ><?php echo $entry_news_show_date; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridius_news2_show_date) { ?>
	<input type="radio" name="aridius_news2_show_date" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_show_date" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridius_news2_show_date) { ?>
	<input type="radio" name="aridius_news2_show_date" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_show_date" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>		
<div class="form-group">
<label class="col-sm-2 control-label" ><?php echo $entry_news_show_img; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridius_news2_show_img) { ?>
	<input type="radio" name="aridius_news2_show_img" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_show_img" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridius_news2_show_img) { ?>
	<input type="radio" name="aridius_news2_show_img" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_show_img" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>			
<div class="form-group">
<label class="col-sm-2 control-label" ><?php echo $entry_news_show_description; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridius_news2_show_description) { ?>
	<input type="radio" name="aridius_news2_show_description" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_show_description" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridius_news2_show_description) { ?>
	<input type="radio" name="aridius_news2_show_description" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_show_description" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>			
<div class="form-group required">
<label class="col-sm-2 control-label" for="input-width"><?php echo $entry_newspage_thumb; ?></label>
<div class="col-sm-10">
<div class="row">
<div class="col-sm-6">
<input type="text" name="aridius_news2_thumb_width" value="<?php echo $aridius_news2_thumb_width; ?>" id="input-width-thumb" class="form-control" />
</div>
<div class="col-sm-6">
<input type="text" name="aridius_news2_thumb_height" value="<?php echo $aridius_news2_thumb_height; ?>" class="form-control" />
</div>
</div>
<?php if ($error_aridius_newspage_thumb) { ?>
	<div class="text-danger"><?php echo $error_aridius_newspage_thumb; ?></div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-footerback"><?php echo $text_footerback;?></label>
<div class="col-sm-10"><a href="" id="thumb-footerback" data-toggle="image" class="img-thumbnail"><img src="<?php echo $aridius_news2_footerback; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
<input type="hidden" name="aridius_news2_footer_back" value="<?php echo $aridius_news2_footer_back; ?>" id="input-footerback" />
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
<div class="col-sm-10">
<select name="aridius_news2_status" id="input-status" class="form-control">
<?php if ($aridius_news2_status) { ?>
	<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	<option value="0"><?php echo $text_disabled; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_enabled; ?></option>
	<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	<?php } ?>
</select>
</div>
</div>
<legend><?php echo $text_comment; ?></legend>
<div class="form-group">
<label class="col-sm-2 control-label" ><?php echo $entry_review_guest; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridius_news2_review_guest) { ?>
	<input type="radio" name="aridius_news2_review_guest" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_review_guest" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridius_news2_review_guest) { ?>
	<input type="radio" name="aridius_news2_review_guest" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_review_guest" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" ><?php echo $entry_status_review; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridius_news2_status_review) { ?>
	<input type="radio" name="aridius_news2_status_review" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_status_review" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridius_news2_status_review) { ?>
	<input type="radio" name="aridius_news2_status_review" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_status_review" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" ><?php echo $entry_answer_button; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridius_news2_display_answer_button) { ?>
	<input type="radio" name="aridius_news2_display_answer_button" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_display_answer_button" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridius_news2_display_answer_button) { ?>
	<input type="radio" name="aridius_news2_display_answer_button" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_display_answer_button" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" ><?php echo $entry_captcha; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridius_news2_display_captcha) { ?>
	<input type="radio" name="aridius_news2_display_captcha" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_display_captcha" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridius_news2_display_captcha) { ?>
	<input type="radio" name="aridius_news2_display_captcha" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_display_captcha" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" ><?php echo $entry_limite_page; ?></label>
<div class="col-sm-10">
<input type="text" name="aridius_news2_limite_page" value="<?php echo $aridius_news2_limite_page; ?>" id="input-entry_limite_page" class="form-control" />
<?php if ($error_limite_page) { ?>
	<div class="text-danger"><?php echo $error_limite_page; ?></div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" ><?php echo $entry_mail; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridius_news2_mail) { ?>
	<input type="radio" name="aridius_news2_mail" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_mail" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridius_news2_mail) { ?>
	<input type="radio" name="aridius_news2_mail" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_news2_mail" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
</form>
</div>  
</div> 
</div>
</div>
<script type="text/javascript"><!--
function apply() {
	$('#form').append('<input type="hidden" id="apply" name="apply" value="1" />');
	$('#form').submit();
}
//--></script>
<?php echo $footer; ?>