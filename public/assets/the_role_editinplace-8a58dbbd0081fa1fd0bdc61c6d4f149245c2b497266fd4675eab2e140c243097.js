(function() {
  this.TheRoleEditInPlace = (function() {
    return {
      showForm: function(item) {
        var a_item, b_item, holder;
        holder = item.parents('.holder');
        a_item = holder.children('span.a');
        b_item = holder.children('span.b');
        a_item.hide().off('click');
        b_item.css('visibility', 'visible');
        holder.find('.btn-warning').click((function(_this) {
          return function(e) {
            item = $(e.currentTarget);
            _this.hideForm(item);
            return item.parents('form')[0].reset();
          };
        })(this));
        holder.find('.btn-success').click(function() {
          return $(this).parents('form')[0].submit();
        });
        return b_item.find('input').keypress(function(event) {
          var ENTER, form;
          ENTER = 13;
          form = $(event.target).parents('form');
          if (event.which === ENTER) {
            return form.submit();
          }
        });
      },
      hideForm: function(item) {
        var a_item, b_item, holder;
        holder = item.parents('.holder');
        a_item = holder.children('span.a');
        b_item = holder.children('span.b');
        a_item.show();
        b_item.css('visibility', 'hidden');
        holder.find('.btn').off('click');
        return a_item.click((function(_this) {
          return function() {
            return _this.showForm(item);
          };
        })(this));
      },
      init: function() {
        return $('span.a', 'h3, h5').click((function(_this) {
          return function(e) {
            var item;
            item = $(e.currentTarget);
            return _this.showForm(item);
          };
        })(this));
      }
    };
  })();

}).call(this);
