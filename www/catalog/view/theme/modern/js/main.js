$(document).ready(function() {
    var artCallback = new Callback();
    $(document).on('click', '.popup-modal-dismiss', function(e) {
        e.preventDefault();
        $.magnificPopup.close();
    });
    var calculationOrder = new CalculationOrder();
    $('a[href=#documents]').on('click',toggleDocumentBlock)

});
var Callback = function () {
    var self = this;
    self.blockCallback = $('#artCallback');

    this.constructor = function () {
        $('[data-callback=on]').on('click', self.open);
        $(document).on("click touchstart", "[data-order_callback=on]",self.orderCallback);
    };
    this.open = function () {
        $.magnificPopup.open({
            items: {
                src: 'index.php?route=extension/module/callback/index&url=' + window.location.href
            },
            type: 'ajax'
        });
    };
    this.orderCallback = function () {
        self.blockCallback = $('#artCallback');
        $('.mfp-content').append('<div class="loader"><div class="bag_quickview"></div></div>');
        $.ajax({
            url: 'index.php?route=extension/module/callback/saveCallback',
            type: 'post',
            data: {
                'firstName':  self.blockCallback.find('[name=firstName]').val(),
                'phone':  self.blockCallback.find('[name=phone]').val(),
                'comment':  self.blockCallback.find('[name=comment]').val(),
                'url':  window.location.href
            },
            dataType: 'json',
            success: function(data) {
                $("div.loader").remove();
                console.log(data);
                if (data['errors']) {
                    self.showErrors(data['errors'])
                }
                if (data['success']) {
                    self.success();
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }

    this.showErrors = function (errors) {
        var blockErrors = self.blockCallback.find('.errors');
        var str = '';
        for (key in errors) {
            str += errors[key] + '<br>';
        }
        blockErrors.removeClass('hidden');
        blockErrors.html(str);
    };
    this.success = function () {
        setTimeout(function() {
            $.magnificPopup.close();
        }, 6000);
        $.magnificPopup.open({
            items: {
                src: 'index.php?route=extension/module/callback/success'
            },
            type: 'ajax'
        });
    };

    this.constructor();
};

var CalculationOrder = function () {
    var self = this;
    this.block = $('#artCalculationOrder');
    this.btnMain = $('[data-callculationOrder=on]');

    this.constructor = function () {
        self.btnMain.on('click', self.open);
        $(document).on("click touchstart", "[data-callculationOrderSend=on]",self.order);
    };
    this.open = function () {
        var productId = self.btnMain.data('productid');

        $.magnificPopup.open({
            items: {
                src: 'index.php?route=extension/module/calculation_order/index&productId=' + productId
            },
            type: 'ajax'
        });
    };
    this.order = function () {
        self.block = $('#artCalculationOrder');
        $('.mfp-content').append('<div class="loader"><div class="bag_quickview"></div></div>');
        var data = {
            'firstName': self.block.find('[name=firstName]').val(),
            'phone':  self.block.find('[name=phone]').val(),
            'typeConstruction':  self.block.find('[name=typeConstruction]').val(),
            'sizeConstruction':  self.block.find('[name=sizeConstruction]').val(),
            'comment':  self.block.find('[name=comment]').val(),
            'productId':  self.block.find('[name=productId]').val()
        };
        $.ajax({
            url: 'index.php?route=extension/module/calculation_order/save',
            type: 'post',
            data: data,
            dataType: 'json',
            success: function(data) {

                $("div.loader").remove();
                if (data['errors']) {
                    self.showErrors(data['errors'])
                }
                if (data['success']) {
                    self.success();
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    };

    this.showErrors = function (errors) {
        var blockErrors = self.block.find('.errors');
        var str = '';
        for (key in errors) {
            str += errors[key] + '<br>';
        }
        blockErrors.removeClass('hidden');
        blockErrors.html(str);
    };
    this.success = function () {
        setTimeout(function() {
            $.magnificPopup.close();
        }, 6000);
        $.magnificPopup.open({
            items: {
                src: 'index.php?route=extension/module/calculation_order/success'
            },
            type: 'ajax'
        });
    };


    this.constructor();
};
toggleDocumentBlock = function (e) {
    e.preventDefault();
    $(this).css("display", "block");
    var block = $(this).siblings('.dropdownDocs ');
   block.toggleClass('mobile');
};

var changeOptionProductInProgress = false;
changeOptionProduct = function (elem, product_id) {
    console.log('test');
    console.log($(elem));
    var $elem = $(elem);

    changeOptionProductInProgress = true;
    $.ajax({
        url: 'index.php?route=product/product/ajaxOptionImages',
        method: 'POST',
        data: {
            productId : product_id,
            optionId : $elem.data('option-id'),
            optionValueId : $elem.attr('value')
        }
    }).done(function(data, textStatus, jqXHR) {
        changeOptionProductInProgress = false;
        $('#blockImages').html(data);
        startImagesProduct();
        console.log(data);
    }).fail(function(jqXHR, textStatus, errorThrown) {
        changeOptionProductInProgress = false;
        if (jqXHR.responseJSON) {
            // jqXHR.reseponseJSON is an object
            console.log('failed with json data');
        }
        else {
            // jqXHR.responseText is not JSON data
            console.log('failed with unknown data');
        }
    }).always(function(dataOrjqXHR, textStatus, jqXHRorErrorThrown) {
        changeOptionProductInProgress = false;
        console.log('always');
    });
};
