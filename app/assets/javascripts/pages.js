$(document).ready(function() {});

$(function() {
	$("img").lazyload();
});

function showPopup(item){
	var id = $(item).attr("id");
	$('#popup_' + id).show();
}

function hidePopup(item, event){
	var id = $(item).attr("id");
	event.preventDefault();
	event.stopPropagation();
	$('#popup_'+id).hide();
}

function showOver(item){
	var id = $(item).attr("id");
	$('#hover_'+id).show();
}

function hideOver(item){
	var id = $(item).attr("id");
	$('#hover_'+id).hide();
}

