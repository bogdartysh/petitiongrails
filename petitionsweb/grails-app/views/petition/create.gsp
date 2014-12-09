<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="uk">
<head>
<title>Онлайн петиції до державних органів України та посадовців</title>
<meta charset="UTF-8" />
<meta name="robots" content="index, follow" />

</head>

<body>
	<div id="page-wrapper">
		<header>
			<h1>
				<g:link uri="/">Онлайн петиції до державних органів України та посадовців.</g:link>
			</h1>
			<h2 class="pane-title">
				<g:link controller="Addressee" params="[id:addressee.id]">
					${addressee.title}
				</g:link>

			</h2>
		</header>
		<article>

			<div id="page">

				<div id="main">
					<p>
						Ви подаєте петицію до
						<g:link controller="Addressee" params="[id:addressee.id]">
							${addressee.title}
						</g:link>
						.
					</p>
					<div class="form-inner">
						<form accept-charset="UTF-8" method="post" name="new_petition"
							action="submit">
							<fieldset class="form-element-type-fieldset" id="name">
								<legend>Ваше ім'я</legend>
								<p>Просимо надати Ваше повне ім'я (за бажанням):</p>
								<div class="form-form-element-wrapper">
									<div class="form-item form-item-textfield">
										<div class="form-label">
											<label for="edit-first-name">Ім'я </label>
										</div>
										<div class="form-input textfield">
											<input type="text" name="firstName" size="100"
												class="form-text required form-element-type-textfield" />
										</div>
									</div>
								</div>

								<div class="form-form-element-wrapper">
									<div class="form-item form-item-textfield">
										<div class="form-label">
											<label for="edit-first-name">По-батькові</label>
										</div>
										<div class="form-input textfield">
											<g:textField name="secondName" size="100"
												class="form-text required form-element-type-textfield" />
										</div>
									</div>
								</div>
								<div class="form-form-element-wrapper">
									<div class="form-item form-item-textfield "
										id="edit-middle-name-wrapper">
										<div class="form-label">
											<label for="edit-middle-name">Прізвище</label>
										</div>
										<div class="form-input textfield">
											<input type="text" name="lastName" size="100"
												class="form-text required form-element-type-textfield" />
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend>Контактні дані</legend>
								<p>Просимо надати Ваші контактні дані (за бажанням):</p>
								<div class="form-form-element-wrapper">
									<div class="form-item form-item-textfield "
										id="edit-middle-name-wrapper">
										<div class="form-label">
											<label for="edit-middle-name">Email</label>
										</div>
										<div class="form-input textfield">
											<input id="email" name="email" type="email" size="100"
												class="form-text required form-element-type-textfield" />
										</div>
									</div>
								</div>

								<div class="form-form-element-wrapper">
									<div class="form-item form-item-textfield "
										id="edit-middle-name-wrapper">
										<div class="form-label">
											<label for="edit-middle-name">Телефон</label>
										</div>
										<div class="form-input textfield">
											<input id="phone" name="phone" type="tel" size="20"
												class="form-text required form-element-type-textfield" />
										</div>
									</div>
								</div>

								<div class="form-form-element-wrapper">
									<div class="form-item form-item-textfield "
										id="edit-middle-name-wrapper">
										<div class="form-label">
											<label for="edit-middle-name">Персональний сайт</label>
										</div>
										<div class="form-input textfield">
											<input id="personalPage" name="personalPage" type="url"
												size="100"
												class="form-text required form-element-type-textfield" />
										</div>
									</div>
								</div>

								<div class="form-form-element-wrapper">
									<div class="form-item form-item-textfield "
										id="edit-middle-name-wrapper">
										<div class="form-label">
											<label for="edit-middle-name">Поштова адреса</label>
										</div>
										<div class="form-input textfield">
											<input type="text" name="postalAddress" size="100"
												class="form-text required form-element-type-textfield" />
										</div>
									</div>
								</div>
							</fieldset>

							<fieldset>
								<legend>Петиція</legend>
								<p>Просимо заповнити петицію:</p>
								<div class="form-form-element-wrapper">
									<div class="form-item form-item-textfield "
										id="edit-middle-name-wrapper">
										<div class="form-label">
											<label for="edit-middle-name">Назва</label>
										</div>
										<div class="form-input textfield">
											<input type="text" id="title" name="title" required
												size="400"
												class="form-text required form-element-type-textfield" />
										</div>
										<div class="form-error" id="error.title"></div>
									</div>

									<div class="form-form-element-wrapper">
										<div class="form-item form-item-textfield "
											id="edit-middle-name-wrapper">
											<div class="form-label">
												<label for="edit-middle-name">Опис</label>
											</div>
											<div class="form-input">
												<input type="textared" id="description" name="description"
													rows="10" required
													class="form-text required form-element-type-textfield" />
											</div>
										</div>
									</div>

									<div class="form-form-element-wrapper">
										<div class="form-item form-item-textfield "
											id="edit-middle-name-wrapper">
											<div class="form-label">
												<label for="edit-middle-name">Веб адреса на ресурс з
													більш детальною інформацією (за наявності)</label>
											</div>
											<div class="form-input textfield">
												<input id="publicUrl" name="publicUrl" type="url" size="100"
													class="form-text required form-element-type-textfield" />
											</div>
										</div>
									</div>
								</div>
							</fieldset>

							<div class="form-form-element-wrapper">
								<div class="form-item form-item-checkbox">
									<div class="form-input checkbox">
										<label class="option" for="agreed_checkbox"><input
											type="checkbox" class="form-checkbox required" checked
											disabled> Я згоден на передачу моїх персональних
											даних і використання їх у відповідності з умовами сайту</label>
									</div>
									<div class="form-error"></div>
								</div>
							</div>
							<input type="hidden" name="addresseeId" value="${addressee.id}" />
							<div class="form-button-wrapper">
								<div id="button-edit-submit" class="button-wrapper">
									<input type="submit" name="next" id="edit-submit" value="Далі"
										tabindex="3" class="form-submit button default-right-arrow"
										style="display: block;"><img
										class="floatRight formSubmitButtonAjaxLoader"
										style="padding-right: 6px; margin-top: -2px; display: none;"
										>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</article>
	</div>
	<footer>
		<div id="footer">Co. UA Справа</div>
	</footer>
</body>
</html>