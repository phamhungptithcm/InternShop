<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<br>
<form method="post" action="${pageContext.request.contextPath}/admin/modify/update?command=updateproduct">
	<div class="uk-alert-primary uk-text-center" uk-alert>
		<p>Update Product</p>
	</div>
	<div class="uk-text-center">
		<div uk-grid>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline uk-form-width-large">
						<input class="uk-input" type="text" name="productname"
							placeholder="Product name" value="${product.name}" required>
					</div>
				</div>
			</div>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline uk-form-width-large">
						<input class="uk-input" type="text" name="discount"
							placeholder="Discount" value="${product.discount}" required>
					</div>
				</div>
			</div>
		</div>
		<div uk-grid>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline uk-form-width-large">
						<input class="uk-input" type="text" name="quantity"
							placeholder="Quantity" value="${product.unitsInStock}" required>
					</div>
				</div>
			</div>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline uk-form-width-large">
						<input class="uk-input" type="text" name="price"
							placeholder="Price" value="${product.unitPrice}" required>
					</div>
				</div>
			</div>
		</div>
		<div uk-grid>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline">
						<select name="category" id="category"
							class="uk-select uk-form-width-large" required>
								<option value="${product.category.id}">${product.category.name}</option>
							<c:forEach items="${listcategory}" var="c">
								<option value="${c.id}">${c.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline">
						<select name="supplier" id="supplier"
							class="uk-select uk-form-width-large" required>
								<option value="${product.supplier.id}">${product.supplier.companyName}</option>
							<c:forEach items="${listsupplier}" var="s">
								<option value="${s.id}">${s.companyName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" name="pid" value="${product.id}">
	<div class="uk-text-center"
		style="margin-top: 40px; margin-left: 40px; margin-right: 40px;">
		<div>
			<textarea class="uk-textarea" rows="5" name="description"
				placeholder="Description">${product.description}</textarea>
		</div>
	</div>

	<div class="uk-text-center"
		style="margin-top: 40px; margin-left: 40px; margin-right: 40px;">
		<button class="uk-button uk-button-primary uk-width-1-1" type="submit">Update</button>
	</div>
</form>