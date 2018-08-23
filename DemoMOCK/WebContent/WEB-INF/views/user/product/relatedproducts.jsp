<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="wow bounceInUp" data-wow-duration="0.3s"
	data-wow-delay="0.2s">
	<legend class="uk-legend uk-text-center">RELATED PRODUCTS</legend>
	<div class="uk-position-relative uk-visible-toggle uk-ligh" uk-slider>
		<ul
			class="uk-slider-items uk-child-width-1-2 uk-child-width-1-4@m uk-grid">
			<c:forEach var="p" items="${model.category.products}">
				<c:if test="${model.id != p.id}">
					<li>
						<div class="uk-panel">
							<div class="uk-animation-toggle">
								<a
									href="${pageContext.request.contextPath}/product/detail?id=${p.id}" style="text-decoration: none;">
									<div
										class="uk-animation-scale-up uk-card uk-card-default uk-card-body uk-text-center">
										<div class="hp-relatedproduct-body">
											<img src="imgs/product/${p.image}" />

										</div>
										<div class="hp-relatedproduct-name">
											<strong>${p.name}</strong>
										</div>
										<div
											style="color: #ffca28; font-weight: bold; font-size: 22px;">
											$${p.unitPrice}</div>
									</div>
								</a>
							</div>
							<div class="uk-position-center uk-panel"></div>
						</div>
					</li>
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
</div>
