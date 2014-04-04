function jumpPage(pageIndex) {
	$("#pageIndex").val(pageIndex);
	$("#searchForm").submit();
}

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

var showInfo = showConfirm = function(options) {
	options = $.extend({title:"Cyper UI"},options||{});
	var title = options["title"];
	var message = options["message"];
	var ok = options["ok"];
	var reload = options["reload"];
	$("#confirmMessage").text(message);
	$("#confirmDialog").dialog({
		title : title,
		width : 500,
		height : 200,
		autoOpen : true,
		modal : true,
		buttons : {
			"Ok" : function(e) {
				$(this).dialog('close');
				if(reload){
					window.location.reload();
				} else if(ok){
					ok();
				}
			},
			"Cancel" : function(e) {
				$(this).dialog('close');
			}
		}
	});
};




