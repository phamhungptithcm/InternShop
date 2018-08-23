<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/css/bootstrap.min.css" /> -->		
	<link rel="stylesheet" type="text/css"  href="css/mycss/list-product.css">  
	<link rel="stylesheet" type="text/css"  href="css/mycss/dml-Cus.css">   
		
	<!-- Unikit -->
	<link rel="stylesheet" href="css/uikit.min.css" />
	<script src="js/uikit.min.js"></script>
	<script src="js/uikit-icons.min.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
	<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
	<script src="js/dml-popup.js" type="text/javascript"></script>
	<script src="js/dml-PaginationAcc.js" type="text/javascript"></script>
	<script src="js/dml-account.js" type="text/javascript"></script>
	<title>Customer Management | Admin Management</title>
</head>
<body>	

	<input type="hidden" id="mess" value="${mess}">

			 <form class="uk-search uk-search-default" id="dmmid" method="POST" style="margin-top: 15px;">
			
				<div class="dml-popup">
			
					<input id="dml-myInput" class="uk-search-input" type="text" placeholder="Search..." autocomplete="off" name="dmlname" style="width: 300px; margin: 0 auto;"/>				
					<button name="action" type="submit" value="Search" class="uk-search-icon-flip" uk-search-icon></button>
					
					<div  class="dml-popuptext" id="dml-myPopup">
					<ul id="dml-myUL">
						<c:forEach items="${ListSearch}" var="Cus">
							<input type="hidden" value="${Cus.getId()}" name="getid"/>	
							
						    <li><a href="${pageContext.request.contextPath}/admin/Customer?getida=${Cus.getId()}">${Cus.getId()} (${Cus.getFullname()})</a></li>
						</c:forEach>
					</ul>
					</div>
					
				</div>  
				
			</form>
			

	<input type="hidden" id="total" value="${total}">
	<div class="wrapper">
	<a hidden href="#modal-example" id="modal-show" style="text-decoration: none" uk-toggle><i class="fa fa-list-alt list"></i></a>
		<!-- <div class="fonttext"> Manage User: </div> -->
		<table class="uk-table uk-table-responsive uk-table-divider">
		  <tr>
		  	
		    <th>UserID</th>
		    <th>Fullname</th>
		    <th>Phone</th>
		    <th>Email</th>
		    <th>Admin</th>
		    <th><button id="add-btn" class="classbutton buttonaddnew" onclick="document.getElementById('id01').style.display='block'"><i class="fa fa-plus-square"></i></button></th>
		    
		   <!--  <th><button id="add-btn" class="classbutton buttonadd" onclick="document.getElementById('id01').style.display='block'">Add</button></th> -->
		    <th style="text-align: center;">Del</th>
		    <th>Info</th>
		  </tr>
		   <c:forEach items="${dmlListCus}" var="customer" >
		    		
			          <tr class="contentPage"> 
			            <td >${customer.getId()}</td>
			            <td>${customer.getFullname()}</td>
			          	<td>${customer.getPhone()}</td>
			          	<td>${customer.getEmail()}</td>   
			          	<c:if test="${customer.getAdmin()}">   
			          		<td style="color: DodgerBlue">${customer.getAdmin()}</td> 
			          		<!-- <td><button class="classbutton buttonadd update-btn">Update</button></td> -->
			          		<td><button class="classbutton buttonadd update-btn"><i class="fa fa-edit"></i></button></td>
			          		<form method="POST">
			          			<input type="hidden" value="${customer.getId()}" name="id"/>
			          			<td><button class="classbutton buttondel delete-btn" type="submit" name="action" value="postdel"><i class="fa fa-trash"></i></button></td>
			          			<!-- <td><button class="classbutton buttondel delete-btn" type="submit" name="action" value="postdel">Del</button></td> -->
			          			<td></td>
			          		</form>
			          	</c:if>
			          	<c:if test="${not customer.getAdmin()}">
			          		<td>${customer.getAdmin()}</td>
			          		<td><i class="fa fa-ban ban"></i></td>
			          		<td><i class="fa fa-ban ban"></i></td>
			          			
							<td><a class="info" style="text-decoration: none"><i class="fa fa-list-alt list"></i></a>
			          			<div id="modal-example" class="uk-flex-top" uk-modal>
								    <div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical" style="width: 900px;">
								
								        <button class="uk-modal-close-default" type="button" uk-close></button>
								
								       	<table class="uk-table uk-table-responsive uk-table-divider">
								       		<tr>
											  
											    <th>OrderId</th>
											    <th>Date</th>
											    <th>ShipDate</th>
											    <th>ShipAddress</th>
											    <th>Note</th>
											    <th>Status</th>
										  	</tr>	
										  	<tbody id="order-info">
										  						  		
										  	</tbody>								 
								       	</table>
								
								    </div>
								</div>
			          		
			          		
							</td>	
										          	
			          	</c:if> 		          	
			          </tr>
	       </c:forEach>	  
		</table>
	</div>
	

	
	

		
		<div id="id01" class="modal">
		  
		  <form class="modal-content animate" method="POST" accept-charset="UTF-8">
		    <div class="imgcontainer">
		      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
		      
		    </div>
		
		    <div class="container">
		    	<div style="text-align: center; color: DodgerBlue; font-size: 25px;"><strong>Admin Account</strong></div>
		      <label><b>UserID</b></label>
		      <input type="text" style="padding: 8px;" id="username" placeholder="Enter Username" name="userid" autocomplete="off" required>
		
		      <label><b>Password</b></label>
		      <input type="text" style="padding: 8px;" id="password" placeholder="Enter Password" name="pass" autocomplete="off" required>
		      
		      <label ><b>Fullname</b></label>
		      <input type="text" style="padding: 8px;" id="fullname"  placeholder="Enter Fullname" name="name" autocomplete="off" required>
		
		      <label><b>Phone</b></label>
		      <input type="text" style="padding: 8px;" id="phone" placeholder="Enter Phone" name="phone" autocomplete="off" required>
		      
		      <label><b>Email</b></label>
		      <input type="text" style="padding: 8px;" id="email" placeholder="Enter Email" name="email" autocomplete="off" required>
		
		      <label><b>Image</b></label>
		      <input type="text" style="padding: 8px;" id="img" placeholder="Enter Image Link" name="image" autocomplete="off" required>
		      
		      
		      	<button class="classbutton buttonadd" type="submit" name="action" value="postone" style="font-size: 20px">Done</button>
		      
		    </div>
		
		    
		  </form>
		</div>
		
		<div style="width: 500px; margin:auto;">
			<ul class="uk-pagination" id="pagination"></ul>
		</div>

</body>
</html>