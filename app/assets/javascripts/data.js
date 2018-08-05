function showOver(item){
	var id = $(item).attr("id");
    var hover_id = 'hover_'+id;
    document.getElementById(hover_id).style.display="block";
	$('#hover_id').show();
	// alert("show "+ hover_id);
}

function hideOver(item){
	var id = $(item).attr("id");
    var hover_id = 'hover_'+id;
	document.getElementById(hover_id).style.display="none";
	$('#hover_id').hide();
	// alert("hide "+ hover_id);
}

function showPopup(item){
	// alert("here");
	// alert($(item).attr("id"));
	// document.getElementById("popup_"+$(item).attr("id")).show();
	var id = $(item).attr("id");
	var popup_id = 'popup_'+id;
	$('#pop_up').show();
}