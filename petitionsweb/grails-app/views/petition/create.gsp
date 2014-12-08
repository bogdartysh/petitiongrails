<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="uk">
<head>
<title>Онлайн петиції до державних органів України та посадовців</title>
<meta charset="UTF-8" />
<meta name="robots" content="index, follow" />

<link type="text/css" rel="stylesheet" media="all"
	href="https://www.wonga.pl/sites/default/files/pl/advagg_css/css_b9ffcb693e5d6c4a3c56dc43b1e93cfd_0.css" />
<link type="text/css" rel="stylesheet" media="all"
	href="https://www.wonga.pl/sites/default/files/pl/advagg_css/css_d887187b182021b89f0c9e6d367d395c_0.css" />
<link type="text/css" rel="stylesheet" media="print"
	href="https://www.wonga.pl/sites/default/files/pl/advagg_css/css_aa7a54133e6fa012002b24ad8c412a5a_0.css" />
</head>
<script src="http://js.nicedit.com/nicEdit-latest.js"
	type="text/javascript"></script>
<script type="text/javascript">
	bkLib.onDomLoaded(nicEditors.allTextAreas);
</script>


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
					<div class="form-inner">
						<form accept-charset="UTF-8"
							method="post" name="new_petition">
							<fieldset class="form-element-type-fieldset" id="name">
								<legend>Ваше ім'я</legend>
								<p>Просимо надати Ваше повне ім'я:</p>
								<div class="form-form-element-wrapper">
									<div class="form-item form-item-textfield">
										<div class="form-label">
											<label for="edit-first-name">Ім'я </label>
										</div>
										<div class="form-input textfield">
											<input type="text" name="firstName" required  pattern="[А-ЯЇҐЄ]{1}[а-я'їґєж]{2,20}"
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
											<g:textField name="secondName"  pattern="[А-ЯЇҐЄ]{1}[а-я'їґєж]{2,20}"
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
											<input type="text" name="lastName" required pattern="[А-ЯЇҐЄ]{1}[а-я'їґєж]{2,20}"
												class="form-text required form-element-type-textfield" />
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend>Контактні дані</legend>
								<p>Просимо надати Ваші контактні дані:</p>
								<div class="form-form-element-wrapper">
									<div class="form-item form-item-textfield "
										id="edit-middle-name-wrapper">
										<div class="form-label">
											<label for="edit-middle-name">Email</label>
										</div>
										<div class="form-input textfield">
											<input id="email" name="email" type="email" required
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
											<input id="phone" name="phone" type="tel" size="20" required
												class="form-text required form-element-type-textfield"/>
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
											<input type="text" name="postalAddress"
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
												<input type="textared" id="description" name="description" rows="10" required
													class="form-text required form-element-type-textfield" />
											</div>
										</div>
									</div>

									<div class="form-form-element-wrapper">
										<div class="form-item form-item-textfield "
											id="edit-middle-name-wrapper">
											<div class="form-label">
												<label for="edit-middle-name">Урл адреса на ресурс з
													більш детальною інформацією (за наявності)</label>
											</div>
											<div class="form-input textfield">
												<input id="publicUrl" name="publicUrl" type="url"
													class="form-text required form-element-type-textfield" />
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
							<div class="form-button-wrapper">
								<div id="button-edit-submit" class="button-wrapper">
									 <input
										type="submit" name="next" id="edit-submit" value="Далі"
										tabindex="3" class="form-submit button default-right-arrow"
										style="display: block;"><img
										class="floatRight formSubmitButtonAjaxLoader"
										style="padding-right: 6px; margin-top: -2px; display: none;"
										src="https://www.wonga.pl//sites/all/modules/custom/wonga/media/images/processing-wheel-small.gif">
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