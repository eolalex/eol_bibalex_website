function bindMetaArrow($row) {
	alert("done");
  $row.find('.js-meta-arw').click(function() {
  	alert("here");
    // // var $metaList = $(this).siblings('.js-meta-items');
    // alert("here");
    // if ($(this).hasClass('fa-angle-down')) {
    	// alert("if");
      // $(this).removeClass('fa-angle-down');
      // $(this).addClass('fa-angle-up');
      // $metaList.removeClass('is-hidden');
    // } else {
        	// alert("else");	
      // $(this).removeClass('fa-angle-up');
      // $(this).addClass('fa-angle-down');
      // $metaList.addClass('is-hidden');
    // }
  });
}

$(function() {
  $('.js-load-arw').click(function() {
    var $that = $(this)
      ;


    // $that.removeClass('fa-angle-down');
    // $that.addClass('fa-spin fa-spinner');
    // var path = {id: 124, show_taxon: true};
    // var url = Routes.datum_path(path);
	var x = document.getElementsByClassName("js-data-row");
	$row = x[0];
    $.ajax({
      url: $row.getAttribute('data-show-path'),
      success: function(result) {
        var $result = $(result);
        // bindMetaArrow($result);
        $("trait:first").replaceWith($result);
      }
    });
  });
});
