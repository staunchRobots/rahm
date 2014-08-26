//= require twitter/bootstrap
//= require_tree .

window.previewMapManager = (function(){
  var me = {};
  me.getMapUrl = function(){
    return 'http://maps.googleapis.com/maps/api/staticmap?size=500x500&maptype=roadmap&markers=color:blue%7Clabel:S%7C';
  };
  me.buildMapImageUrl = function(address){
    // some address came with the full google map path
    if(/maps.googleapis/.test(address)){
      return address;
    }
    return me.getMapUrl() + address;
  };
  me.setMapPreview = function (){
    var mapUrl = me.getMapUrl();
    var fullAddress = getAddress();
    var addressUrl = mapUrl + fullAddress;
    me.fields.mapPreview.attr('src', addressUrl);
  };
  function getAddress(){
    var address = me.fields.addressInput.val().split(' ').join('+');
    var country = 'US';
    var state = me.fields.stateInput.val().split(' ').join('+');
    var city = me.fields.cityInput.val().split(' ').join('+');
    var zip = me.fields.zipInput.val();
    var fullAddress = [address, zip, city, state, country].join(',');
    return fullAddress;
  }
  return me;
})();

//Datapicker
$(function() {
  // initialize input widgets first
  $('.datetimepickerTime').datetimepicker({
    language: 'pt-BR',
    pickDate: false
  });

  $('.datetimepickerDate').datetimepicker({
    language: 'pt-BR',
    pickTime: false
  });
});

//utils
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