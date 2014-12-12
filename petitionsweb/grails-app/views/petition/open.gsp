<html>
<head>
<meta name="layout" content="main" />
<h2>Відкриті публічні пропозиції по яких іде голосування</h2>
</head>
<body>
	<g:if test="${petitions }">
		<p>Маємо наступні пропозиції по котрих іде голосування. Звертаємо
			Вашу увагу що лише ті, що наберуть на 30 день достатню кількість
			голосів будут опрацьовані.</p>
		<table class="wiki-table" cellspacing="1" cellpadding="1" border="0">
			<thead>
				<tr>
					<th>No.</th>
					<th>Назва</th>
					<th>Адресат</th>
					<th>Кількість набраних голосів</th>
					<th>Дата подання</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${petitions}" var="petition">
					<tr>
						<td>
							${petition.id }
						</td>
						<td><g:link controller="Petition" params="[id:petition.id]">
								${petition.title }
							</g:link></td>
						<td><g:link controller="Addressee"
								params="[id:petition.addressee.id]">
								${petition.addressee.title}
							</g:link></td>
						<td>
							${petition.numberOfVotes }
						</td>
						<td><g:formatDate format="yyyy-MM-dd"
								date="${petition.createdOn }" /></td>
					</tr>

				</g:each>
			</tbody>
		</table>
	</g:if>
	<g:if test="${!petitions }">
		<p>Наразі не маємо відкритих пропозицій, котрі набрали достатню
			кількість голосів для потрапляння у публічний пошук.</p>
	</g:if>
	<p>
		Також є
		${qtynotsearchable }
		запис про пропозиції, що не набрали достатньої кількості голосів для
		потрапляння у публічний пошук. Якщо Ви їх автор надайте лінку до Вашої
		петиції зацікавленим сторонам щоб вони могли її підтримати.
	</p>

</body>
</html>