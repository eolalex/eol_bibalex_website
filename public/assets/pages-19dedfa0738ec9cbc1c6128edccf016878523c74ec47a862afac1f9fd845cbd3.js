// $(document).ready(function() {
    // $('#media_icon').click(function() {
    	// alert('#{image_id}');
        // $('#popup').show();
    // });
    // $('#close').click(function(event) {
    	// event.preventDefault();
    	// event.stopPropagation();
        // $('#popup').hide();
    // });
// });

function showPopup(item){
	// alert($(item).attr("id"));
	// document.getElementById("popup_"+$(item).attr("id")).show();
	var id = $(item).attr("id");
	$('#popup_'+id).show();
}

function hidePopup(item, event){
	// alert($(item).attr("id"));
	var id = $(item).attr("id");
	// var event = $(item).attr("event");
	event.preventDefault();
	event.stopPropagation();
	$('#popup_'+id).hide();
}
;
