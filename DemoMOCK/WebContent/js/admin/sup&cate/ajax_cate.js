$(document).ready(function() {
		var message1 = $("#message1").val();
		if (message1 != "") {
			alert(message1);
		}
		$(".hp-btneditcate").click(function() {
			id = $(this).parent().parent().find("td:first-child").text();
			var info_url = "./admin/category";
            $.ajax({
            	data: { 'id' : id,'command' : "getcate"},
            	type: "post",
                url : info_url,
                success : function(result) {
                	var val = JSON.parse(result);
                	
                		$("#categoryId").val(val.id);
                		$("#categoryName").val(val.name);
                			               
                }
            });
		});
	});