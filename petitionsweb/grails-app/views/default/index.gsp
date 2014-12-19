<html>
<head>
<meta name="layout" content="main" />
</head>
<body>
	<p>Ви можете звернутись до наступних діячів та організацій:</p>
	<table  class="wiki-table" cellspacing="1" cellpadding="1" border="0">
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
					<td><g:link controller="Petition" action="open"
							params="[id:addressee.id]">
							${addressee.openPetitionQty}
						</g:link></td>
					<td><g:link controller="Petition" action="resolved"
							params="[id:addressee.id]">
							${addressee.workedOutPtetitionQty}
						</g:link></td>
				</tr>
			</g:each>
		</tbody>
	</table>
</body>
</html>