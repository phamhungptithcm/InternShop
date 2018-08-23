<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Supplier Management | Admin Management</title>
<script src="js/admin/jquery.paginationbtn.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/mycss/admin/supplier.css">
<script src="js/admin/sup&cate/ajax_supp.js"></script>
<script src="js/admin/sup&cate/hp-pagination.js"></script>
</head>
<body>
	<input type="hidden" id="message1" value="${message}">
	<input type="hidden" id="total" value="${total}">
	<div class="hp-supadmin">
		<div class="uk-text-left" uk-grid>
			<div class="uk-width-1-2">
				<div class="uk-card uk-card-default uk-card-body hp-supbox">
					<table class="uk-table uk-table-hover uk-table-divider">
						<legend class="uk-legend uk-text-center" style="font-size: 21px;">LIST
							SUPPLIER</legend>
						<thead>
							<tr>
								<th class="uk-table-shrink">Id</th>
								<th class="uk-width-small">Name</th>
								<th class="uk-table-expand">Email</th>
								<th class="uk-width-small uk-text-center">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="sup" items="${sups}">
								<tr class="result ">
									<td>${sup.id}</td>
									<td>${sup.companyName}</td>
									<td>${sup.email}</td>
									<td class="uk-text-center"><button class="hp-btnedits"
											uk-icon="icon:  file-edit" uk-tooltip="Edit"></button> <a
										href="${pageContext.request.contextPath}/admin/supplier?command=delete&id=${sup.id}"
										uk-icon="icon: trash" uk-tooltip="Delete"></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<ul class="uk-pagination uk-flex-center" id="pagination" uk-margin>
					</ul>
				</div>
			</div>
			<div class="uk-width-1-2">
				<div class="uk-card uk-card-default uk-card-body hp-supbox">
					<div>
						<legend class="uk-legend uk-text-center" style="font-size: 21px;">EDIT
							MANAGEMENT</legend>
					</div>
					<div style="margin-top: 35px;">
						<form method="post">
							<fieldset class="uk-fieldset">
								<div class="uk-margin" uk-grid>
									<div class="uk-width-1-4">
										<input class="uk-input" type="text" id="data-id"
											placeholder="Id" name="id">
									</div>
									<div class="uk-width-3-4">
										<input class="uk-input" type="text" placeholder="Company name"
											id="data-name" name="name">
									</div>
								</div>
								<div class="uk-margin">
									<input class="uk-input" type="text" id="data-id"
										placeholder="Email" name="email">
								</div>
								<div class="uk-margin" uk-grid>
									<div class="uk-width-3-4">
										<input class="uk-input" type="text" id="data-id"
											placeholder="Phone" name="phone">
									</div>
									<div class="uk-width-1-4 uk-text-right">
										<div class="js-upload" uk-form-custom>
											<input type="file" multiple name="photo">
											<button class="uk-button uk-button-default" type="button"
												tabindex="-1">
												<span uk-icon="icon: cloud-upload"></span>
											</button>
										</div>
									</div>
								</div>
					</div>
					<div class=" uk-margin uk-text-center" uk-grid>
						<div class="uk-width-1-2 hp-btnsup1">
							<button class="uk-button uk-button-default"
								formaction="admin/supplier?command=add">Add</button>
						</div>
						<div class="uk-width-1-2 hp-btnsup2">
							<button class="uk-button uk-button-default"
								formaction="admin/supplier?command=update">Update</button>
						</div>
					</div>
					</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>