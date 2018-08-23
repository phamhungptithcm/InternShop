<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home | Admin Management</title>
<script language="javascript">
	$(document).ready(function(){
		// tao lenh alert
		var mess = $("#mess").val();
		if(mess != ""){
			alert(mess);
		}
	});
</script>
</head>
<body>
	<input type="hidden" id="mess" value="${mess}">
	<div style="margin-top: 30px;">
		<div class="uk-alert-warning" uk-alert>
			<p>EDIT THE PRODUCTS THAT ARE DISPLAYED ON THE HOMEPAGE</p>
		</div>
		<hr>
		<div class="uk-card uk-card-default uk-card-body">
			<div class="uk-text-center" uk-grid>
				<div class="uk-width-1-3">
					<div class="">
						<button href="#toggle-animation1"
							class="uk-button uk-button-default uk-width-1-1" type="button"
							uk-toggle="target: #toggle-animation1; animation: uk-animation-fade"
							style="background-color: #ffcdd2;">LIST MOBILE <span class="uk-badge">${mtotal}</span></button>
					</div>
				</div>
				<div class="uk-width-1-3">
					<div class="">
						<button href="#toggle-animation2"
							class="uk-button uk-button-default uk-width-1-1" type="button"
							uk-toggle="target: #toggle-animation2; animation: uk-animation-fade"
							style="background-color: #bbdefb;">LIST TABLET <span class="uk-badge">${ttotal}</span></button>
					</div>
				</div>
				<div class="uk-width-1-3">
					<div class="">
						<button href="#toggle-animation3"
							class="uk-button uk-button-default uk-width-1-1" type="button"
							uk-toggle="target: #toggle-animation3; animation: uk-animation-fade"
							style="background-color: #f0f4c3;">LIST LAPTOP <span class="uk-badge">${ltotal}</span></button>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 30px;">
			<div id="toggle-animation1"
				class="uk-card uk-card-default uk-card-body uk-margin-small" hidden>
		
				<form method="Post">
				<table class="uk-table uk-table-hover uk-table-divider">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Show?</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="m" items="${mobiles}">
							<tr>
								<td>${m.id}</td>
								<td>${m.name}</td>
								<c:if test="${m.viewHome}">
									<td><input class="uk-checkbox" type="checkbox" name="checkVH"
										value="${m.id}" checked></td>
								</c:if>
								
								<c:if test="${not m.viewHome}">
									<td><input class="uk-checkbox" type="checkbox" name="checkVH"
										value="${m.id}"></td>
								</c:if>
								<!-- <td><a href="" uk-icon="icon: refresh"></a></td> -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="submit" name="action" value="motServlet" class="uk-button uk-button-primary">Excute</button>
				</form>
			</div>
		</div>
		<div style="margin-top: 30px;">
			<div id="toggle-animation2"
				class="uk-card uk-card-default uk-card-body uk-margin-small" hidden>
				<form method="Post">
				<table class="uk-table uk-table-hover uk-table-divider">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Show?</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="t" items="${tablets}">
							<tr>
								<td>${t.id}</td>
								<td>${t.name}</td>
									
								<c:if test="${t.viewHome}">
									<td><input class="uk-checkbox" type="checkbox" name="checkVH"
										value="${t.id}" checked></td>
								</c:if>
								
								<c:if test="${not t.viewHome}">
									<td><input class="uk-checkbox" type="checkbox" name="checkVH"
										value="${t.id}"></td>
								</c:if>	
								<!-- <td><a href="" uk-icon="icon: refresh"></a></td> -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="submit" name="action" value="haiServlet" class="uk-button uk-button-primary">Excute</button>
				</form>
			</div>
		</div>
		<div style="margin-top: 30px;">
			<div id="toggle-animation3"
				class="uk-card uk-card-default uk-card-body uk-margin-small" hidden>
				<form method="Post">
				<table class="uk-table uk-table-hover uk-table-divider">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Show?</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="l" items="${laptops}">
							<tr>
								<td>${l.id}</td>
								<td>${l.name}</td>
								<c:if test="${l.viewHome}">
									<td><input class="uk-checkbox" type="checkbox" name="checkVH"
										value="${l.id}" checked></td>
								</c:if>
								
								<c:if test="${not l.viewHome}">
									<td><input class="uk-checkbox" type="checkbox" name="checkVH"
										value="${l.id}"></td>
								</c:if>
								
								<!-- <td><a href="" uk-icon="icon: refresh"></a></td> -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="submit" name="action" value="baServlet" class="uk-button uk-button-primary">Excute</button>
				</form>
			</div>
		</div>
		<div class="uk-alert-warning" uk-alert>
			<p>STATISTICS NUMBER OF PRODUCTS BY CATEGORY</p>
		</div>
		<hr>
		<div class="uk-card uk-card-default uk-card-body">
			<table class="uk-table uk-table-divider">
				<thead>
					<tr>
						<th class="uk-width-small">Category</th>
						<c:forEach var="item" items="${citems}">
							<td class="uk-text-center" style="color: black; font-weight: bold;">${item[0]}</td>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="uk-width-small">Quantity Product</th>
						<c:forEach var="item" items="${citems}">
							<td class="uk-text-center" style="color: #ff7043; font-weight: bold;">${item[1]}</td>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="uk-alert-warning" uk-alert>
			<p>STATISTICS NUMBER OF PRODUCTS BY SUPPLIER</p>
		</div>
		<hr>
		<div class="uk-card uk-card-default uk-card-body">
			<table class="uk-table uk-table-divider uk-text-center">
				<thead>
					<tr>
						<th class="uk-width-small">Supplier</th>
						<c:forEach var="item" items="${sitems}">
							<td class="uk-text-center" style="color: black; font-weight: bold;">${item[0]}</td>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="uk-width-small">Quantity Product</th>
						<c:forEach var="item" items="${sitems}">
							<td class="uk-text-center" style="color: #ff7043; font-weight: bold;">${item[1]}</td>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>