//= require twitter/bootstrap
//= require_tree .

$(function() {
  // initialize input widgets first
  $('.datetimepick .time').datetimepicker({
    pickDate: false
  });

  $('.datetimepick .date').datetimepicker({
    pickTime: false,
  });

});

(function($window){
  $window.utils = (function(){
    var util = {};
    util.getServerUrl = function(){
      var url = location.protocol + '//' + location.host + '/';
      return url;
    };

    util.getAuthenticityToken = function(){
      return $('input[name=authenticity_token]').val();
    };

    util.getElementInArray = function (array, id) {
      var selected = $.grep(array, function (item){
        return item.id == id;
      });

      return (selected || [])[0];
    };

    util.removeFromArray = function(array, id){
      var index = util.findIndex(array, id);
      array.splice(index, 1);
    };

    util.findIndex = function(array, id){
      var indexes = $.map(array, function(item, index) {
        if(item.id == id) {
          return index;
        }
      });

      return indexes[0];
    };

    return util;
  })();
})(window);