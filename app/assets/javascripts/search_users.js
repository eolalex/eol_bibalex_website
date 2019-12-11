function sortResults(query) {
	var sortAscending = document.getElementById("sortAscending"),
		sortDescending = document.getElementById("sortDescending"),
		sortDirection = "";
	if (sortAscending.checked)
		sortDirection = "asc";

	if (sortDescending.checked)
		sortDirection = "desc";

	search(query, sortDirection);
}

function clearSort(query) {
	search(query, "");
	var ascendingButton = document.getElementById("sortAscending"),
		descendingButton = document.getElementById("sortDescending");
	ascendingButton.checked = false;
	descendingButton.checked = false;
}

function search(query, sortDirection) {
	var locale = "/" + document.getElementsByName("locale")[0].value,
	    url = locale + "/admin/users/search";
	$.ajax({
		type : 'GET',
		url : url,
		data : {
			users_query: query,
			direction: sortDirection
		},
		dataType: "html",
		success: function(response) {
			$("body").html(response);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR);
		}
	});
	return false;
}
function enableSortButton() {
	var sortButton = document.getElementById("sortSubmitTag"),
		clearSortButton = document.getElementById("clearSortButton");
	sortButton.disabled = false;
	clearSortButton.disabled = false;
}

function initialize(){
	var sortButton = document.getElementById("sortSubmitTag"),
		clearSortButton = document.getElementById("clearSortButton"),
		ascendingButton = document.getElementById("sortAscending"),
		descendingButton = document.getElementById("sortDescending");

	sortButton.disabled = true;
	clearSortButton.disabled = true;
	ascendingButton.checked = false;
	descendingButton.checked = false;
}

$(document).ready(initialize);