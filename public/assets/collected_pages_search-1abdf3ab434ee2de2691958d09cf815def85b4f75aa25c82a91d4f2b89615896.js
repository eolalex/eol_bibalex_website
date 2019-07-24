function initialize() {
	$(function() {
		var collection_id = document.getElementsByName("collection_id")[0].value;
		var locale = "/"+document.getElementsByName("locale_coll")[0].value;
		var collected_pages = new Bloodhound({
			datumTokenizer : Bloodhound.tokenizers.whitespace,
			queryTokenizer : Bloodhound.tokenizers.whitespace,
			remote : {
				url : '../collections/' + collection_id + '/collected_pages/autocomplete?cp_query=%QUERY',
				wildcard : '%QUERY'
			}
		});
		collected_pages.initialize();
		$('#cp_query').typeahead(null, {
			displayKey : 'scientific_name_string',
			source : collected_pages,
			limit: Infinity,
			minLength: 1,
		}).bind('typeahead:selected', function(evt, datum, name) {
			console.log(datum);
			if (datum._type == "collected_page")
				window.location.href = locale + Routes.page_path(datum.page_id);
		});
		;
	});
}


$(document).ready(initialize);
$(document).on('turbolinks:load', initialize);
