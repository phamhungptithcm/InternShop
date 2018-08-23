$(document).ready(function() {
		var message1 = $("#message1").val();
		if (message1 != "") {
			alert(message1);
		}
		$(".hp-btnedits").click(function() {
			id = $(this).parent().parent().find("td:first-child").text();
			var info_url = "./admin/supplier";
            $.ajax({
            	data: { 'id' : id,'command' : "getsup"},
            	type: "post",
                url : info_url,
                success : function(result) {
                	var val = JSON.parse(result);
                	$("#id").val(val.id);
            		$("#name").val(val.companyName);
            		$("#email").val(val.email);
            		$("#phone").val(val.phone);
                }
            });
		});
	})