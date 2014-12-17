<html>
<head>
<meta name="layout" content="main" />
<h2>
	<g:link controller="Addressee" params="[id:addressee.id]">
		${addressee?.title }
	</g:link>
</h2>
</head>
<body>
	<script>
		$(function() {
			// Set cursor to pointer and add click function
			$("legend").css("cursor", "pointer").click(function() {
				var legend = $(this);
				var value = $(this).children("span").html();
				if (value == "[-]")
					value = "[+]";
				else
					value = "[-]";
				$(this).siblings().slideToggle("slow", function() {
					legend.children("span").html(value);
				});
			});
		});
	</script>
	<p>
		Ви подаєте петицію до
		<g:link controller="Addressee" params="[id:addressee.id]">
			${addressee.title}
		</g:link>
		.
	</p>

	<g:if test="${validation?.trim()}">
		<div class="warning">
			<p>Вибачте, але Вам доведеться перевірити дані:</p>
			<ul>
				<g:if test="${validation == 'petition.title.exists'}">
					<li>петиція <g:link controller="Petition"
							params="[id:existedPetition.id]">
								"${ existedPetition.title}"
							</g:link> вже подана.
					</li>
				</g:if>

				<g:if
					test="${validation == 'petition.recaptcha.verification.failed'}">
					<li>капча заповнена з помилками.</li>
				</g:if>
			</ul>
		</div>
	</g:if>


	<div class="form-inner">
		<form accept-charset="UTF-8" method="post" name="new_petition"
			action="submit">
			<fieldset>
				<legend>
					Пропозиція <span>[-]</span>
				</legend>
				<p>Просимо заповнити:</p>
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
									cols="76"></textarea>
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
			<br />
			<fieldset class="form-element-type-fieldset" id="name">
				<legend>
					Ваше ім'я та прізвище&nbsp;(опціонально)<span>[+]</span>
				</legend>
				<div style="display: none;">
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
				</div>
			</fieldset>
			<br />
			<fieldset>
				<legend>
					Ваші контактні дані&nbsp;(опціонально) <span>[+]</span>
				</legend>
				<div style="display: none;">
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
				</div>
			</fieldset>

			<br />
			<div class="form-form-element-wrapper">
				<div class="form-item form-item-checkbox">
					<div class="form-input checkbox">
						<label class="option" for="agreed_checkbox"><input
							type="checkbox" class="form-checkbox required" checked disabled>
							Я згоден на передачу моїх персональних даних і використання їх у
							відповідності з умовами сайту</label>
					</div>
					<div class="form-error"></div>
				</div>
			</div>

			<recaptcha:recaptcha lang="ukr" />

			<input type="hidden" name="addresseeId" value="${addressee.id}" />
			<div class="form-button-wrapper" style="text-align: center;">
				<input type="submit" name="submit" value="Далі&nbsp;>>"
					class="btn-success btn" style="color: white;" />
			</div>
		</form>
	</div>
</body>
</html>
