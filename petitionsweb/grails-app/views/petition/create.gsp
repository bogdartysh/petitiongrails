<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="uk">
<head>
<title><g:message code="default.title" /></title>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="robots" content="index, follow" />
<link rel="stylesheet" href="${resource(dir: 'css', file: 'pdf.css')}"
	type="text/css" media="screen, print" title="Style" charset="utf-8" />
<g:javascript library="jquery" plugin="jquery" />

</head>

<body class="body">
	<header>
		<div id="navigation">
			<ul>
				<li><g:link uri="/">Головна</g:link></li>
				<li><g:link uri="/about">Відкриті пропозиції</g:link></li>
				<li><g:link uri="/about">Про проект</g:link></li>
				<li><g:link uri="/contacts">Контакти</g:link></li>
			</ul>
		</div>
		<div id="header">
			<h1>
				<g:link uri="/">
					<div style="text-decoration: none;">
						<g:message code="default.title" />
					</div>
				</g:link>
			</h1>
			<h2>
				<g:link controller="Addressee" params="[id:addressee.id]">
					${addressee?.title }
				</g:link>
			</h2>
		</div>
	</header>
	<article>
		<div id="main" class="corner all container">
			<p>
				Ви подаєте петицію до
				<g:link controller="Addressee" params="[id:addressee.id]">
					${addressee.title}
				</g:link>
				.
			</p>

			<g:if test="${validation?.trim()}">
				<p>Вибачте, але Вам доведеться перевірити дані:</p>
				<ul>
					<g:if test="${validation?.trim()}">
						<li><g:if test="${validation == 'petition.title.exists'}">
					  	петиція <g:link controller="Petition"
									params="[id:existedPetition.id]">
								"${ existedPetition.title}"
							</g:link> вже подана.</g:if></li>
					</g:if>

				</ul>
			</g:if>


			<div class="form-inner">
				<form accept-charset="UTF-8" method="post" name="new_petition"
					action="submit">
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
									<input type="text" id="title" name="title" required size="100"
										value="${title}"
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
										<textarea id="description" name="description" rows="10"
											cols="50"></textarea>
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


					<div class="form-form-element-wrapper">
						<div class="form-item form-item-checkbox">
							<div class="form-input checkbox">
								<label class="option" for="agreed_checkbox"><input
									type="checkbox" class="form-checkbox required" checked disabled>
									Я згоден на передачу моїх персональних даних і використання їх
									у відповідності з умовами сайту</label>
							</div>
							<div class="form-error"></div>
						</div>
					</div>
					<recaptcha:recaptcha>
					
					<input type="hidden" name="addresseeId" value="${addressee.id}" />
					<div class="form-button-wrapper">
						<input type="submit" name="submit" value="Далі"
							class="btn-success btn" style="color: white;" />
					</div>
				</form>
			</div>
		</div>
	</article>
	<footer>
		<div id="footer">Co. UA Справа</div>
	</footer>
</body>

</html>