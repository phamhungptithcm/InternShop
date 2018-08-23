<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<nav class="uk-navbar-container" id="hp-header" uk-navbar>

	<div class="uk-navbar-left">

		<ul class="uk-navbar-nav">
			<li class="uk-active"><a href="#">InternShop</a></li>

		</ul>

	</div>
	<div class="uk-navbar-center dml-inputmid">

		<div class="uk-navbar-item">
			<form class="uk-search uk-search-default" method="POST">

				<div class="dml-popup">

					<input id="dml-myInput" class="uk-search-input" type="text"
						placeholder="Search..." autocomplete="off" name="dml-name" />
					<button type="submit" value="Search" class="uk-search-icon-flip"
						uk-search-icon></button>

					<div class="dml-popuptext" id="dml-myPopup">
						<ul id="dml-myUL">
							<c:forEach items="${listproduct}" var="Product">
								<li><a
									href="${pageContext.request.contextPath}/product/detail?id=${Product.getId()}">${Product.getName()}</a></li>
							</c:forEach>
						</ul>
					</div>

				</div>

			</form>
		</div>

	</div>

	<div class="uk-navbar-right">

		<ul class="uk-navbar-nav">
			<li><a href="" class="uk-margin-small-right" uk-icon="twitter"></a></li>
			<li><a href="" class="uk-margin-small-right" uk-icon="facebook"></a></li>
			<li><a href="" class="uk-margin-small-right"
				uk-icon="google-plus"></a></li>
			<li><a href="${pageContext.request.contextPath}/home/about.php"
				style="text-transform: none;">About</a></li>

			<li class="uk-inline"><a
				href="${pageContext.request.contextPath}/cart/view"
				style="color: black;"><i class="fa fa-shopping-bag"
					aria-hidden="true"></i> <c:if
						test="${cart != null and cart.count != 0}">
						<span class="uk-badge">${cart.count}</span>
					</c:if> </a>
				<div uk-drop>
					<c:if test="${cart.count == 0}">
						<div
							class="uk-card uk-card-default uk-card-hover uk-card-body uk-text-center"
							style="width: 400px; height: 100px;">You have 0 items in
							your shopping cart.</div>
					</c:if>
					<c:if test="${cart.count !=0 }">
						<c:forEach var="item" items="${cart.item}">
							<div class="uk-card uk-card-default uk-card-hover uk-card-body"
								style="width: 430px; height: 100px;">
								<div class="uk-text-center" uk-grid>
									<div class="uk-width-1-4">
										<img data-src="imgs/product/${item.image}" width="30"
											height="50" alt="" uk-img>
									</div>
									<div class="uk-width-1-2 uk-text-left">${item.name}</div>
									<div class="uk-width-1-4">
										<a
											href="${pageContext.request.contextPath}/cart/add?command=remove&id=${item.id}"><span
											uk-icon="icon: trash"></span></a>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div></li>
			<c:if test="${user.admin == true}">
				<li><a
					href="${pageContext.request.contextPath}/admin/home/index.php"
					style="text-transform: none;"><i class="fa fa-cogs"
						aria-hidden="true"></i></a></li>
			</c:if>
		</ul>
	</div>
</nav>