//$(document).ready(function () {
function initialize(locale) {
	include("initializeConstants.js");
	var locale = document.getElementsByName("locale")[0].value;
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
		limit = getLimit();
		$('#query').typeahead(null, {
			displayKey : 'scientific_name',
			source : pages,
			limit : limit,
			minLength : 1
		}).bind('typeahead:selected', function(evt, datum, name) {
			console.log(datum);
			if (datum.type == "page") {
				window.location.href = Routes.page_path(locale, datum.id);
			}
		});
		;
	});
}

function include(filename) {
	var head = document.getElementsByTagName('head')[0];
	var script = document.createElement('script');
	script.src = filename;
	script.type = 'text/javascript';
	head.appendChild(script);
}
$(document).ready(initialize);
