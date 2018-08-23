<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>${cate.name} | InternShop</title>
<style type="text/css">
.uk-child-width-1-2 {
	margin-top: 40px;
}
.hp-listproduct-body {
	height: 220px;
}

.hp-listproduct-name {
	height: 50px;
}
</style>
</head>
<body>

	<input type="hidden" id="total" value="${total}">
					
	<div class="uk-child-width-1-2 uk-child-width-1-4@s uk-grid-match"
		uk-grid>
		<c:forEach var="p" items="${items}">
			<div class="uk-animation-toggle wow bounceInUp contentPage"
				data-wow-duration="0.5s" data-wow-delay="0.2s">
				<a href="${pageContext.request.contextPath}/product/detail?id=${p.id}" style="text-decoration: none;">
					<div
						class="uk-animation-slide-top-small uk-card uk-card-default uk-card-body uk-text-center">
						<div class="hp-listproduct-body">
							<img src="imgs/product/${p.image}" />

						</div>
						<div class="hp-listproduct-name">
							<strong>${p.name }</strong>
						</div>
						<div class="hp-price">$${p.unitPrice}</div>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>
	<div style="width: 500px; margin:auto;">
		<ul id="pagination"></ul>
	</div>
	
</body>
</html>