<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<title>Order Management | Admin Management</title>
<script src="js/admin/jquery.paginationbtn.js" type="text/javascript"></script>
<script src="js/admin/sup&cate/hp-pagination.js"></script>
<script src="js/admin/order/ajax_order.js"></script>
<script>
$(document).ready(function() {
	$(".hp-info").click(function() {
		$("#orderDetail-info").html("");
		id = $(this).parent().parent().find("td:first-child").text();
		var info_url = "./admin/order";
        $.ajax({
        	data: { 'id' : id,'command' : "getorderDetail"},
        	type: "post",
            url : info_url,
            success : function(result) {
            	var val = JSON.parse(result);
            	jQuery.each(data, function(i, orderDetail) {
            		$("#orderDetail-info").append(
            				'<tr><td>my data</td><td>more data</td></tr>'
					);
            	});
            }
        });
	});
});
</script>
<input type="hidden" id="message1" value="${message}">
<input type="hidden" id="total" value="${total}">
<div style="margin-top: 30px;">
	<ul class="uk-child-width-expand" uk-tab>
		<li class="uk-active"><a href="#">Management</a></li>
		<li><a href="#">Statistic</a></li>
	</ul>
	<ul class="uk-switcher uk-margin">
		<li class="uk-active">
			<fieldset>
				<LEGEND>Update Order</LEGEND>
				<div>
					<a href="#toggle-animation" type="button"
						uk-toggle="target: #toggle-animation; animation: uk-animation-fade"
						uk-icon="icon: plus" uk-tooltip="Edit Management"></a>
					<div id="toggle-animation"
						class="uk-card uk-card-default uk-card-body uk-margin-small"
						hidden>
						<form>
							<fieldset class="uk-fieldset">
								<div class="uk-text-center" uk-grid>
									<div class="uk-width-1-2 hp-btncate1">
										<input class="uk-input" type="text" placeholder="Id"
											readonly="readonly" id="orderId">
									</div>
									<div class="uk-width-1-2 hp-btncate2">
										<input class="uk-input" type="text" placeholder="Amount"
											readonly="readonly" id="orderAmount">
									</div>
								</div>
								<div class="uk-margin">
									<input class="uk-input" type="text"
										placeholder="Shipping Address" readonly="readonly"
										id="orderAddress">
								</div>
								<div class="uk-margin">
									<input class="uk-input" type="text" placeholder="Note"
										readonly="readonly" id="orderNote">
								</div>
								<div class="uk-text-center" uk-grid>
									<div class="uk-width-1-2 hp-btncate1">
										<input class="uk-input" type="text" placeholder="Order Date"
											readonly="readonly" id="orderOrderDate">
									</div>
									<div class="uk-width-1-2 hp-btncate2">
										<input class="uk-input" type="date" placeholder="Shipped Date"
											id="orderShippedDate">
									</div>
								</div>
								<div class="uk-margin">
									<select class="uk-select" name="orderStatus">
										<c:forEach var="model" items="${orderStatus}">
											<option value="${model.id}" name="">${model.name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="uk-margin">
									<button class="uk-button uk-button-default"
										formaction="admin/order?command=update">Update</button>
								</div>
							</fieldset>
						</form>

					</div>

				</div>
			</fieldset>
			<div>
				<fieldset>
					<LEGEND>List Orders</LEGEND>
					<table class="uk-table uk-table-hover uk-table-divider ">
						<thead>
							<tr>
								<th class="uk-table-shrink uk-text-center">Id</th>
								<th class="uk-width-small uk-text-center">orderDate</th>
								<th class="uk-width-small uk-text-center">shippedDate</th>
								<th class="uk-width-small uk-text-center">Amount</th>
								<th class="uk-width-small uk-text-center">postCode</th>
								<th class="uk-width-small uk-text-center">Order Status</th>
								<th class="uk-width-small uk-text-center">Order Detail</th>
								<th class="uk-table-shrink"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="order" items="${order}">
								<tr class="uk-text-center">
									<td>${order.id}</td>
									<td>${order.orderDate}</td>
									<td><c:choose>
											<c:when test="${order.shippedDate == null}">
												<h6>Unfinished</h6>
											</c:when>
											<c:otherwise>${order.shippedDate}</c:otherwise>
										</c:choose></td>
									<td>${order.amount}</td>
									<td>${order.postCode}</td>
									<td>${order.orderStatus.name}</td>
									<td><a uk-icon="icon: info" class="hp-info"
										href="#modal-center" uk-toggle></a>

										<div id="modal-center" class="uk-flex-top" uk-modal>
											<div
												class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">

												<button class="uk-modal-close-default" type="button"
													uk-close></button>

												<table class="uk-table uk-table-small uk-table-divider">
													<thead>
														<tr>
															<th>Product Name</th>
															<th>UnitPrice</th>
															<th>Quantity</th>
															<th>Discount</th>
														</tr>
													</thead>
													<tbody id="orderDetail-info">

													</tbody>
												</table>

											</div>
										</div></td>
									<td><button class="hp-orderbtnupdate"
											uk-icon="icon: file-edit" uk-tooltip="Edit"></button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<ul class="uk-pagination uk-flex-center" id="pagination" uk-margin>
					</ul>
				</fieldset>
			</div>
		</li>
		<li class="">
			<div class="uk-alert-warning" uk-alert>
				<p>NUMBER OF INVOICE ISSUED IN THE MONTH</p>
			</div>
			<div class="uk-card uk-card-default uk-card-body">
				<table class="uk-table uk-table-divider"
					style="color: #ff7043; font-weight: bold;">
					<thead>
						<tr>
							<th class="uk-width-small">Month</th>
							<c:forEach var="item" items="${staByMonth}">
								<td class="uk-text-center uk-width-small">${item[0]}</td>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>quantity order</th>
							<c:forEach var="item" items="${staByMonth}">
								<td class="uk-text-center">${item[1]}</td>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="uk-alert-warning" uk-alert>
				<p>NUMBER OF INVOICE ISSUED IN THE QUARTER</p>
			</div>
			<div class="uk-card uk-card-default uk-card-body">
				<table class="uk-table uk-table-divider"
					style="color: #ff7043; font-weight: bold;">
					<thead>
						<tr>
							<th class="uk-width-small">Quarter</th>
							<c:forEach var="item" items="${staByQuarter}">
								<td class="uk-text-center uk-width-small">${item[0]}</td>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>quantity order</th>
							<c:forEach var="item" items="${staByQuarter}">
								<td class="uk-text-center">${item[1]}</td>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="uk-alert-warning" uk-alert>
				<p>NUMBER OF INVOICE ISSUED IN THE YEAR</p>
			</div>
			<div class="uk-card uk-card-default uk-card-body">
				<table class="uk-table uk-table-divider"
					style="color: #ff7043; font-weight: bold;">
					<thead>
						<tr>
							<th class="uk-width-small">Year</th>
							<c:forEach var="item" items="${staByYear}">
								<td class="uk-text-center uk-width-small">${item[0]}</td>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>quantity order</th>
							<c:forEach var="item" items="${staByYear}">
								<td class="uk-text-center">${item[1]}</td>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
		</li>
	</ul>
</div>