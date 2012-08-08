// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require_tree .

jQuery.ajaxSetup({
  'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

jQuery.fn.reset = function () {
  $(this).each (function() { $(this).val(); this.reset(); });
};

jQuery.fn.multiselect = function() {
    $(this).each(function() {
        var checkboxes = $(this).find("input:checkbox");
        checkboxes.each(function() {
            var checkbox = $(this);
            // Highlight pre-selected checkboxes
            if (checkbox.attr("checked"))
              checkbox.parent().addClass("multiselect-on");
            else
            	checkbox.parent().removeClass("multiselect-on");

            // Highlight checkboxes that the user selects
            checkbox.click(function() {
                if (checkbox.attr("checked"))
                    checkbox.parent().addClass("multiselect-on");
                else
                    checkbox.parent().removeClass("multiselect-on");
            });
        });
    });
};

var displayChart = function(node_id, div_id, url_for_nodes){
  $.post('/orgchart/charts/'+node_id+'/loadChart', {id : node_id}, function(result) {
    initChart(div_id, result, url_for_nodes);
  });
}

var initChart = function(div_id, data, url_for_nodes) {

  $(div_id).jOrgChart({
    chartElement : div_id,
    dragAndDrop  : false,
    url_for_nodes : url_for_nodes,
    data:data
  });

  if(data == null) return false;
  else return true;
}
