function submitFilterForm(query) {
	var sciNamesFilter = document.getElementById("scientific_names"),
	    collectionsFilter = document.getElementById("collections"),
	    scientificNames = false,
	    collections = false;
	if (sciNamesFilter.checked) 
		scientificNames = true;
	if (collectionsFilter.checked)
		collections = true;

	var locale = document.getElementsByName("locale")[0].value;
	var url = "/" + locale + "/search";
	$.ajax({
		type : 'GET',
		url : url,
		data : {
			query : query,
			scientific_names : scientificNames,
			collections : collections
		},
		dataType : "html",
		success : function(response) {
			$("body").html(response);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus);
		}
	});
	return false;
}

function enableFilterButton() {
	var button = document.getElementById("filterSubmitTag");
	button.disabled = false;
}

function initialize(){
	var button = document.getElementById("filterSubmitTag");
	button.disabled = true;
}
$(document).ready(initialize);
