<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home | InternShop</title>
<style type="text/css">
.hp-slidehome {
	height: 150px;
}

.hp-slidehome img {
	width: 70%;
	height: 150px;
}

.hp-slidehomel {
	height: 150px;
}

.hp-slidehomel img {
	width: 94%;
	height: 150px;
}

.hp-slidehome-name {
	height: 20px;
}

.hp-slidehome-namel {
	height: 40px;
}

.hp-slidehome-price {
	color: #ffca28;
	font-weight: bold;
	font-size: 22px;
	height: 10px;
}
</style>
</head>
<body>
	<div class="uk-alert-warning" uk-alert>
		<p>THE MOST PROMINENT PHONE</p>
	</div>
	<hr>
	<div
		class="uk-position-relative uk-visible-toggle uk-light hp-newproduct"
		uk-slider>
		<ul
			class="uk-slider-items uk-child-width-1-2 uk-child-width-1-4@m uk-grid">
			<c:forEach var="m" items="${mobiles}">
				<c:if test="${m.viewHome}">
					<li><a
						href="${pageContext.request.contextPath}/product/detail?id=${m.id}">
							<div class="uk-panel">
								<div class="uk-animation-toggle">
									<div
										class="uk-animation-slide-bottom-small uk-card uk-card-default uk-card-body uk-text-center">
										<div class="hp-slidehome">
											<img src="imgs/product/${m.image}" />
										</div>
										<div class="hp-slidehome-name">
											<strong>${m.name}</strong>
										</div>
										<div class="hp-slidehome-price">$${m.unitPrice}</div>
									</div>
								</div>
								<div class="uk-position-center uk-panel"></div>
							</div>
					</a></li>
				</c:if>
			</c:forEach>
		</ul>

		<a style="color: black;"
			class="uk-position-center-left uk-position-small uk-hidden-hover"
			href="#" uk-slidenav-previous uk-slider-item="previous"></a> <a
			style="color: black;"
			class="uk-position-center-right uk-position-small uk-hidden-hover"
			href="#" uk-slidenav-next uk-slider-item="next"></a>
	</div>
	<hr>
	<div class="uk-alert-warning" uk-alert>
		<p>THE MOST PROMINENT TABLET</p>
	</div>
	<hr>
	<div
		class="uk-position-relative uk-visible-toggle uk-light hp-newproduct"
		uk-slider>
		<ul
			class="uk-slider-items uk-child-width-1-2 uk-child-width-1-4@m uk-grid">
			<c:forEach var="t" items="${tablets}">
				<c:if test="${t.viewHome}">
					<li><a
						href="${pageContext.request.contextPath}/product/detail?id=${t.id}">
							<div class="uk-panel">
								<div class="uk-animation-toggle">
									<div
										class="uk-animation-slide-bottom-small uk-card uk-card-default uk-card-body uk-text-center">
										<div class="hp-slidehome">
											<img src="imgs/product/${t.image}" />
										</div>
										<div class="hp-slidehome-name">
											<strong>${t.name}</strong>
										</div>
										<div class="hp-slidehome-price">$${t.unitPrice}</div>
									</div>
								</div>
								<div class="uk-position-center uk-panel"></div>
							</div>
					</a></li>
				</c:if>
			</c:forEach>
		</ul>

		<a style="color: black;"
			class="uk-position-center-left uk-position-small uk-hidden-hover"
			href="#" uk-slidenav-previous uk-slider-item="previous"></a> <a
			style="color: black;"
			class="uk-position-center-right uk-position-small uk-hidden-hover"
			href="#" uk-slidenav-next uk-slider-item="next"></a>
	</div>

	<hr>
	<div class="uk-alert-warning" uk-alert>
		<p>THE MOST PROMINENT LAPTOP</p>
	</div>
	<hr>
	<div
		class="uk-position-relative uk-visible-toggle uk-light hp-newproduct"
		uk-slider>
		<ul
			class="uk-slider-items uk-child-width-1-2 uk-child-width-1-4@m uk-grid">
			<c:forEach var="l" items="${laptops}">
				<c:if test="${l.viewHome}">
					<li><a
						href="${pageContext.request.contextPath}/product/detail?id=${l.id}">
							<div class="uk-panel">
								<div class="uk-animation-toggle">
									<div
										class="uk-animation-slide-bottom-small uk-card uk-card-default uk-card-body uk-text-center">
										<div class="hp-slidehomel">
											<img src="imgs/product/${l.image}" />
										</div>
										<div class="hp-slidehome-namel">
											<strong>${l.name}</strong>
										</div>
										<div class="hp-slidehome-price">$${l.unitPrice}</div>
									</div>
								</div>
								<div class="uk-position-center uk-panel"></div>
							</div>
					</a></li>
				</c:if>
			</c:forEach>
		</ul>

		<a style="color: black;"
			class="uk-position-center-left uk-position-small uk-hidden-hover"
			href="#" uk-slidenav-previous uk-slider-item="previous"></a> <a
			style="color: black;"
			class="uk-position-center-right uk-position-small uk-hidden-hover"
			href="#" uk-slidenav-next uk-slider-item="next"></a>
	</div>
	<hr>
</body>
</html>