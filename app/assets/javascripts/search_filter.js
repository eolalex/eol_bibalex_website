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

function clearFilters(query) {
	var sciNamesFilter = document.getElementById("scientific_names"),
	    vernacularsFilter = document.getElementById("vernaculars"),
	    collectionsFilter = document.getElementById("collections"),
	    mediaFilter = document.getElementById("media");
	    // scientificNames = false,
	    // vernaculars = false,
	    // collections = false,
	    // media = false;
	    
	sciNamesFilter.checked = false; 
	vernacularsFilter.checked = false;
	collectionsFilter.checked = false;
	mediaFilter.checked = false;

	var locale = document.getElementsByName("locale")[0].value;
	var url = locale + "/search";

	$.ajax({
		type : 'GET',
		url : url,
		data : {
			query : query
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
	var filterButton = document.getElementById("filterSubmitTag");
	filterButton.disabled = false;
	var clearFilterButton = document.getElementById("clearFilter");
	clearFilterButton.disabled = false;
}

function initialize(){
	var filterButton = document.getElementById("filterSubmitTag");
	filterButton.disabled = true;
	var clearFilterButton = document.getElementById("clearFilter");
	clearFilterButton.disabled = true;
}
$(document).ready(initialize);

