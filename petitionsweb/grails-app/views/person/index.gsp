<head>
<meta name="layout" content="main" />
<h2>
	${person.title}
	${person.firstName }
	${person.lastName }
</h2>
</head>
<body>

	<table class="wiki-table" cellspacing="0" cellpadding="0" border="0">
		<tbody>
			<tr class="table-odd">
				<td>Ім'я</td>
				<td><a href="${person.personalPage}"> ${person.firstName } ${person.secondName }
						${person.lastName }
				</a></td>
			</tr>
			<tr class="pure-table-odd">
				<td>Посада</td>
				<td>
					${person.title }
				</td>
			</tr>
			<tr>
				<td>Дата початку участі в проекту</td>
				<td>
					${person.createdOn }
				</td>
			</tr>
		</tbody>
	</table>
	<br />
	<p>Взяв на себе відповідальність за обробку запитів до:</p>
	<table class="wiki-table" cellspacing="0" cellpadding="0" border="0">
		<thead>
			<tr>
				<th>No.</th>
				<th>Назва</th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${person.addressees}" var="addressee">
				<tr>
					<td><g:link controller="Addressee" params="[id:addressee.id]">
							${addressee.id}
						</g:link></td>
					<td><g:link controller="Addressee" params="[id:addressee.id]">
							${addressee.title}
						</g:link></td>
				</tr>
			</g:each>
		</tbody>
	</table>

	<g:if test="${!person.comments.isEmpty()}">
		Відповіді на запити:
		<table>
			<thead>
				<tr>
					<th>No.</th>
					<th>Запит</th>
					<th>Отримувач</th>
					<th>Дата відповіді</th>
				</tr>
			</thead>
		</table>
	</g:if>
</body>
</html>