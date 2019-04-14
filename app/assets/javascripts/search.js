
//$(document).ready(function () {	
function initialize(){
	$("#filter").on('click', function() {
		var scientific_names_index = window.location.href.indexOf('&scientific_names=true');
		var link = "";
		if (scientific_names_index != -1) {
			link = window.location.href.substring(0, scientific_names_index) + window.location.href.substring(scientific_names_index + 10, window.location.href.size);
		} else {
			link = window.location.href;
		}

		var page_index = link.indexOf('&pages=true');
		if (page_index != -1) {
			link = link.substring(0, page_index) + link.substring(page_index + 11, window.location.href.size);
		}

		var filters = "";
		// if ($("#scientific_names").prop('checked')) {
			// filters += "&scientific_names=true";
		// }
		if ($("#pages").prop('checked')) {
			filters += "&pages=true";
		}
		window.location.href = link + filters;
	});

	$(function() {
		var pages = new Bloodhound({
			datumTokenizer : Bloodhound.tokenizers.whitespace,
			queryTokenizer : Bloodhound.tokenizers.whitespace,
			remote : {
				url : '/pages/autocomplete?query=%QUERY',
				wildcard : '%QUERY'
			}
		});
		pages.initialize();
		$('#query').typeahead(null, {
			displayKey: 'scientific_name',
			source : pages
		}).bind('typeahead:selected', function(evt, datum, name) {
			console.log(datum);
			// if(datum._type == "scientific_name")
				// window.location.href = Routes.page_path(datum.id);
			if(datum._type == "page")
				window.location.href = Routes.page_path(datum.id);
		});
		;
	});
}
//});
$(document).ready(initialize);
$(document).on('turbolinks:load', initialize);

