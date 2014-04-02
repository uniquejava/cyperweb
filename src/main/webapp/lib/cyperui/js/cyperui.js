function showBusy() {
	$("#loading").show();
}
function hideBusy() {
	$("#loading").hide();
}

function showMsg(msg) {
	if (msg) {
		$("#messageText").text(msg);
	}

	if ($("#messageText").text().trim().length > 0) {
		$("#messageDiv").show();
		setTimeout("$('#messageDiv').fadeOut()", 1500);
	}
}

function showAlert(msg, callback) {
	if (msg) {
		$("#alertText").text(msg);
	}

	$("#alertBox").modal({
		show : true,
		keyboard : false,
		backdrop : false
	});
	$('<div class="modal-backdrop"></div>').appendTo(document.body);
	$("#btnAlert").click(function() {
		$("#alertBox").modal("hide");
		if (callback) {
			callback();
		}
		$(".modal-backdrop").remove();
	});
}