function submitFilterForm(query) {
	var sciNamesFilter = document.getElementById("scientific_names"),
	    vernacularsFilter = document.getElementById("vernaculars"),
	    collectionsFilter = document.getElementById("collections"),
	    mediaFilter = document.getElementById("media"),
	    scientificNames = false,
	    vernaculars = false,
	    collections = false,
	    media = false;
	    
	if (sciNamesFilter.checked) 
		scientificNames = true;
	if (vernacularsFilter.checked)
		vernaculars = true;
	if (collectionsFilter.checked)
		collections = true;
	if (mediaFilter.checked)
		media = true;

	var locale = document.getElementsByName("locale")[0].value;
	var url = locale + "/search";

	$.ajax({
		type : 'GET',
		url : url,
		data : {
			query : query,
			scientific_names : scientificNames,
			vernaculars : vernaculars,
			collections : collections,
			media : media
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

