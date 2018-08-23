<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Hello</title>
</head>
<body>
	<div style="margin-top: 30px;">
		<jsp:include page="revenueByCate.jsp"></jsp:include>
		<jsp:include page="revenueBySupp.jsp"></jsp:include>
		<jsp:include page="revenueByProduct.jsp"></jsp:include>
		<jsp:include page="revenueByCustomer.jsp"></jsp:include>
		<jsp:include page="revenueByMonth.jsp"></jsp:include>
		<jsp:include page="revenueByQuarter.jsp"></jsp:include>
		<jsp:include page="revenueByYear.jsp"></jsp:include>
	</div>
</body>
</html>