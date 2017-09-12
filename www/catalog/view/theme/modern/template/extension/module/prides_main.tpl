<?
/**
 * @var array $items
 * @var string $linkList
 * @var string $title
 */
?>

<div class="row">
    <div class="col-lg-10 col-lg-offset-1 col-sm-12">
        <div class="prides_main">
            <hr>
            <div class="blockTitle text-center">
                <a href="<?=$linkList?>">
                    <h4><?=$title?></h4>
                </a>
            </div>
            <hr>
            <div class="row">
                <?php foreach ($items as $item) { ?>
                    <div class="product-layoutcat product-grid col-md-3 col-sm-6 col-xs-6 ">
                        <a href="<?php echo $item['href']; ?>" class="linkPride" title="<?php echo $item['title']; ?>">
                            <div class="product-thumb">
                                <div class="image fixnewsgrid">
                                    <img src="<?php echo $item['thumb']; ?>" alt="<?php echo $item['title']; ?>" class="img-responsive" />
                                </div>
                                <div class="list_block">
                                    <div class="caption caption-left">
                                        <p class="text-center"><?php echo $item['title']; ?></p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                <?php } ?>

                <div class="product-layoutcat product-grid col-md-3 col-sm-6 col-xs-6 ">
                    <a href="<?php echo $linkList; ?>" class="linkPride" title="">
                        <div class="product-thumb">
                            <div class="image">
                                <img src="<?php echo $imgList; ?>" alt="" class="img-responsive" />
                            </div>

                            <div class="list_block">
                                <div class="caption caption-left">
                                    <p class="text-center"><i class="fa fa-chevron-right" aria-hidden="true"></i>Просмотреть все работы</p>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>


            </div>
        </div>
    </div>
</div>

