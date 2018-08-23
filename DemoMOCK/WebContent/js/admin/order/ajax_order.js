	$(document).ready(function() {
		var message1 = $("#message1").val();
		if (message1 != "") {
			alert(message1);
		}
		$(".hp-orderbtnupdate").click(function() {
			var id = $(this).parent().parent().find("td:first-child").text();
			var info_url = "./admin/order";
			$.ajax({
				data : {
					'id' : id,
					'command' : 'getorder'
				},
				type : "post",
				url : info_url,
				success : function(result) {
					var val = JSON.parse(result);

					$("#orderId").val(val.id);
					$("#orderAmount").val(val.amount);
					$("#orderAddress").val(val.shippedAddress);
					$("#orderOrderDate").val(val.orderDate);
					$("#orderNote").val(val.notes);
					$("#orderShippedDate").val(val.shippedAddress);
				}
			});
		});
	});