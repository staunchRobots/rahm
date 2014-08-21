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