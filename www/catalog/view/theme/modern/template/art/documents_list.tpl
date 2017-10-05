<?
/**
 * @var \app\models\Documents $document
 */
?>
<?php echo $header; ?>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
                        <li><?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { ?><?php echo $breadcrumb['text']; ?><?php } ?></li>
                    <?php } ?>
                </ul>
                <div id="content_documents"><?php echo $content_top; ?>
                    <h1><?php echo $heading_title; ?></h1>
                    <table class="table table-hover">
                        <tbody>
                        <? foreach ($document->files as $file):?>
                            <tr>
                                <?
                                $date = new DateTime($file['created_at'])

                                ?>
                                <td class="icon_column">
                                    <img src="<?=$document->getIconExtension($file);?>" alt="Логотип файла">
                                    <?=$file['name']?>
                                </td>
                                <td>от <?=$date->format('d.m.Y')?></td>
                                <td>
                                    <a href="<?=$controller->url->link('information/documents/get-file',['id'=>$file['id']]);$file['id']?>">Скачать файл</a>
                                </td>
                            </tr>
                        <?endforeach;?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<?php echo $footer; ?>