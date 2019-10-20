function validateForm() {
	
	var sciName = document.getElementsByName("scientific_name")[0].value,
		vernacular = document.getElementsByName("vernacular")[0].value,
		media = document.getElementsByName("media")[0].value,
		articleTitle = document.getElementsByName("article_title")[0].value;
		
	var inputFields = [sciName, vernacular, media, articleTitle];
	
	var valid = false;
	
	inputFields.forEach(function(currentValue){
		if (currentValue != "")
			valid = true;
	});
	
	if(!valid)
		alert("Please fill at least one field");
		
	return valid;
}
