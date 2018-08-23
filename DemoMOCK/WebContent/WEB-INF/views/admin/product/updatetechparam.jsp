<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<br>
<div class="uk-container uk-container-large">
<form method="post"
	action="${pageContext.request.contextPath}/admin/modify/update?command=updatetechparam">
	<div class="uk-alert-primary uk-text-center" uk-alert>
		<p>Update Techinical Parameters</p>
	</div>
	<div class="uk-text-center">
		<div uk-grid>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline uk-form-width-large">
						<input class="uk-input" type="text" name="cpu" placeholder="CPU"
							value="${product.technicalParam.cpu}" required>
					</div>
				</div>
			</div>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline uk-form-width-large">
						<input class="uk-input" type="text" name="ram" placeholder="RAM"
							value="${product.technicalParam.ram}" required>
					</div>
				</div>
			</div>
		</div>
		<div uk-grid>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline uk-form-width-large">
						<input class="uk-input" type="text" name="driver"
							placeholder="Driver" value="${product.technicalParam.drive}"
							required>
					</div>
				</div>
			</div>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline uk-form-width-large">
						<input class="uk-input" type="text" name="screen"
							placeholder="Screen" value="${product.technicalParam.screen}"
							required>
					</div>
				</div>
			</div>
		</div>
		<div uk-grid>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline uk-form-width-large">
						<input class="uk-input" type="text" name="screencard"
							placeholder="Screen Card"
							value="${product.technicalParam.screenCard}" required>
					</div>
				</div>
			</div>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline uk-form-width-large">
						<input class="uk-input" type="text" name="connectionport"
							placeholder="Connection Port"
							value="${product.technicalParam.connectionPort}" required>
					</div>
				</div>
			</div>
		</div>
		<div uk-grid>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline uk-form-width-large">
						<input class="uk-input" type="text" name="operatingsystem"
							placeholder="Operating System"
							value="${product.technicalParam.operatingSystem}" required>
					</div>
				</div>
			</div>
			<div class="uk-width-1-2">
				<div class="uk-margin">
					<div class="uk-inline uk-form-width-large">
						<input class="uk-input" type="text" name="size" placeholder="Size"
							value="${product.technicalParam.size}" required>
					</div>
				</div>
			</div>
			<input type="hidden" value="${product.technicalParam.id}" name="tid">
		</div>
	</div>
	<div class="uk-text-center"
		style="margin-top: 40px; margin-left: 40px; margin-right: 40px;">
		<button class="uk-button uk-button-primary uk-width-1-1" type="submit">Update</button>
	</div>
</form>
</div>