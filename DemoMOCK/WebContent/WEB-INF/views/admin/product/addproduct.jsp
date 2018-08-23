<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<form method="post" action="${pageContext.request.contextPath}/admin/product?command=addproduct">
	<div class="uk-text-center">
		<div uk-grid>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline uk-form-width-large">
						<input class="uk-input" type="text" name="productname" placeholder="Product name" required>
					</div>
				</div>
			</div>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline uk-form-width-large">
						<input class="uk-input" type="text" name="discount" placeholder="Discount" required>
					</div>
				</div>
			</div>
		</div>
		<div uk-grid>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline uk-form-width-large">
						<input class="uk-input" type="text" name="quantity" placeholder="Quantity" required>
					</div>
				</div>
			</div>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline uk-form-width-large">
						<input class="uk-input" type="text" name="price" placeholder="Price" required>
					</div>
				</div>
			</div>
		</div>
		<div uk-grid>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline">
						<select name="category" class="uk-select uk-form-width-large" required>
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
						<select name="supplier" class="uk-select uk-form-width-large" required>
                			<c:forEach items="${listsupplier}" var="s">
								<option value="${s.id}">${s.companyName}</option>
							</c:forEach>
            			</select>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="uk-text-center" style="margin-top: 40px; margin-left: 35px; margin-right: 30px;">
		<div>
			<textarea class="uk-textarea" rows="5" name="description" placeholder="Description"></textarea>
		</div>
	</div>


	<div class="uk-text-center" style="margin-top: 40px;margin-left: 35px; margin-right: 33px;">
		<button class="uk-button uk-button-primary uk-width-1-1" type="submit">Add</button>
	</div>
</form>