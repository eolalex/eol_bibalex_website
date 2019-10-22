function validateForm() {

	var collectionName = document.getElementsByName("collection_name")[0].value,
	    collectionUser = document.getElementsByName("collection_user")[0].value,
	    sciName = document.getElementsByName("scientific_name")[0].value,
	    vernacular = document.getElementsByName("vernacular")[0].value,
	    media = document.getElementsByName("media")[0].value,
	    articleTitle = document.getElementsByName("article_title")[0].value,
	    predicateTo = document.getElementsByName("predicate_to")[0].value,
	    predicateFrom = document.getElementsByName("predicate_from")[0].value;

	var inputFields = [sciName, vernacular, media, articleTitle, predicateTo, predicateFrom];

	var valid = false;

	if (collectionName == "" && collectionUser == "") {
		alert("Please specify a collection or owner");
		return false;
	}

	inputFields.forEach(function(currentValue) {
		if (currentValue != "")
			valid = true;
	});

	if (valid) {
		if (isNaN(predicateTo) || isNaN(predicateFrom)) {
			alert("Error. Traits Ranges should be numeric");
			return false;
		}else
		if (predicateFrom >= predicateTo) {
			alert("Error. upper range must be greater than lower range");
			return false;
		}
	}
	
	if (!valid)
		alert("Please fill at least one field");

	return valid;
}

function checkPredicates() {
	predicate = document.getElementsByName("predicate")[0],
	predicateTo = document.getElementsByName("predicate_to")[0],
	predicateFrom = document.getElementsByName("predicate_from")[0];
	if (predicate.value == "No traits to show") {
		predicate.disabled = true;
		predicateTo.disabled = true;
		predicateFrom.disabled = true;
	} else {
		predicate.disabled = false;
		predicateTo.disabled = false;
		predicateFrom.disabled = false;
	}
}

$(document).ready(checkPredicates);
