<a
    <?php if ($link_top[$language_id]) { ?>
        href="<?php echo $link_top[$language_id]; ?>"
    <?php } ?>
    title="<?php echo $title[$language_id]; ?>"
    data-hover="dropdown"
    class="dropdown-toggle"

>
    <?php if ($faicons_top) { ?>
        <i class="<?php echo $faicons_top; ?> hidden-lg hidden-md"></i>
    <?php } ?>
    <?php if ($title) { ?>
        <span class=""> <?php echo $title[$language_id]; ?></span>
    <?php } ?>
    <i class="fa fa-angle-down"></i>
</a>
<div class="dropdownDocs dropdown-menu">
        <ul class="list-group">
                <?foreach ($dataDoc['items'] as $item):?>
                        <li class="list-group-item">
                                <a href="<?=$item['link']?>"><?=$item['title']?></a>
                        </li>
                <?endforeach;?>
        </ul>
</div>
