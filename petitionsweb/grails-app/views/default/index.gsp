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
</head>
<body>
	<header>
		<h1>Онлайн петиції до державних органів України та посадовців</h1>
	</header>
	<article>

		<p>Ви можете звернутись до наступних діячів та організацій:</p>
		<table>
			<thead>
				<tr>
					<th>No.</th>
					<th>Назва</th>
					<th>Відповідальна особа</th>
					<th>Кількість поданих петицій, <br /> по яких іде голосування
					</th>
					<th>Кількість розглянутих петицій</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${addressees}" var="addressee">
					<tr>
						<td><g:link controller="Addressee" params="[id:addressee.id]">
								${addressee.id}
							</g:link></td>
						<td><g:link controller="Addressee" params="[id:addressee.id]">
								${addressee.title}
							</g:link></td>
						<td><g:link controller="Person"
								params="[id:addressee.responsiblePerson.id]">
								${addressee.responsiblePerson.firstName}
								${addressee.responsiblePerson.lastName}
							</g:link></td>
						<td><g:link controller="Addressee" action="votablepetitons"
								params="[id:addressee.id]">
								${addressee.openPetitionQty}
							</g:link></td>
						<td><g:link controller="Addressee" action="resolvedpetitions"
								params="[id:addressee.id]">
								${addressee.workedOutPtetitionQty}
							</g:link></td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</article>
	<footer>Co. UA Справа</footer>
</body>
</html>