$(document).ready(function(){
	$("#nt-registerform").validate({
		rules: {
			username: {
				required: true,
				minlength: 3
			},			
			fullname: {
				required: true
			},
			password1: {
				required: true,
				minlength: 6
			},
			password2: {
				required: true,
				equalTo: password1
			},
			email: {
				required: true,
				email: true
			},
			phone: {
				required: true,
				minlength: 9
			}
		},
		messages: {
			username: {
				required: "Please enter a username",
				minlength: "At least 3 characters"
			},
			fullname: {
				required: "Please enter your name"
			},
			password1: {
				required: "Please enter a password",
				minlength: "At least 6 characters"
			},
			password2: {
				required: "Please enter confirm password",
				equalTo: "Password doesn't match"
			},
			email: "Please enter a valid email",
			phone: {
				required: "Please enter phone number",
				minlength: "Not enough number"
			}
		},
	});
});