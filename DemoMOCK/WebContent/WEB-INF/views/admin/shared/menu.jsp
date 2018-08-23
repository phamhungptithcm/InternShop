<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div>
	<nav class="uk-navbar-container" id="hp-navbar" uk-navbar>
		<div class="uk-navbar-left">
			<ul class="uk-navbar-nav">
				<li class="uk-active"><a href="${pageContext.request.contextPath}/admin/home/index.php">HOME</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/order?command=view" style="color: white;">Orders</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/product" style="color: white;">Products</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/Customer" style="color: white;">Customers</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/category?command=view" style="color: white;">Categories
						& Suppliers</a>
					<div class="uk-navbar-dropdown">
						<ul class="uk-nav uk-navbar-dropdown-nav">
							<li class="uk-active"><a href="${pageContext.request.contextPath}/admin/category?command=view" >Category</a></li>
							<li class="uk-active"><a href="${pageContext.request.contextPath}/admin/supplier?command=view" >Supplier</a></li>
						</ul>
					</div></li>
					<li><a href="${pageContext.request.contextPath}/admin/revenue" style="color: white;">Revenue</a></li>
			</ul>
		</div>

		<div class="uk-navbar-right">

			<ul class="uk-navbar-nav">
				<li><i class="fa fa-user-circle fa-2x" aria-hidden="true"
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
					</div></li>
			</ul>

		</div>

	</nav>
</div>
