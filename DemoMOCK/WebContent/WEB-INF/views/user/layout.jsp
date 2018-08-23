<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="icon" href="imgs/brand/favo.ico" type="image/x-icon" />
<jsp:include page="shared/lib.jsp"></jsp:include>
<script>
	new WOW().init();
</script>
<style type="text/css">
	.hp-footer {
	margin-top: 60px;
	padding-bottom: 40px;
}
</style>
</head>
<body>
	<c:if test="${not empty loginmessage}">
		<script>
			$(function() {
	    		var modal = UIkit.modal("#modal-login");
	    		modal.show(); 
			});
		</script>	
	</c:if>
	<c:if test="${not empty registermessage}">
		<script>
			$(function() {
	    		var modal = UIkit.modal("#modal-register");
	    		modal.show(); 
			});
		</script>	
	</c:if>
	
	<div class="uk-container">
		<jsp:include page="shared/header.jsp"></jsp:include>
		<jsp:include page="shared/menu.jsp"></jsp:include>
		<jsp:include page="${view}"></jsp:include>
		<jsp:include page="shared/footer.jsp"></jsp:include>
	</div>
</body>
</html>