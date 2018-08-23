<%@ page pageEncoding="utf-8"%>

<div id="modal-login" class="uk-flex-top" uk-modal>
	<div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">
		<button class="uk-modal-close-default" type="button" uk-close></button>
		
		<form method="post" action="${pageContext.request.contextPath}/account/login?command=login" id="nt-loginform">
			<div class="uk-alert-primary uk-text-center" uk-alert>
				<p>LOGIN</p>
			</div>
			<div class="uk-text-center">
				<div class="uk-margin">
					<div class="uk-inline">
						<label for="user">Username</label> 
						<input class="uk-input uk-form-width-large" type="text" name="username" value="${username}">
					</div>
				</div>
				<div class="uk-margin">
					<div class="uk-inline">
						<label for="pass">Password</label> 
						<input class="uk-input uk-form-width-large" type="password" name="password">
					</div>
				</div>
			</div>
			<div uk-grid>
				<div class="uk-width-1-2">
					<div class="form-group form-check">
						<input type="radio" class="form-check-input" name="remember">
						<label class="form-check-label" for="remember">Remember me?</label>
					</div>
				</div>
				<div class="uk-width-1-2">
					<div class="form-group form-check uk-text-right">
						<button class="uk-button uk-button-default" style="background-color: #FFFFFF" href="#modal-forgotpassword" uk-toggle>Forgot Password</button>
					</div>
				</div>
			</div>
			
			<div id="nt-loginerror">${loginmessage}</div>
			
			<div style="background-color: white;" uk-alert></div>
			<div class="uk-text-center">
				<div uk-grid>
					<div class="uk-width-1-2">
						<button type="submit" class="uk-button uk-button-primary" id="nt-loginbtn">Login</button>
					</div>
					<div class="uk-width-1-2">
						<button class="uk-button uk-button-default" style="background-color: #ffca28" href="#modal-register" uk-toggle>Signup</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>