<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Review Order | InternShop</title>
</head>
<body>
<div class="step2">
	<div class="hp-hoverlistorder">
		<table
			class="uk-table uk-table-divider uk-card uk-card-default uk-card-body">
			<thead>
				<tr>
					<th>Product</th>
					<th>Price</th>
					<th>Quantity</th>
					<th class="uk-text-right">Total</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="item" items="${cart.item}">
				<tr>
					<td>${item.name}</td>
					<td style="color: #ffca28; font-size: 16px; font-weight: bold;">$${item.unitPrice}</td>
					<td>${item.quantity}</td>
					<td class="uk-text-right"
						style="color: #ffca28; font-size: 16px; font-weight: bold;">$${item.unitPrice * item.quantity}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="uk-text-center" uk-grid>
			<div class="uk-width-1-2"></div>
			<div class="uk-width-1-2">
				<table
					class="uk-table uk-table-divider uk-card uk-card-default uk-card-body">
					<tbody>
						<tr>
							<td class="uk-text-left">Order Total</td>
							<td class="uk-text-right">$${cart.amount}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="uk-card uk-card-default uk-card-body">
		<div class="uk-alert-warning uk-text-center" uk-alert>
			<p>Billing information</p>
		</div>
		<table class="uk-table ">
			<tbody>
				<tr>
					<td>E-mail address</td>
					<td>${billinginfo.email}</td>
				</tr>
				<tr>
					<td>Fullname</td>
					<td>${billinginfo.fullname}</td>
				</tr>
				<tr>
					<td>Address</td>
					<td>${billinginfo.address}</td>
				</tr>
				<tr>
					<td>Phone</td>
					<td>${billinginfo.phone}</td>
				</tr>
				<tr>
					<td>Country</td>
					<td>${billinginfo.country}</td>
				</tr>
			</tbody>
		</table>
		<div class="uk-text-right">
			<a class="uk-button uk-button-default" href="${pageContext.request.contextPath}/order/checkout.php">checkout</a>
		</div>
	</div>
</div>
</body>
</html>
