$(document).ready(function() {

	// Get the modal
	var modal = document.getElementById('id01');

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
});

$(document).ready(function(){
	$("#nt-loginform").validate({
		rules: {
			username: {required: true},
			password: {required: true}
		},
		messages: {
			username: "Pleaase input your username",
			password: "Please input your password"
		},
	});
});

