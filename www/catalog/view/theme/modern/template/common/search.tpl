
<div id="search" class="input-group">
<div class="categories">
  <div class="select-wrapper">
    <div class="select-arrow-3"></div>
<select name="category_id" class="form-control">
<option value="0"><?php echo $text_search_cat; ?></option>
<?php foreach ($categories as $category_1) { ?>
<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
<?php foreach ($category_1['children'] as $category_2) { ?>
<option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;-&nbsp;<?php echo $category_2['name']; ?></option>
<?php } ?>
<?php } ?>
</select>
</div>
</div>
   <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" class="form-control input-lg" />
  <span class="input-group-btn">
    <button type="button" class="btn btn-default btn-lg"><i class="fa fa-search"></i></button>
  </span>
</div>