function getURLVar(key) {
	var value = [];
	var query = document.location.search.split('?');
	if (query[1]) {
		var part = query[1].split('&');
		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');
			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}
		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
}
$(document).ready(function() {
	var el = document.getElementById('column-left');
	if (el) {
	$("#cont").addClass("cont_color");
	}
	// Highlight any found errors
	$('.text-danger').each(function() {
		var element = $(this).parent().parent();
		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});
		// Currency
	$('#form-currency .currency-select').on('click', function(e) {
		e.preventDefault();
		$('#form-currency input[name=\'code\']').val($(this).attr('name'));
		$('#form-currency').submit();
	});
	// Language
	$('#form-language .language-select').on('click', function(e) {
		e.preventDefault();
		$('#form-language input[name=\'code\']').val($(this).attr('name'));
		$('#form-language').submit();
	});
	/* Search */
	$('#search input[name=\'search\']').parent().find('button').on('click', function() {
		var url = $('base').attr('href') + 'index.php?route=product/search';
        var value = $('input[name=\'search\']').val();
		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}
		var category_id = $('select[name=\'category_id\']').val();
		if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
		url += '&sub_category=true';
		}
		location = url;
	});
	$('#search input[name=\'search\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('input[name=\'search\']').parent().find('button').trigger('click');
		}
	});
	// Menu
	$('#menu .dropdown-menu').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();
		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth()) + 5;
		if (i > 0 && i < dropdown.left) {
			$(this).css('margin-left', '-' + i + 'px');
		} else if (i > 0 && i > dropdown.left) {
			$(this).css('margin-left', '-' + (dropdown.left-40) + 'px');
		}
	});
	// Product List
	$('#list-view').click(function() {
		$('#content .product-layoutcat').attr('class', 'product-layoutcat product-list col-lg-12 col-md-12 col-sm-12 col-xs-12');
		$('#content .slide').attr('class', 'carousel slide slide_list');
	    $('#content .list_ch').attr('class', 'list_ch list_block');
		$(window).resize(function(){
	if ($(window).width() < 900 && $(window).width() > 750) {
		$('#content .slide_list').attr('class', 'carousel slide slide_list col-lg-3 col-md-4 col-sm-5 col-xs-5');
		$('#content .list_block').attr('class', 'list_ch list_block col-lg-9 col-md-8 col-sm-7 col-xs-7');
	} else if ($(window).width() < 751 && $(window).width() > 0) { 
		$('#content .slide_list').attr('class', 'carousel slide slide_list col-lg-3 col-md-4 col-sm-5 col-xs-12');
		$('#content .list_block').attr('class', 'list_ch list_block col-lg-9 col-md-8 col-sm-7 col-xs-12');
	} else {
		$('#content .slide_list').attr('class', 'carousel slide slide_list col-lg-3 col-md-4 col-sm-5 col-xs-4');
		$('#content .list_block').attr('class', 'list_ch list_block col-lg-9 col-md-8 col-sm-7 col-xs-8');
	}
});
$(window).resize();
		$('.btn-instock').css("width", "260px");
		$('.btn-cartpr').css("width", "180px");
		$('.atr_grid').css("display", "none");
		$('.desc_list').css("display", "block");
		localStorage.setItem('display', 'list');
		$(this).addClass('btn-listgrid');
		$('#grid-view').removeClass('btn-listgrid');
		$('.product-layout2').css("height", "auto");
		$('.product-layoutcat').css("margin-bottom", "15px");
	});
	// Product Grid
	$('#grid-view').click(function() {
		cols = $('#column-right, #column-left').length;
		$('#content .product-layoutcat').attr('class', 'product-layoutcat product-grid');
		$(window).resize(function(){
	if ($(window).width() < 992 && $(window).width() > 849) {
	if (cols == 2) {
			$('#content .product-grid').attr('class', 'product-layoutcat product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
		} else if (cols == 1) {
			$('#content .product-grid').attr('class', 'product-layoutcat product-grid col-lg-3 col-md-4 col-sm-4 col-xs-4');
		} else {
			$('#content .product-grid').attr('class', 'product-layoutcat product-grid col-lg-3 col-md-3 col-sm-4 col-xs-12');
		}
    } else if ($(window).width() < 850 && $(window).width() > 589) {
	  if (cols == 2) {
	  	$('#content .product-grid').attr('class', 'product-layoutcat product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
		} else if (cols == 1) {
			$('#content .product-grid').attr('class', 'product-layoutcat product-grid col-lg-3 col-md-4 col-sm-4 col-xs-6');
		} else {
			$('#content .product-grid').attr('class', 'product-layoutcat product-grid col-lg-3 col-md-3 col-sm-4 col-xs-12');
		}
    } else {
	    if (cols == 2) {
	  	$('#content .product-grid').attr('class', 'product-layoutcat product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
		} else if (cols == 1) {
			$('#content .product-grid').attr('class', 'product-layoutcat product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12');
		} else {
			$('#content .product-grid').attr('class', 'product-layoutcat product-grid col-lg-3 col-md-3 col-sm-4 col-xs-12');
		}
  }
});
$(window).resize();
		localStorage.setItem('display', 'grid');
		$('#content .slide').attr('class', 'carousel slide');
		$('#content .list_ch').attr('class', 'list_ch');
		$('.atr_grid').css("display", "block");
		$('.product-layout2').css("height", "27.3em");
        $('.btn-instock').css("width", "100%");
		$('.btn-cartpr').css("width", "100%");
		$('.product-layoutcat').css("margin-bottom", "35px");
		$('.desc_list').css("display", "none");
		$(this).addClass('btn-listgrid');
		$('#list-view').removeClass('btn-listgrid');
	});
	if (localStorage.getItem('display') == 'list') {
	$('#list-view').trigger('click');
	} else {
	$('#grid-view').trigger('click');
	}  
	// Checkout
	$(document).on('keydown', '#collapse-checkout-option input[name=\'email\'], #collapse-checkout-option input[name=\'password\']', function(e) {
		if (e.keyCode == 13) {
			$('#collapse-checkout-option #button-login').trigger('click');
		}
	});
	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body',trigger: 'hover'});
	// Makes tooltips work on ajax generated content
	$(document).ajaxStop(function() {
		$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	});
});
// Cart add remove functions
var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},			
			success: function(json) {
				$('.alert, .text-danger').remove();
				if (json['redirect']) {
					location = json['redirect'];
				}
				if (json['success']) {
					   $('#addtocart').find('.modal-body p').html(json['success']);
		   $("#addtocart").modal('show');
					// Need to set timeout otherwise it wont update the total
					setTimeout(function () {
						$('#cart button > span').html('<span> &nbsp;' + json['total'] + '&nbsp;<span class="caret"></span></span>');
					}, 100);
				$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
		},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},			
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart button > span').html('<span> &nbsp;' + json['total'] + '&nbsp;<span class="caret"></span></span>');
				}, 100);
				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
		  },
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart button > span').html('<span> &nbsp;' + json['total'] + '&nbsp;<span class="caret"></span></span>');
				}, 100);
				var now_location = String(document.location.pathname);
				if ((now_location == '/cart/') || (now_location == '/checkout/') || (getURLVar('route') == 'checkout/cart') || (getURLVar('route') == 'checkout/checkout')) {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}
