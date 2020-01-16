function sendChangePositionRequest(resourceID, direction, newPosition) {
	$.ajax({
		type : 'GET',
		url : '/harvestings/change_position',
		data : {
			resource_id : resourceID,
			direction: direction,
			new_position: newPosition
		},
		dataType : "html",
		success : function(response) {
			$("body").html(response);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus);
		}
	});
	location.reload();
	return;
}

function sendSwapRequest(firstResourceID, secondResourceID){
		$.ajax({
		type : 'GET',
		url : '/harvestings/swap',
		data : {
			first_resource_id: firstResourceID,
			second_resource_id: secondResourceID
		},
		dataType : "html",
		success : function(response) {
			$("body").html(response);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus);
		}
	});
	location.reload();
	return;
}

function sendMoveToEndRequest(resourceID, endResourceID, direction){
	// alert("ajax");
	$.ajax({
		type : 'GET',
		url : '/harvestings/move_to_end',
		data : {
			resource_id: resourceID,
			end_resource_id: endResourceID,
			direction: direction
		},
		dataType : "html",
		success : function(response) {
			$("body").html(response);
			// alert("success");
		},
		error : function(jqXHR, textStatus, errorThrown) {
			// alert("failed");
			console.log(textStatus);
		}
	});
	location.reload();
	return;
}

function moveOneStep(index, direction){
	var firstResourceID = document.getElementById("resourceID_" + index).innerText,
	secondResourceID = direction == 1 ? 
	document.getElementById("resourceID_" + (index - 1)).innerText : document.getElementById("resourceID_" + (index + 1)).innerText;
	sendSwapRequest(firstResourceID, secondResourceID, direction);
}

function moveToEnd(index, perPageCount, direction){
	var firstResourceID = document.getElementById("resourceID_" + index).innerText,
	endResourceID = direction == 1 ? 
	document.getElementById("resourceID_0").innerText : document.getElementById("resourceID_" + (perPageCount - 1)).innerText;
	// alert(firstResourceID + ", " + endResourceID + ", " + direction);
	sendMoveToEndRequest(firstResourceID, endResourceID, direction);
}

function setSortable(){
	var sortableElement = document.getElementById('sortableRows');
	if (sortableElement){
		var sortable = Sortable.create(sortableElement, {onEnd: function (evt){
			resourceID = document.getElementById('resourceID_' + evt.oldIndex).innerText;
			initialPosition = document.getElementById('resourcePosition_' + evt.oldIndex).innerText;
			finalPosition = document.getElementById('resourcePosition_' + evt.newIndex).innerText;
			deltaIndex = evt.newIndex - evt.oldIndex;
			if(deltaIndex > 0)
				direction = 1;
			else if(deltaIndex < 0)
				direction = -1;
			sendChangePositionRequest(resourceID, direction, finalPosition);
		}});
	}
}
$(document).ready(setSortable);
