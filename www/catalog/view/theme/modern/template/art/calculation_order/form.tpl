<div id="artCalculationOrder" class="callback">
    <div class="callbackbor">
        <button title="close" type="button" class="mfp-close">×</button>
        <div class="name-popup">Заказ расчета</div>
    </div>
    <div class="callback2">
        <div class="blockTitleModal">
            <div class="row">
                <div class="col-xs-12">
                    <p>Заполните, пожалуйста, поля формы и отправьте её нам. Специалист по производству конструкций свяжется с Вами и предоставит информацию о стоимости конструкции.</p>
                </div>
            </div>
        </div>
        <div class="form-horizontal formcallback">

            <div class="form-group errors alert alert-danger hidden" role="alert">

            </div>

            <div class="form-group required">
                <label class="control-label" for="input-firstname">Имя:</label>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input name="firstName" placeholder="Имя" class="form-control" type="text">
                </div>
            </div>

            <div class="form-group required">
                <label class="control-label" for="input-contact">Телефон:</label>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                    <input id="telephone" name="phone" placeholder="Телефон" class="form-control" type="text">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label" for="typeConstruction">Тип конструкции:</label>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-cog" aria-hidden="true"></i></span>
                    <input id="typeConstruction" name="typeConstruction" placeholder="козырек, навес, теплица и т.д." class="form-control" type="text">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label" for="sizeConstruction">Размер конструкции,мм:</label>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-arrows-alt"></i></span>
                    <input id="sizeConstruction" name="sizeConstruction" placeholder="например, 2000*3000 мм" class="form-control" type="text">
                </div>
            </div>


            <div class="form-group">
                <label class="control-label" for="input-comment">Комментарий:</label>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                    <textarea class="form-control" name="comment" placeholder="Комментарий"></textarea>
                </div>
            </div>

        </div>
        <br>
        <div class="row">
            <div class="col-xs-12">
                <div class="contacts">
                    <div class="title">
                        Телефон отдела конструкций
                    </div>
                    <div class="phone">
                        +7 (978) 063-41-80
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <span style="font-size: 12px;">Нажимая на кнопку «Отправить», я даю cогласие на <a href="person_danie" target="_blank">обработку персональных данных.</a></span></div>
        </div>
        <br>
        <input type="hidden" name="productId" value="<?=$productId?>">
        <button type="button" data-callculationOrderSend="on" data-loading-text="Загрузка..." class="btn-cart fixcenter">Отправить</button>
    </div>
</div>
