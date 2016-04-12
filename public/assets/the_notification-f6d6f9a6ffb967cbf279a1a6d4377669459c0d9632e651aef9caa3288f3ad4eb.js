(function() {
  this.TheNotification = (function() {
    return {
      show_error: function(error) {
        if (error) {
          return toastr.error(error);
        }
      },
      show_errors: function(errors) {
        var err, errs, field, _results;
        _results = [];
        for (field in errors) {
          errs = errors[field];
          _results.push((function() {
            var _i, _len, _results1;
            _results1 = [];
            for (_i = 0, _len = errs.length; _i < _len; _i++) {
              err = errs[_i];
              _results1.push(toastr.error("<b>" + field + ":</b> " + err));
            }
            return _results1;
          })());
        }
        return _results;
      },
      show_flash: function(flash) {
        var fu, level, method, msg, _msg, _results;
        fu = {
          notice: 'info',
          errors: 'error',
          error: 'error',
          warning: 'warning',
          alert: 'warning'
        };
        _results = [];
        for (level in flash) {
          msg = flash[level];
          method = fu[level] || 'info';
          if (msg instanceof Array) {
            _results.push((function() {
              var _i, _len, _results1;
              _results1 = [];
              for (_i = 0, _len = msg.length; _i < _len; _i++) {
                _msg = msg[_i];
                _results1.push(toastr[method](_msg));
              }
              return _results1;
            })());
          } else {
            _results.push(toastr[method](msg));
          }
        }
        return _results;
      },
      show_notifications: function() {
        var data, errors, flash;
        data = window.the_notifications;
        if (!data) {
          return false;
        }
        if (errors = data.errors) {
          this.show_errors(errors);
        }
        if (flash = data.flash) {
          return this.show_flash(flash);
        }
      },
      click_for_close_init: function() {
        return $('.flash_msgs, .error_explanation').on('click', function() {
          return $(this).slideUp(500);
        });
      },
      init: function() {
        this.click_for_close_init();
        return this.show_notifications();
      }
    };
  })();

}).call(this);
