<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Shopping Cart | InternShop</title>
</head>
<body>
	<div class="hp-cartmargin">
		<c:if test="${cart.count != 0 and cart != null}">
			<c:if test="${checkLogin == 'fail'}">
				<script>
					$(function() {
						var modal = UIkit.modal("#modal-login");
						modal.show();
					});
				</script>
			</c:if>
			<div class="uk-card uk-card-default uk-card-bod">
				<table class="uk-table uk-table-hover uk-table-divider">
					<thead>
						<tr>
							<th></th>
							<th>Product</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Amount</th>
							<th><a href="#"><span uk-icon="icon: refresh"></span></a></th>
						</tr>
					</thead>
					<c:forEach var="item" items="${cart.item}">
						<tbody>
							<tr>
								<td><img data-src="imgs/product/${item.image}" width="30"
									height="50" alt="" uk-img></td>
								<td>${item.name}</td>
								<td class="hp-pricesmall">$${item.unitPrice }</td>
								<td><input class="uk-input uk-form-width-small"
									type="number" min=0 value="${item.quantity }" name="qty"
									style="height: 30px; width: 70px;"></td>
								<td class="hp-pricesmall">$${item.unitPrice* item.quantity}</td>
								<td><a
									href="${pageContext.request.contextPath}/cart/add?command=remove&id=${item.id}"><span
										uk-icon="icon: close"></span></a></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			<div uk-grid>
				<div class="uk-width-1-2"></div>
				<div class="uk-width-1-2">
					<div class="uk-card uk-card-default uk-card-bod wow bounceInRight"
						data-wow-duration="0.5s" data-wow-delay="0.2s">
						<div class="uk-alert-warning uk-text-center" uk-alert>Tổng
							đơn hàng</div>
						<hr class="uk-divider-icon">
						<table class="uk-table uk-table-divider">
							<tbody>
								<tr>
									<td>Subtotal</td>
									<td class="hp-price">$${cart.amount }</td>
								</tr>
								<tr>
									<td>Delivery</td>
									<td>
										<div class="uk-margin">
											<div class="uk-form-controls uk-form-controls-text">
												<label><input class="uk-radio" type="radio"
													name="radio1"> Free ship</label><br> <label><input
													class="uk-radio" type="radio" name="radio1">Local
													Delivery: 50,000₫</label>
											</div>
										</div>
									</td>

								</tr>
								<tr>
									<td>Total</td>
									<td class="hp-price">$${cart.amount }</td>
								</tr>
							</tbody>
						</table>
						<div class="uk-text-right" style="margin-right: 30px;">
							<a class="uk-button uk-button-default"
								formaction="billinginfo.jsp"
								href="${pageContext.request.contextPath}/order/bilinfo.php">Checkout</a>
						</div>
						<div style="background-color: white;" uk-alert></div>
					</div>
				</div>
			</div>
		</c:if>
	</div>
	<c:if test="${cart.count==0 or cart ==null}">
		<div style="margin-top: 2px;">
			<div
				class="uk-height-medium uk-flex uk-flex-center uk-flex-middle uk-background-cover uk-light"
				data-src="imgs/thanks.jpg" uk-img>
				<h1>SHOPPING CART</h1>
			</div>
			<div class="wow slideInLeft" data-wow-duration="0.3s"
				data-wow-delay="0.2s">
				<div style="margin-top: 50px;">SHOPPING CART</div>
				<div>Your shopping cart is empty</div>
			</div>
			<hr>
		</div>
	</c:if>
</body>
</html>