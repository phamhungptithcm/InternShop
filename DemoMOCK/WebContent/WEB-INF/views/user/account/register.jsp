<%@ page pageEncoding="utf-8"%>

<div id="modal-register" class="uk-flex-top" uk-modal>
	<div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">
		<button class="uk-modal-close-default" type="button" uk-close></button>
		<form method="post" action="${pageContext.request.contextPath}/account/login?command=register" id="nt-registerform">
			<div class="uk-alert-warning uk-text-center" uk-alert>
				<p>SIGNUP</p>
			</div>
			<div class="uk-text-center">
				<div uk-grid>
					<div class="uk-width-1-2">
						<div class="uk-margin">
							<div class="uk-inline">
								<input class="uk-input" type="text" name="username" placeholder="Username">
							</div>
						</div>
					</div>
					<div class="uk-width-1-2">
						<div class="uk-margin">
							<div class="uk-inline">
								<input class="uk-input" type="text" name="fullname" placeholder="Fullname..." value="${fullname}">
							</div>
						</div>
					</div>
				</div>
				<div uk-grid>
					<div class="uk-width-1-2">
						<div class="uk-margin">
							<div class="uk-inline">
								<input class="uk-input" type="password" name="password1" id="password1" placeholder="Password...">
							</div>
						</div>
					</div>
					<div class="uk-width-1-2">
						<div class="uk-margin">
							<div class="uk-inline">
								<input class="uk-input" type="password" name="password2" placeholder="Confirm password...">
							</div>
						</div>
					</div>
				</div>
				<div uk-grid>
					<div class="uk-width-1-2">
						<div class="uk-margin">
							<div class="uk-inline">
								<input class="uk-input" type="email" name="email" placeholder="Email..." value="${email}">
							</div>
						</div>
					</div>
					<div class="uk-width-1-2">
						<div class="uk-margin">
							<div class="uk-inline">
								<input class="uk-input" type="text" name="phone" placeholder="Phone number..." value="${phone}">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="js-upload uk-placeholder uk-text-center">
				<span uk-icon="icon: cloud-upload"></span> 
				<span class="uk-text-middle">Attach images by dropping them here or</span>
				<div uk-form-custom>
					<input type="file" name="pic" multiple> <span class="uk-link">selecting one</span>
				</div>
			</div>
			
			<div id="nt-registererror">${registermessage}</div>
			
			<div style="background-color: white;" uk-alert></div>
			<div class="uk-text-center">
				<div uk-grid>
					<div class="uk-width-1-2">
						<button class="uk-button uk-button-primary" href="#modal-login" uk-toggle>Login</button>
					</div>
					<div class="uk-width-1-2">
						<button class="uk-button uk-button-default" style="background-color: #ffca28" type="submit">Signup</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>