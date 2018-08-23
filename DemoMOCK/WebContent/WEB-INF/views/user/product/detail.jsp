<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>${model.name} | InternShop</title>
<style type="text/css">
.hp-container-detail {
	margin-top: 40px;
}

.hp-position {
	position: relative;
	text-align: center;
	display: inline-block;
}
</style>
</head>
<body>
	<div
		class="uk-child-width-1-2 uk-grid-small uk-text-center hp-container-detail"
		uk-grid>
		<div>
			<div class="uk-text-center">
				<img width="300" height="350" alt="" uk-img
					data-src="imgs/product/${model.image}" class="wow slideInLeft"
					data-wow-duration="0.3s" data-wow-delay="0.2s">
			</div>
		</div>
		<div class="uk-text-left wow slideInRight" data-wow-duration="0.3s"
			data-wow-delay="0.2s">
			<div class="uk-margin"
				style="font-size: 20px; text-transform: uppercase">
				${model.name}</div>
			<div class="uk-margin" style="font-size: 15px;">

				<span> <i class="fa fa-star-o" aria-hidden="true"
					style="color: #ffea00"></i> <i class="fa fa-star-o"
					aria-hidden="true" style="color: #ffea00;"></i> <i
					class="fa fa-star-o" aria-hidden="true" style="color: #ffea00"></i>
					<i class="fa fa-star-o" aria-hidden="true" style="color: #ffea00"></i>
					<i class="fa fa-star-o" aria-hidden="true" style="color: black"></i>
				</span> <a class="review">Reviews</a> <span>|</span> <a class="review">Add
					Your Review</a>
			</div>
			<div class="uk-text-left hp-price">
				<c:choose>
					<c:when test="${model.available ==false}">
					Sorting about
				</c:when>
					<c:otherwise>
							$${model.unitPrice}
				</c:otherwise>
				</c:choose>
			</div>
			<hr>
			<ul class="uk-list uk-list-bullet wow slideInRight"
				data-wow-duration="0.3s" data-wow-delay="0.2s"
				style="font-size: 14px;">
				<li>Reduced to 1% of the invoice price, 10% of the price of
					electronic accessories</li>
				<li>Paid 0% with bank credit card (minimum $150)</li>
				<li>Free cards (except AMEX, UnionPay & JCB)</li>
				<li>New machine,Duplicate imei on box</li>
				<li>12 month warranty at genuine authorized centers, renewal of
					the first 30 days, 1 change of 1 accessory included 12 months if
					manufacturer's fault</li>
			</ul>
			<hr>
			<div class="wow slideInRight" data-wow-duration="0.3s"
				data-wow-delay="0.2s">
				<span>Color</span>
			</div>
			<div class="wow slideInRight" data-wow-duration="0.3s"
				data-wow-delay="0.2s">
				<label class="hp-color"> <input type="radio" name="color"
					checked="checked"> <span id="iconcolor"
					style="background-color: white;"></span>
				</label> <label class="hp-color"> <input type="radio" name="color">
					<span id="iconcolor" style="background-color: #f8bbd0;"></span>
				</label> <label class="hp-color"> <input type="radio" name="color">
					<span id="iconcolor" style="background-color: black;"></span>
				</label> <label class="hp-color"> <input type="radio" name="color">
					<span id="iconcolor" style="background-color: #03a9f4;"></span>
				</label>
			</div>
			<div class="uk-text-right row wow slideInRight"
				data-wow-duration="0.3s" data-wow-delay="0.2s"">
				<c:if test="${model.unitsInStock != 0}">
					<a class="uk-button uk-button-default uk-margin-small-bottom "
						href="${pageContext.request.contextPath}/cart/add?command=plus&id=${model.id}"
						style="margin-top: 35px;">ADD TO CART</a>
				</c:if>
				<c:if test="${model.unitsInStock == 0}">
					<button class="uk-button uk-button-default uk-margin-small-bottom"
						disabled style="margin-top: 35px;">OUT OF STOCK</button>
				</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="tabdetail.jsp"></jsp:include>
	<jsp:include page="relatedproducts.jsp"></jsp:include>
</body>
</html>