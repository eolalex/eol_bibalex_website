function bindMetaArrow($row) {
	alert("done");
  $row.find('.js-meta-arw').click(function() {
  	alert("here");
  });
}

function showPopup_meta(item){
  var id = $(item).attr("id");
  $('#popup_' + id).show();
  var $row = document.getElementById(id+'T');
  $.ajax({
    url: $row.getAttribute('data-show-path'),
    success: function(result) {
      var $result = $(result);
       $('#' + id + 'T').replaceWith($result);
    }
  });
}

