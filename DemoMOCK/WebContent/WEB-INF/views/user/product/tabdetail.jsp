<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="tabs wow slideInUp" data-wow-duration="0.3s"
	data-wow-delay="0.2s" id="review">
	<div class="tab-2">
		<label for="tab2-1">PRODUCT DESCRIPTION</label> <input id="tab2-1"
			name="tabs-two" type="radio" checked="checked">
		<div>
			<div class="uk-text-left" uk-grid>
				<div class="uk-width-1-2">
					<div>
						<p>${model.description}</p>
						<div class="uk-text-center">
							<button class="uk-button uk-button-default uk-margin"
								type="button" uk-toggle="target: +">video product
								reviews</button>

							<video controls playsinline hidden uk-video>
								<source
									src="https://quirksmode.org/html5/videos/big_buck_bunny.mp4"
									type="video/mp4">
							</video>
						</div>
					</div>
				</div>
				<div class="uk-width-1-2">
					<div>
						<table class="uk-table uk-table-divider">
							<tbody>
								<tr>
									<td>CPU</td>
									<td>${model.technicalParam.cpu}</td>
								</tr>
								<tr>
									<td>RAM</td>
									<td>${model.technicalParam.ram}</td>
								</tr>
								<tr>
									<td>Drive</td>
									<td>${model.technicalParam.drive}</td>
								</tr>
								<tr>
									<td>Screen</td>
									<td>${model.technicalParam.screen}</td>
								</tr>
								<tr>
									<td>ScreenCard</td>
									<td>${model.technicalParam.screenCard}</td>
								</tr>
							</tbody>
						</table>
						<div class="uk-text-center">
							<a class="uk-button uk-button-default" href="#modal-full"
								uk-toggle>See Detailed Configuration</a>

							<div id="modal-full" class="uk-modal-full" uk-modal>
								<div class="uk-modal-dialog">
									<button class="uk-modal-close-full uk-close-large"
										type="button" uk-close></button>
									<div class="uk-padding-large">
										<div class="uk-card uk-card-default uk-card-body" style="background-color: #eceff1;">
											<table class="uk-table uk-table-divider">
												<tbody>
													<tr>
														<td>
														
															CPU
														</td>
														<td>${model.technicalParam.cpu}</td>
													</tr>
													<tr>
														<td>RAM</td>
														<td>${model.technicalParam.ram}</td>
													</tr>
													<tr>
														<td>Screen</td>
														<td>${model.technicalParam.screen}</td>
													</tr>
													<tr>
														<td>ScreenCard</td>
														<td>${model.technicalParam.screenCard}</td>
													</tr>
													<tr>
														<td>Drive</td>
														<td>${model.technicalParam.drive}</td>
													</tr>
													<tr>
														<td>Connection Port</td>
														<td>${model.technicalParam.connectionPort}</td>
													</tr>
													<tr>
														<td>Operating System</td>
														<td>${model.technicalParam.operatingSystem}</td>
													</tr>
													<tr>
														<td>Size</td>
														<td>${model.technicalParam.size}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="tab-2">
		<label for="tab2-2">REVIEWS</label> <input id="tab2-2" name="tabs-two"
			type="radio">
		<div>
			<div class="uk-text-right" uk-grid>
				<div class="uk-width-1-4">
					<div class="uk-text-left">
						<h6>
							<b>How do you rate this product?</b>
						</h6>
						<span>Quality</span><jsp:include
								page="../shared/voteRating.jsp"></jsp:include>
					</div>
				</div>
				<div class="uk-width-3-4">
					<form>
						<div class="uk-margin">
							<input class="uk-input" type="text" placeholder="Your email"
								style="width: 80%">
						</div>

						<div class="uk-margin">
							<input class="uk-input" type="text"
								placeholder="Summary of your review" style="width: 80%">
						</div>

						<div class="uk-margin">
							<textarea class="uk-textarea" rows="5" placeholder="Comment"
								style="width: 80%"></textarea>
						</div>
						<div>
							<button class="uk-button uk-button-default" formaction="#">Save</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>