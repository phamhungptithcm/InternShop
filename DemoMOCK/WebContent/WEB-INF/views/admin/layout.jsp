<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="icon" href="imgs/brand/favo.ico" type="image/x-icon" />
<jsp:include page="shared/lib.jsp"></jsp:include>
</head>
<body>
	<div class="uk-container">
		<jsp:include page="shared/header.jsp"></jsp:include>
		<jsp:include page="shared/menu.jsp"></jsp:include>
		<jsp:include page="${view}"></jsp:include>
		<div class="uk-text-center" style="margin-top: 50px;background-color: #eeeeee ">
			<footer class="panel panel-default row">
				<div class="panel-heading">
					<p class="text-center">InternShip Java 13&copy; 2018 All rights
						reserved.</p>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>