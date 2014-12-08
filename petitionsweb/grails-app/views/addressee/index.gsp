<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="uk">
<head>
<title>Онлайн петиції до державних органів України та посадовців</title>
<meta charset="UTF-8" />
<meta name="robots" content="index, follow" />
<link rel="stylesheet" type="text/css"
	href="//developers.google.com/_static/50d14ed2ec/css/screen-maia.css" />
<link
	href='//fonts.googleapis.com/css?family=Roboto:400,400italic,700,700italic,500,500italic,300,300italic'
	rel='stylesheet' type='text/css'>


<link rel="stylesheet" type="text/css"
	href="https://developers.google.com/_static/50d14ed2ec/css/screen-docs.css" />


<link rel="stylesheet" type="text/css" id="screen-foot"
	data-href="https://developers.google.com/_static/50d14ed2ec/css/screen-foot.css" />

<link rel="shortcut icon" href="/_static/50d14ed2ec/images/favicon.ico">
<link href='//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">
</head>
<body>
	<header>
		<h1>
			<g:link uri="/">Онлайн петиції до державних органів України та посадовців.</g:link>
		</h1>
		<h2>
			${addressee.title}
		</h2>
	</header>
	<article>
			<table class="pure-table  pure-table-horizontal">
				<tbody>
					<tr>
						<td>Назва</td>
						<td><a href="${addressee.corporateWebAddress }"> ${addressee.title}
						</a></td>
					</tr>
					<tr class="pure-table-odd">
						<td>Відповідальна особа</td>
						<td><g:link controller="Person"
								params="[id:addressee.responsiblePerson.id]">
								${addressee.responsiblePerson.firstName}
								${addressee.responsiblePerson.lastName}
							</g:link></td>
					</tr>
					<tr>
						<td>Опис</td>
						<td>
							${addressee.description}
						</td>
					</tr>
					<tr class="pure-table-odd">
						<td>Кількість поданих петицій, <br /> по яких іде
							голосування
						</td>
						<td><g:link controller="Addressee" action="votablepetitons"
								params="[id:addressee.id]">
								${addressee.openPetitionQty}
							</g:link></td>
					</tr>
					<tr>
						<td>Кількість розглянутих петицій</td>
						<td><g:link controller="Addressee" action="resolvedpetitions"
								params="[id:addressee.id]">
								${addressee.workedOutPtetitionQty}
							</g:link></td>
					</tr>
				</tbody>
			</table>

			<g:if test="${addressee.openPetitionQty  > 0}">
				<table>
					<theader>
					<tr>
						<th>No.</th>
						<th>Назва</th>
						<th>Створений</th>
					</tr>
					</theader>
				</table>
			</g:if>

			<g:if test="${addressee.workedOutPtetitionQty  > 0}">
				<table>
					<theader>
					<tr>
						<th>No.</th>
						<th>Назва</th>
						<th>Створений</th>
					</tr>
					</theader>
				</table>
			</g:if>
			<div align="center">
				<g:link controller="Petition" action="create"
					params="[addresseeId:addressee.id]"
					class="pure-button pure-button-primary">Додати петицію</g:link>
			</div>
	</article>
	<footer>Co. UA Справа</footer>
</body>
</html>