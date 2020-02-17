/*
 * bootstrap-filestyle
 * http://dev.tudosobreweb.com.br/bootstrap-filestyle/
 *
 * Copyright (c) 2013 Markus Vinicius da Silva Lima
 * Version 1.0.3
 * Licensed under the MIT license.
 *
 * src: https://github.com/85lele/bootstrap-filestyle
 */
(function ($) {
  "use strict";

  var Filestyle = function (element, options) {
    this.options = options;
    this.$elementFilestyle = [];
    this.$element = $(element);
  };

  Filestyle.prototype = {
    clear: function () {
      this.$element.val('');
      this.$elementFilestyle.find(':text').val('');
    },

    destroy: function () {
      this.$element
      .removeAttr('style')
      .removeData('filestyle')
      .val('');
      this.$elementFilestyle.remove();
    },

    icon: function (value) {
      if (value === true) {
        if (!this.options.icon) {
          this.options.icon = true;
          this.$elementFilestyle.find('label').prepend(this.htmlIcon());
        }
      } else if (value === false) {
        if (this.options.icon) {
          this.options.icon = false;
          this.$elementFilestyle.find('i').remove();
        }
      } else {
        return this.options.icon;
      }
    },

    input: function (value) {
      if (value === true) {
        if (!this.options.input) {
          this.options.input = true;
          this.$elementFilestyle.prepend(this.htmlInput());

          var content = '',
              files = [];
          if (this.$element[0].files === undefined) {
            files[0] = {
              'name': this.$element[0].value
            };
          } else {
            files = this.$element[0].files;
          }

          for (var i = 0; i < files.length; i++) {
            content += files[i].name.split("\\").pop() + ', ';
          }
          if (content !== '') {
            this.$elementFilestyle.find(':text').val(content.replace(/\, $/g, ''));
          }
        }
      } else if (value === false) {
        if (this.options.input) {
          this.options.input = false;
          this.$elementFilestyle.find(':text').remove();
        }
      } else {
        return this.options.input;
      }
    },

    buttonText: function (value) {
      if (value !== undefined) {
        this.options.buttonText = value;
        this.$elementFilestyle.find('label span').html(this.options.buttonText);
      } else {
        return this.options.buttonText;
      }
    },

    classButton: function (value) {
      if (value !== undefined) {
        this.options.classButton = value;
        this.$elementFilestyle.find('label').attr({
          'class': this.options.classButton
        });
        if (this.options.classButton.search(/btn-inverse|btn-primary|btn-danger|btn-warning|btn-success/i) !== -1) {
          this.$elementFilestyle.find('label span').addClass('icon-white');
        } else {
          this.$elementFilestyle.find('label span').removeClass('icon-white');
        }
      } else {
        return this.options.classButton;
      }
    },

    classIcon: function (value) {
      if (value !== undefined) {
        this.options.classIcon = value;
        if (this.options.classButton.search(/btn-inverse|btn-primary|btn-danger|btn-warning|btn-success/i) !== -1) {
          this.$elementFilestyle.find('label').find('span').attr({
            'class': 'icon-white ' + this.options.classIcon
          });
        } else {
          this.$elementFilestyle.find('label').find('span').attr({
            'class': this.options.classIcon
          });
        }
      } else {
        return this.options.classIcon;
      }
    },

    classInput: function (value) {
      if (value !== undefined) {
        this.options.classInput = value;
        this.$elementFilestyle.find(':text').addClass(this.options.classInput);
      } else {
        return this.options.classInput;
      }
    },

    htmlIcon: function () {
      if (this.options.icon) {
        var colorIcon = '';
        if (this.options.classButton.search(/btn-inverse|btn-primary|btn-danger|btn-warning|btn-success/i) !== -1) {
          colorIcon = ' icon-white ';
        }

        return '<span class="' + colorIcon + this.options.classIcon + '"></span> ';
      } else {
        return '';
      }
    },

    htmlInput: function () {
      if (this.options.input) {
        return '<input type="text" class="' + this.options.classInput + '" disabled> ';
      } else {
        return '';
      }
    },

    constructor: function () {
      var _self = this,
          html = '',
          id = this.$element.attr('id'),
          files = [];

      if (id === '' || !id) {
        id = 'filestyle-' + $('.bootstrap-filestyle').length;
        this.$element.attr({
          'id': id
        });
      }

      var inputContainerOpen = (this.options.classInputContainerClass != '') ? '<div class="' + this.options.classInputContainerClass + '">' : '';
      var inputContainerClose = (inputContainerOpen != '') ? '</div>' : '';

      var buttonContainerOpen = (this.options.classButtonContainerClass != '') ? '<div class="' + this.options.classButtonContainerClass + '">' : '';
      var buttonContainerClose = (buttonContainerOpen != '') ? '</div>' : '';

      if (this.options.buttonBefore) {
        html =
          buttonContainerOpen +
          '<label for="' + id + '" class="' + this.options.classButton + '">' +
          this.htmlIcon() +
          ' ' + this.options.buttonText +
          '</label>' +
          buttonContainerClose +
          inputContainerOpen +
          this.htmlInput() +
          inputContainerClose;
      } else {
        html =
          inputContainerOpen +
          this.htmlInput() +
          inputContainerClose +
          buttonContainerOpen +
          '<label for="' + id + '" class="' + this.options.classButton + '">' +
          this.htmlIcon() +
          ' ' + this.options.buttonText +
          '</label>' +
          buttonContainerClose;
      }

      this.$elementFilestyle = $('<div class="' + this.options.containerClass + ' bootstrap-filestyle">' + html + '</div>');

      //WR: Check if present clear and preview and hidden preload has value
      var preloadValue = $('[id="' + id + '_preload"]').val();
      var nextElements = this.$element.nextAll().not(".field-error");
      if (preloadValue || nextElements.length) {
        if (preloadValue) {
          this.$elementFilestyle.find(':text').val(preloadValue.split("\\").pop().split("/").pop().split("?").shift().replace(/\, $/g, ''));
        }

        this.$elementFilestyle[(this.options.buttonBefore) ? "prepend" : "append"](nextElements);
        this.$elementFilestyle.addClass('preloaded');
      }

      //END WR

      var $label = this.$elementFilestyle.find('label');
      var $labelFocusableContainer = $label.parent();

      $labelFocusableContainer
      .attr('tabindex', "0")
      .keypress(function (e) {
        if (e.keyCode === 13 || e.charCode === 32) {
          $label.click();
        }
      });

      // hidding input file and add filestyle
      this.$element
      .css({
        'position': 'absolute',
        'clip': 'rect(0,0,0,0)'
      })
      .attr('tabindex', "-1")
      .after(this.$elementFilestyle);

      // Getting input file value
      this.$element.change(function () {
        var content = '';
        if (this.files === undefined) {
          files[0] = {
            'name': this.value
          };
        } else {
          files = this.files;
        }

        for (var i = 0; i < files.length; i++) {
          content += files[i].name.split("\\").pop() + ', ';
        }

        if (content !== '') {
          _self.$elementFilestyle.find(':text').val(content.replace(/\, $/g, ''));
        } else {
          _self.$elementFilestyle.find(':text').val('');
        }
      });

      // Check if browser is Firefox
      if (window.navigator.userAgent.search(/firefox/i) > -1) {
        // Simulating choose file for firefox
        this.$elementFilestyle.find('label').click(function () {
          _self.$element.click();
          return false;
        });
      }
    }
  };

  var old = $.fn.filestyle;

  $.fn.filestyle = function (option, value) {
    var get = '',
        element = this.each(function () {
          if ($(this).attr('type') === 'file') {
            var $this = $(this),
                data = $this.data('filestyle'),
                options = $.extend({}, $.fn.filestyle.defaults, option, typeof option === 'object' && option);

            if (!data) {
              $this.data('filestyle', (data = new Filestyle(this, options)));
              data.constructor();
            }

            if (typeof option === 'string') {
              get = data[option](value);
            }
          }
        });

    if (typeof get !== undefined) {
      return get;
    } else {
      return element;
    }
  };

  $.fn.filestyle.defaults = {
    'buttonText': 'Buscar',
    'input': true,
    'icon': true,
    'buttonBefore': false,

    'containerClass': 'input-group', // bootstrap-filestyle
    'classButtonContainerClass': 'input-group-btn',
    'classButton': 'btn btn-default btn-choose',
    'classInputContainerClass': '',
    'classInput': 'form-control',
    'classIcon': 'glyphicon glyphicon-folder-open'
  };

  $.fn.filestyle.noConflict = function () {
    $.fn.filestyle = old;
    return this;
  };

  // Data attributes register
  $('.filestyle').each(function () {
    var $this = $(this),
        options = {
          'buttonText': $this.attr('data-buttonText'),
          'input': $this.attr('data-input') === 'false' ? false : true,
          'icon': $this.attr('data-icon') === 'false' ? false : true,
          'classButton': $this.attr('data-classButton'),
          'classInput': $this.attr('data-classInput'),
          'classIcon': $this.attr('data-classIcon')
        };

    $this.filestyle(options);
  });
})(window.jQuery);