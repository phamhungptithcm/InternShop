<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div>
	<nav class="uk-navbar-container" id="hp-navbar" uk-navbar>
		<div class="uk-navbar-left">
			<ul class="uk-navbar-nav">
				<li class="uk-active"><a
					href="${pageContext.request.contextPath}/home/index.php"> <img
						data-src="imgs/brand/favoIcon.png" width="40" height="40" uk-img
						style="color: yellow;">
				</a></li>
				<li><a style="color: white;"
					href="${pageContext.request.contextPath}/product/listbycategory?command=1">Mobiles</a>
					<div class="uk-navbar-dropdown uk-navbar-dropdown-width-2">
						<div class="uk-navbar-dropdown-grid" uk-grid>
							<div class="uk-width-1-2">
								<ul class="uk-nav uk-navbar-dropdown-nav">
									<li class="uk-active"><a
										href="${pageContext.request.contextPath}/product/listbysupplier?sup=AP&cate=1">iPhone</a></li>
									<li><a
										href="${pageContext.request.contextPath}/product/listbysupplier?sup=OP&cate=1">Oppo</a></li>
									<li><a
										href="${pageContext.request.contextPath}/product/listbysupplier?sup=AS&cate=1">Asus</a></li>
									<li><a
										href="${pageContext.request.contextPath}/product/listbysupplier?sup=HU&cate=1">Huawei</a></li>
								</ul>
							</div>
							<div class="uk-width-1-2">
								<ul class="uk-nav uk-navbar-dropdown-nav">
									<li class="uk-active"><a
										href="${pageContext.request.contextPath}/product/listbysupplier?sup=SA&cate=1">SamSung</a></li>
									<li><a
										href="${pageContext.request.contextPath}/product/listbysupplier?sup=SO&cate=1">Sony</a></li>
									<li><a
										href="${pageContext.request.contextPath}/product/listbysupplier?sup=HT&cate=1">HTC</a></li>
								</ul>
							</div>
						</div>
					</div></li>
				<li><a href="${pageContext.request.contextPath}/product/listbycategory?command=3"
					style="color: white;">Laptops</a>
					<div class="uk-navbar-dropdown">
						<ul class="uk-nav uk-navbar-dropdown-nav">
							<li class="uk-active"><a
								href="${pageContext.request.contextPath}/product/listbysupplier?sup=AP&cate=3">Macbook</a></li>
							<li><a
								href="${pageContext.request.contextPath}/product/listbysupplier?sup=DE&cate=3">Dell</a></li>
							<li><a
								href="${pageContext.request.contextPath}/product/listbysupplier?sup=AC&cate=3">Acer</a></li>
							<li><a
								href="${pageContext.request.contextPath}/product/listbysupplier?sup=AS&cate=3">Asus</a></li>
							<li><a
								href="${pageContext.request.contextPath}/product/listbysupplier?sup=MS&cate=3">MSI</a></li>
						</ul>
					</div></li>
				<li><a href="${pageContext.request.contextPath}/product/listbycategory?command=2"
					style="color: white;">Tablets</a>
					<div class="uk-navbar-dropdown">
						<ul class="uk-nav uk-navbar-dropdown-nav">
							<li class="uk-active"><a
								href="${pageContext.request.contextPath}/product/listbysupplier?sup=AP&cate=2">iPad</a></li>
							<li><a
								href="${pageContext.request.contextPath}/product/listbysupplier?sup=SA&cate=2">SamSung</a></li>
							<li><a
								href="${pageContext.request.contextPath}/product/listbysupplier?sup=AS&cate=2">Asus</a></li>
							<li><a
								href="${pageContext.request.contextPath}/product/listbysupplier?sup=HU&cate=2">Huawei</a></li>
						</ul>
					</div></li>
				<li><a
					href="${pageContext.request.contextPath}/product/listbycategory?command=4"
					style="color: white;">Accessories</a></li>
			</ul>

		</div>
		<div class="uk-navbar-right">
			<ul class="uk-navbar-nav">
				<li><c:if test="${sessionScope.user == null}">
						<a href="#modal-login" uk-toggle> <i
							class="fa fa-user-circle fa-2x" aria-hidden="true"
							style="color: white;"> </i></a>
						<jsp:include page="../account/login.jsp"></jsp:include>
						<jsp:include page="../account/register.jsp"></jsp:include>
					</c:if> <c:if test="${sessionScope.user != null}">
						<i class="fa fa-user-circle fa-2x" aria-hidden="true"
							style="color: white; margin-right: 15px;"></i>
						<div class="uk-navbar-dropdown">
							<ul class="uk-nav uk-navbar-dropdown-nav">
								<li><a
									href="${pageContext.request.contextPath}/account/login"
									style="color: black;">My Account</a></li>
								<li><a
									href="${pageContext.request.contextPath}/account/login?command=logout"
									style="color: black;">Log Out</a></li>
							</ul>
						</div>
					</c:if></li>
			</ul>
		</div>
	</nav>
</div>
