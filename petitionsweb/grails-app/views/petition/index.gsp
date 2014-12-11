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
				<g:link controller="Addressee" params="[id:petition.addressee.id]">
					${petition.addressee?.title }
				</g:link>
			</h2>
			<h2>
				<g:link controller="Petition" params="[id:petition.id]">Пропозиція No.
				${petition.id}
				"<b> ${petition.title}
					</b>"</g:link>
			</h2>
		</div>
	</header>
	<article>
		<div id="main" class="corner all container">
			<div class="breadcrumb">
				<p>
					Пропозиція No.&nbsp;<strong><g:link controller="Petition"
							params="[id:petition.id]">
							${petition.id}
						</g:link> </strong> "<strong><g:link controller="Petition"
							params="[id:petition.id]">
							${petition.title}
						</g:link></strong>" подана від <strong><g:formatDate format="yyyy-MM-dd"
							date="${petition.createdOn}" /></strong>.
				</p>
			</div>
			<p>
				Текст петиції:
				<code>
					<div class="code">
						${petition.description }
					</div>
				</code>
				<g:if test="${petition.publicUrl?.trim()}">
					<p>
						Веб адреса на ресурс з більш детальною інформацією:
						${petition.publicUrl}
					</p>
				</g:if>

				<g:if test="${petition.closedOn}">
					<blockquote class="warning">
						<div class="status closed">Статус ЗАКРИТО</div>
						<div>
							Закрито
							${petition.closedOn}, персона що закрила:
							${petition.closedBy.title }
							${petition.closedBy.firstName }
							${ petition.closedBy.lastName }.

						</div>
						<div>
							Причина закриття:
							${petition.closedDue}
						</div>
					</blockquote>
				</g:if>

				<g:if test="${petition.seachabilityThresholdReachedOn}">
					<p>
						${petition.seachabilityThresholdReachedOn }
						досягнуто ліміту голосів потрапляння до пошуку.
					</p>
				</g:if>
				<g:else>
					<blockquote class="note">
						<p>Занадто мало голосів. Пропозиція не є доступною у пошуку.</p>						
						<p>Якщо ви підтримуєте цю пропозицію, будь ласка повідомте про
							неї своїх друзів, або зацікавлені сторони.</p>
							<p>Адреса петиції: <strong>http://ua-sprava.rhcloud.com/petition/${petition.id}</strong></p>
						<p>
							До <strong><g:formatDate format="yyyy-MM-dd"
									date="${petition.getSeachableDeadline()}" /></strong> днів слід набрати
							<strong> ${petition.thresholdToBeSearchable}
							</strong> голосів.
						</p>
					</blockquote>
				</g:else>
				<g:if test="${petition.considerabilityThresholdReachedOn}">
					<p>
						${petition.considerabilityThresholdReachedOn}
						досягнуто ліміту голосів передачі до відповідальної особи.
					</p>
				</g:if>

				<g:if test="${petition.comments }">
					<p>Коментарі</p>
					<table>
						<thead>
							<tr>
								<th>No.</th>
								<th>Автор</th>
								<th>Дата</th>
								<th>Коментар</th>
							</tr>
						</thead>
						<tbody>
							<g:each in="${petition.comments}" var="comment">
								<tr>
									<td>
										${comment.id}
									</td>
									<td>
										${comment.createdBy}
									</td>
									<td>
										${comment.createdOn}
									</td>
									<td>
										${comment.text}
									</td>
								</tr>
							</g:each>
						</tbody>
					</table>
				</g:if>
			<p>
				Наразі проголосувало
				${petition?.votes?.size() }.
			</p>



			<g:if test="!${petition.closedOn}">
				<div id="message"></div>
				<div id="error"></div>
				<g:remoteLink controller="vote" params='[id:"${petition.id}"]'
					update="[success: 'message', failure: 'error']">
					<div class="btn-success btn" style="color: white;">
						Підтримую!!!</div>
				</g:remoteLink>
			</g:if>
		</div>
	</article>
	<footer>
		<div id="footer">Co. UA Справа</div>
	</footer>
</body>
</html>