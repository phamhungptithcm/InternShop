<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Billing Infomation | InternShop</title>
<script type="text/javascript">
$( document ).ready(function() {
	var messagefail = $("#messagefail").val();
	if(messagefail !="")
	{
		alert (messagefail);
	}
}); 
</script>
</head>
<body>
<input type="hidden" id="messagefail" value="${messagefail}">
<div class="step1">
	<form method="post" action="order/bilinfo.php">
		<div class="uk-card uk-card-default uk-card-body">
			<p>ACCOUNT INFORMATION</p>
			<div class="uk-margin">
				<input class="uk-input" type="text" placeholder="E-mail Address" name ="email" value="${user.email}">
			</div>
			<ul>
				<li>Thank ${user.id}</li>
			</ul>
		</div>
		<div class="uk-card uk-card-default uk-card-body uk-margin">
			<p>BILLING INFORMATION</p>
			<div class="uk-text-center">
				<div class="uk-margin">
					<input class="uk-input" type="text" placeholder="Fullname" name ="fullname" value="${user.fullname}">
				</div>

				<div class="uk-margin">
					<input class="uk-input" type="text" placeholder="Address*" name="address" value="${billinginfo.address}">
				</div>
				<div class="uk-margin">
					<input class="uk-input" type="text" placeholder="Phone" name="phone" value="${user.phone}">
				</div>
				<div class="uk-text-center" uk-grid>
					<div class="uk-width-1-2">
						<div class="uk-margin">
							<input class="uk-input" type="text" placeholder="Country" name="country" value="${billinginfo.country}">
						</div>
					</div>
					<div class="uk-width-1-4">
						<div class="uk-margin">
							<input class="uk-input" type="text" placeholder="City" name="city">
						</div>
					</div>
					<div class="uk-width-1-4">
						<div class="uk-margin">
							<input class="uk-input" type="text" placeholder="Postal code" name="postcode" value="${billinginfo.postCode}">
						</div>
					</div>
				</div>
				<div class="uk-margin uk-text-right">
					<button type="submit" class="uk-button uk-button-default">Next
						Step</button>
				</div>
			</div>
		</div>
	</form>
</div>
</body>
</html>