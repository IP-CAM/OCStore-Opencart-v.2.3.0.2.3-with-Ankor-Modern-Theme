<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div class="col-12"><?php echo $message; ?></div>
  </div>
</div>

<?php $str_footer=strpos($footer, '<div class="footer">'); ?>
<?php $id_footer = substr($footer, $str_footer); ?>
<?php echo $id_footer; ?>