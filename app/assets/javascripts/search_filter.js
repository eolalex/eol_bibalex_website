function submitFilterForm(query) {
	var sciNamesFilter = document.getElementById("scientific_names"),
	    mediaFilter = document.getElementById("media"),
	    scientificNames = false,
	    media = false;
	if (sciNamesFilter.checked) 
		scientificNames = true;
	if (mediaFilter.checked)
		media = true;

	var locale = document.getElementsByName("locale")[0].value;
	var url = "/" + locale + "/search";
	$.ajax({
		type : 'GET',
		url : url,
		data : {
			query : query,
			scientific_names : scientificNames,
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