var voucher = {
	'add': function() {
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart button > span').html('<span> &nbsp;' + json['total'] + '&nbsp;<span class="caret"></span></span>');
				}, 100);
				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}
var wishlist = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();
            $("#wishlist").modal('show');
				if (json['success']) {
			$("#wishlist .modal-body p").html(json['success']);
				}
				if (json['info']) {
			$("#wishlist .modal-body p").html(json['info']);
				}
				$('#wishlist-total span').html(json['total']);
				$('#wishlist-total').attr('title', json['total']);
		},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function() {
	}
}
var compare = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();
				if (json['success']) {
					$("#compare").modal('show');
					$("#compare .modal-body p").html(json['success']);
					$('#compare-total').html(json['total']);
				}
		},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function() {
	}
}
/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();
	$('#modal-agree').remove();
	var element = this;
	$.ajax({
		url: $(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
			html  = '<div id="modal-agree" class="modal">';
			html += '  <div class="modal-dialog">';
			html += '    <div class="modal-content">';
			html += '      <div class="modal-header">';
			html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
			html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
			html += '      </div>';
			html += '      <div class="modal-body">' + data + '</div>';
			html += '    </div';
			html += '  </div>';
			html += '</div>';
			$('body').append(html);
			$('#modal-agree').modal('show');
		}
	});
});
// Autocomplete */
(function($) {
	$.fn.autocomplete = function(option) {
		return this.each(function() {
			this.timer = null;
			this.items = new Array();
			$.extend(this, option);
			$(this).attr('autocomplete', 'off');
			// Focus
			$(this).on('focus', function() {
				this.request();
			});
			// Blur
			$(this).on('blur', function() {
				setTimeout(function(object) {
					object.hide();
				}, 200, this);
			});
			// Keydown
			$(this).on('keydown', function(event) {
				switch(event.keyCode) {
					case 27: // escape
						this.hide();
						break;
					default:
						this.request();
						break;
				}
			});
			// Click
			this.click = function(event) {
				event.preventDefault();
				value = $(event.target).parent().attr('data-value');
				if (value && this.items[value]) {
					this.select(this.items[value]);
				}
			}
			// Show
			this.show = function() {
				var pos = $(this).position();
				$(this).siblings('ul.dropdown-menu').css({
					top: pos.top + $(this).outerHeight(),
					left: pos.left
				});
				$(this).siblings('ul.dropdown-menu').show();
			}
			// Hide
			this.hide = function() {
				$(this).siblings('ul.dropdown-menu').hide();
			}
			// Request
			this.request = function() {
				clearTimeout(this.timer);
				this.timer = setTimeout(function(object) {
					object.source($(object).val(), $.proxy(object.response, object));
				}, 200, this);
			}
			// Response
			this.response = function(json) {
				html = '';
				if (json.length) {
					for (i = 0; i < json.length; i++) {
						this.items[json[i]['value']] = json[i];
					}
					for (i = 0; i < json.length; i++) {
						if (!json[i]['category']) {
							html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
						}
					}
					// Get all the ones with a categories
					var category = new Array();
					for (i = 0; i < json.length; i++) {
						if (json[i]['category']) {
							if (!category[json[i]['category']]) {
								category[json[i]['category']] = new Array();
								category[json[i]['category']]['name'] = json[i]['category'];
								category[json[i]['category']]['item'] = new Array();
							}
							category[json[i]['category']]['item'].push(json[i]);
						}
					}
					for (i in category) {
						html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';
						for (j = 0; j < category[i]['item'].length; j++) {
							html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
						}
					}
				}
				if (html) {
					this.show();
				} else {
					this.hide();
				}
				$(this).siblings('ul.dropdown-menu').html(html);
			}
			$(this).after('<ul class="dropdown-menu"></ul>');
			$(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));
		});
	}
})(window.jQuery);