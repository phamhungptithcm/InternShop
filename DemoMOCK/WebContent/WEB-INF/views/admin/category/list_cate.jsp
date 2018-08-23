<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<title>Category Management  | Admin Management</title>
<link rel="stylesheet" href="css/mycss/admin/category.css">
<script src="js/admin/jquery.paginationbtn.js" type="text/javascript"></script>
<script src="js/admin/sup&cate/hp-pagination.js"></script>
<script src="js/admin/sup&cate/ajax_cate.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
 	 var data = google.visualization.arrayToDataTable([
  		['Task', 'Hours per Day'],
 	 <c:forEach var="item" items="${items}">
   		 	['${item[0]}',    	${item[1]}],
   	 </c:forEach>
  	]);
  	var options = {
   	 title: 'Number of products by type'
  	};
  	var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  	chart.draw(data, options);
}
</script>
	<div style="margin-top: 30px;">
		<ul class="uk-child-width-expand" uk-tab>
			<li class="uk-active"><a href="#">Management</a></li>
			<li><a href="#">Statistic</a></li>
		</ul>
		<ul class="uk-switcher uk-margin">
			<li class="uk-active"><input type="hidden" id="message1"
				value="${message}"> <input type="hidden" id="total"
				value="${total}">
				<div class="hp-cateadmin">
					<div class="uk-text-left" uk-grid>
						<div class="uk-width-1-2">
							<div class="uk-card uk-card-default uk-card-body hp-catebox">
								<table class="uk-table uk-table-hover uk-table-divider">
									<legend class="uk-legend uk-text-center"
										style="font-size: 21px;">LIST CATEGORY</legend>
									<thead>
										<tr>
											<th class="uk-table-shrink">Id</th>
											<th class="uk-table-expand">Name</th>
											<th class="uk-width-small uk-text-center">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="cate" items="${cates}">
											<tr class="result ">
												<td>${cate.id}</td>
												<td>${cate.name}</td>
												<td class="uk-text-center">
													<button class="hp-btneditcate" uk-icon="icon:  file-edit"
														uk-tooltip="Edit"></button> <a
													href="${pageContext.request.contextPath}/admin/category?command=delete&id=${cate.id}"
													uk-icon="icon: trash" uk-tooltip="Delete"></a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<ul class="uk-pagination uk-flex-center" id="pagination"
									uk-margin>
								</ul>
							</div>
						</div>
						<div class="uk-width-1-2">
							<div class="uk-card uk-card-default uk-card-body hp-catebox">
								<div>
									<legend class="uk-legend uk-text-center"
										style="font-size: 21px;">EDIT MANAGEMENT</legend>
								</div>
								<div style="margin-top: 35px;">
									<form method="post">
										<fieldset class="uk-fieldset">
											<div class="uk-margin">
												<input class="uk-input" type="text" id="categoryId"
													placeholder="Category Id" name="cid">
											</div>
											<div class="uk-margin">
												<input class="uk-input" type="text"
													placeholder="Category name" id="categoryName" name="cname">

											</div>
											<div class="uk-text-center" style="margin-top: 130px;"
												uk-grid>
												<div class="uk-width-1-2 hp-btncate1">
													<button class="uk-button uk-button-default"
														formaction="admin/category?command=add">Add</button>
												</div>
												<div class="uk-width-1-2 hp-btncate2">
													<button class="uk-button uk-button-default"
														formaction="admin/category?command=update">Update</button>
												</div>
											</div>
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div></li>
			<li class="">
				<div class="uk-text-center">
					<div class="uk-card uk-card-default uk-card-body">
						<table class="uk-table" style="color: #ff7043;font-weight: bold;">
							<thead>
								<tr>
									<c:forEach var="item" items="${items}">
										<th class="uk-text-center">${item[0]}</th>
									</c:forEach>
								</tr>
							</thead>
							<tbody>
								<tr>
									<c:forEach var="item" items="${items}">
										<td>${item[1]}</td>
									</c:forEach>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="uk-card uk-card-default uk-card-body uk-margin">
						<div id="piechart" style="width: 900px; height: 500px;"></div>
					</div>
				</div>
			</li>
		</ul>
	</div>