<html>
<head>
<meta name="layout" content="main" />
<h1>
	${addressee.title}
</h1>
</head>
<body>
	<table class="wiki-table" cellspacing="0" cellpadding="0" border="0">
		<tbody>
			<tr>
				<th>Назва</th>
				<th><a href="${addressee.corporateWebAddress }"> ${addressee.title}
				</a></th>
			</tr>
			<tr class="table-odd">
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
			<tr class="table-odd">
				<td>Кількість поданих петицій, <br /> по яких іде голосування
				</td>
				<td><g:link controller="Addressee" action="votablepetitons"
						params="[id:addressee.id]">
						${addressee.petitions?.size()}
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

	<g:if test="${openpetitions?.size()  > 0}">
		<p>На стадії онлайн-голосування знаходяться наступні пропозиції:</p>
		<table class="wiki-table" class="wiki-table" cellspacing="0"
			cellpadding="0" border="0">
			<tbody>
				<tr>
					<th>No.</th>
					<th>Назва</th>
					<th>Створено</th>
					<th>Дата початку публічної компанії</th>
				</tr>


				<g:each in="${openpetitions }" var="petition">
					<tr>
						<td><g:link controller="Petition" params="[id:petition.id]">
								${petition.id }
							</g:link></td>
						<td><g:link controller="Petition" params="[id:petition.id]">
								${petition.title }
							</g:link></td>
						<td><g:formatDate format="yyyy-MM-dd"
								date="${petition.createdOn}" /></td>
						<td><g:formatDate format="yyyy-MM-dd"
								date="${petition.seachabilityThresholdReachedOn}" /></td>
					</tr>

				</g:each>
			</tbody>
		</table>
	</g:if>

	<g:if test="${closedpetitions?.size()  > 0}">
		<p>Опрацьовані пропозиції:</p>
		<table class="wiki-table" class="wiki-table" cellspacing="0"
			cellpadding="0" border="0">
			<tbody>
				<tr>
					<th>No.</th>
					<th>Назва</th>
					<th>Створено</th>
					<th>Дата завершення компанії</th>
					<th>Дата опрацювання</th>
				</tr>

				<g:each in="${closedpetitions }" var="petition">
					<tr>
						<td><g:link controller="Petition" params="[id:petition.id]">
								${petition.id }
							</g:link></td>
						<td><g:link controller="Petition" params="[id:petition.id]">
								${petition.title }
							</g:link></td>
						<td><g:formatDate format="yyyy-MM-dd"
								date="${petition.createdOn}" /></td>
						<td><g:formatDate format="yyyy-MM-dd"
								date="${petition.considerabilityThresholdReachedOn}" /></td>
						<td><g:formatDate format="yyyy-MM-dd"
								date="${petition.closedOn}" /></td>
					</tr>

				</g:each>
			</tbody>
		</table>
	</g:if>
	<br />
	<div align="center">
		<g:link controller="Petition" action="create"
			params="[addresseeId:addressee.id]" class="btn-success btn"
			style="color: white;">Додати петицію</g:link>
	</div>
</body>
</html>