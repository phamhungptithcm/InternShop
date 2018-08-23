<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<script src="js/admin/jquery.paginationbtn.js" type="text/javascript"></script>
<script src="js/admin/product/nt-productpagination.js"></script>

<script>
	function listbyCategory() {
		var c = document.getElementById("category").value;
		document.location.href = "${pageContext.request.contextPath}/admin/product/category?cid="
				+ c;
	}
	function listbySupplier() {
		var s = document.getElementById("supplier").value;
		document.location.href = "${pageContext.request.contextPath}/admin/product/supplier?sid="
				+ s;
	}
</script>
<title>Product Management | Admin Management</title>
<div class="uk-container">
	<fieldset>
		<LEGEND>Search</LEGEND>
			<div class="uk-text-center" uk-grid>
				<div class="uk-width-1-2">
					<select name="category" id="category" style="width: 200px"
						onchange="listbyCategory()" class="uk-select">
						<option value=null>Categories</option>
						<c:forEach items="${listcategory}" var="c">
							<option value="${c.id}">${c.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="uk-width-1-2">
					<select name="supplier" id="supplier" style="width: 200px"
						onchange="listbySupplier()" class="uk-select">
						<option value=null>Suppliers</option>
						<c:forEach items="${listsupplier}" var="s">
							<option value="${s.id}">${s.companyName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
	</fieldset>
	<fieldset>
		<LEGEND>New Product</LEGEND>
		<div>
			<a href="#toggle-animation" type="button"
				uk-toggle="target: #toggle-animation; animation: uk-animation-fade"
				uk-icon="icon: plus" uk-tooltip="Add Product"></a>
			<div id="toggle-animation" class=" uk-margin-small" hidden>
				<jsp:include page="../product/addproduct.jsp"></jsp:include>
			</div>
		</div>
	</fieldset>
	<input type="hidden" id="total" value="${total}">
	<table class="uk-table uk-table-justify uk-table-divider">
    <thead>
        <tr>
            <th class="uk-table-shrink">ID</th>
            <th class="uk-table-shrink">Product Name</th>
            <th class="uk-table-shrink">Category</th>
            <th class="uk-table-shrink">Supplier</th>
            <th class="uk-table-shrink">Import Date</th>
            <th class="uk-table-shrink">In Stock</th>
            <th class="uk-table-shrink">Price</th>
            <th class="uk-table-shrink">Action</th>
        </tr>
    </thead>
    <tbody>
    	<c:forEach items="${listproduct}" var="p">
        	<tr class="nt-pagination">
            	<td>${p.id}</td>
            	<td>${p.name}</td>
            	<td>${p.category.name}</td>
            	<td>${p.supplier.companyName}</td>
            	<td>${p.productDate}</td>
            	<td>${p.unitsInStock}</td>
            	<td>${p.unitPrice}</td>
            	<td>
            		<a href="${pageContext.request.contextPath}/admin/modify/update?command=getupdatetechchparam&pid=${p.id}" class="uk-icon-link uk-margin-small-right" uk-icon="settings" uk-tooltip="Update TechParam"></a>
            		<a href="${pageContext.request.contextPath}/admin/modify/update?command=getupdateproduct&pid=${p.id}" class="nt-updateproduct uk-icon-link uk-margin-small-right" uk-icon="file-edit" uk-tooltip="Update Product"></a>
					<a href="${pageContext.request.contextPath}/admin/delete?command=deleteproduct&pid=${p.id}" class="uk-icon-link" uk-icon="trash" uk-tooltip="Delete"></a>
            	</td>
        	</tr>
        </c:forEach>
    </tbody>
	</table>
	<ul class="uk-pagination uk-flex-center" id="pagination" uk-margin></ul>
</div>
