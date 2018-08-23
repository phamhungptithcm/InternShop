$(document).ready(function(){
	var temp=0;
	$("#dml-myInput").focusin(function(){
		$("#dml-myInput").keyup(function(){
			temp=0;
			if($("#dml-myInput").val()!=""){
				$("#dml-myPopup").addClass("show");
				dmlFunction();
				if(temp==0){
					$("#dml-myPopup").removeClass("show");
				}
			}
			else{
				$("#dml-myPopup").removeClass("show");
			}
			
		});
	});



function dmlFunction() {
	    var input, filter, ul, li, a, i;
	    input = $("#dml-myInput").val();
	    filter = input.toUpperCase();
	    ul = document.getElementById("dml-myUL");
	    li = ul.getElementsByTagName("li");
	    
	    
	    for (i = 0; i < li.length; i++) { 	
	        a = li[i].getElementsByTagName("a")[0];
	        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
	            li[i].style.display = "";
	            temp=1;
	        } else {
	            li[i].style.display = "none";
	        }
	    }
	}
});

  