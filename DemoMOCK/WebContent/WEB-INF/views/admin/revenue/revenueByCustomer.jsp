<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<div class="uk-alert-warning" uk-alert>
	<p>REVENUE BY CUSTOMER</p>
</div>
<div class="uk-card uk-card-default uk-card-body">
	<table class="uk-table uk-table-small uk-table-divider">
		<thead>
			<tr>
				<th>UserName</th>
				<c:forEach var="item" items="${reCus}">
					<td class="uk-text-center" style="color: black; font-weight: bold;">${item[0]}</td>
				</c:forEach>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>SUM(Order quantity)</th>
				<c:forEach var="item" items="${reCus}">
					<td class="uk-text-center"
						style="color: #ff7043; font-weight: bold;">${item[1]}</td>
				</c:forEach>
			</tr>
			<tr>
				<th>SUM(Order Price)</th>
				<c:forEach var="item" items="${reCus}">
					<td class="uk-text-center"
						style="color: #ff7043; font-weight: bold;">$<f:formatNumber value="${item[2]}" maxFractionDigits="3"/></td>
				</c:forEach>
			</tr>
			<tr>
				<th>MIN(Order Price)</th>
				<c:forEach var="item" items="${reCus}">
					<td class="uk-text-center"
						style="color: #ff7043; font-weight: bold;">$<f:formatNumber value="${item[3]}" maxFractionDigits="3"/></td>
				</c:forEach>
			</tr>
			<tr>
				<th>Max(Order Price)</th>
				<c:forEach var="item" items="${reCus}">
					<td class="uk-text-center"
						style="color: #ff7043; font-weight: bold;">$<f:formatNumber value="${item[4]}" maxFractionDigits="3"/></td>
				</c:forEach>
			</tr>
			<tr>
				<th>AVG(Order Price)</th>
				<c:forEach var="item" items="${reCus}">
					<td class="uk-text-center"
						style="color: #ff7043; font-weight: bold;">$<f:formatNumber value="${item[5]}" maxFractionDigits="3"/></td>
				</c:forEach>
			</tr>
		</tbody>
	</table>
</div>