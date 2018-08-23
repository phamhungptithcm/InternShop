$(document).ready(function(){
			var modal = document.getElementById('id01');
			
			// tao lenh alert
			var mess = $("#mess").val();
			if(mess != ""){
				alert(mess);
			}
			
			// Click ra vung outside thi bien mat
			window.onclick = function(event) {
			    if (event.target == modal) {
			        modal.style.display = "none";
			    }
			}
			
			$(".update-btn").click(function(){
				document.getElementById('id01').style.display='block';
				account_id = $(this).parent().parent().find("td:first-child").text();
				var info_url = "./admin/Customer/getAdmin";
			    $.ajax({
			    	data: { 'nanoid' : account_id},
			    	type: "post",
			        url : info_url,
			        success : function(result) {
			        	var val = JSON.parse(result);
			        	
			        		$("#username").val(val.id);
			        		$("#password").val(val.password);
			        		$("#fullname").val(val.fullname);
			        		$("#phone").val(val.phone);
			        		$("#email").val(val.email);
			        		$("#img").val(val.photo);
			        		               
			        }
			    });
			});
			
			$(".info").on("click",function(){
				$("#order-info").html("");
				account_id = $(this).parent().parent().find("td:first-child").text();
				var info_url = "./admin/Customer/getOrder";
			    $.ajax({
			    	data: { 'id' : account_id},
			    	type: "post",
			        url : info_url,
			        success : function(result) {
			        	var val = JSON.parse(result);
			        	jQuery.each( val, function( i, order ) {
			            	if(order.orderStatus.id == 3){
			                		$("#order-info").append('<tr>\
														  		<td><div class="orderid">'+order.id+'</div></td>\
														  		<td><div class="date">'+order.orderDate+'</div></td>\
														  		<td><div class="shipdate">'+order.shippedDate+'</div></td>\
														  		<td><div class="shipaddress">'+order.shipAddress+'</div></td>\
														  		<td><div class="note">'+order.notes+'</div></td>\
														  		<td><i class="fa fa-calendar-check-o" style="margin: 0 auto; font-size:20px;color:green"></td>\
														  		</tr>'	
			                		);
			            	}
			            	
			            	if(order.orderStatus.id == 1){
			            		$("#order-info").append('<tr>\
													  		<td><div class="orderid">'+order.id+'</div></td>\
													  		<td><div class="date">'+order.orderDate+'</div></td>\
													  		<td><div class="shipdate">'+order.shippedDate+'</div></td>\
													  		<td><div class="shipaddress">'+order.shipAddress+'</div></td>\
													  		<td><div class="note">'+order.notes+'</div></td>\
													  		<td><i class="fa fa-calendar-times-o" style="margin: 0 auto; font-size:20px;color:red"></i></i></td>\
													  		</tr>'	
			            		);
			            	}
			        		if(order.orderStatus.id == 2){
			            		$("#order-info").append('<tr>\
													  		<td><div class="orderid">'+order.id+'</div></td>\
													  		<td><div class="date">'+order.orderDate+'</div></td>\
													  		<td><div class="shipdate">'+order.shippedDate+'</div></td>\
													  		<td><div class="shipaddress">'+order.shipAddress+'</div></td>\
													  		<td><div class="note">'+order.notes+'</div></td>\
													  		<td><i class="fa fa-calendar-minus-o" style="margin: 0 auto; font-size:20px;color:gold"></td>\
													  		</tr>'	
			            		);
			        	}
			            	
			            	
			        	});
			        	$("#modal-show")[0].click();
			        }
			    });
			});

			$("#add-btn").click(function(){
				document.getElementById('id01').style.display='block';
				
		   		$("#username").val("");
		   		$("#password").val("");
		   		$("#fullname").val("");
		  		$("#phone").val("");
		   		$("#email").val("");
		   		$("#img").val("");
		   		
		});	

});



