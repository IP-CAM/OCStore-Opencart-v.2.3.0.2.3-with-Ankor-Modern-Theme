$(document).ready(function() {
    var artCallback = new Callback();
    $(document).on('click', '.popup-modal-dismiss', function(e) {
        e.preventDefault();
        $.magnificPopup.close();
    });
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
