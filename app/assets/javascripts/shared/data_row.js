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

// $(function() {
  // $('.js-load-arw').click(function(e) {
  	// e.preventDefault();
	// e.stopPropagation();
  		// alert("yes");
    // var $that = $(this);
//       
	 // alert(e.target.parentNode.id);
	// var id = e.target.parentNode.id;
    // // $that.removeClass('fa-angle-down');
    // // $that.addClass('fa-spin fa-spinner');
    // // var path = {id: 124, show_taxon: true};
    // // var url = Routes.datum_path(path);
	 // var $row = document.getElementById(id+'T');
	// // $row = x[0];
	 // alert($row.getAttribute('data-show-path'));
    // $.ajax({
      // url: $row.getAttribute('data-show-path'),
      // success: function(result) {
        // var $result = $(result);
        // // bindMetaArrow($result);
        // // alert($result.toSource());
         // // $("trait").replaceWith($result);
         // // $row= $result;
         // $('#'+id+'T').replaceWith($result);
      // }
    // });
  // });
// });

function showPopup_meta(item){
	// alert($(item).attr("id"));
	// document.getElementById("popup_"+$(item).attr("id")).show();
	var id = $(item).attr("id");
	$('#popup_'+id).show();
	// alert("trait");
	var $row = document.getElementById(id+'T');
	// $row = x[0];
	 // alert($row.getAttribute('data-show-path'));
    $.ajax({
      url: $row.getAttribute('data-show-path'),
      success: function(result) {
        var $result = $(result);
        // bindMetaArrow($result);
        // alert($result.toSource());
         // $("trait").replaceWith($result);
         // $row= $result;
         $('#'+id+'T').replaceWith($result);
      }
    });
	
}

