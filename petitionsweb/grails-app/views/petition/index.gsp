<html>
<head>
<meta name="layout" content="main" />
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
</head>
<body>
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
				<p>
					Адреса петиції: <strong>http://ua-sprava.rhcloud.com/petition/${petition.id}</strong>
				</p>
				<p>
					До <strong><g:formatDate format="yyyy-MM-dd"
							date="${petition.getSeachableDeadline()}" /></strong> днів слід набрати <strong>
						${petition.thresholdToBeSearchable}
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
		Наразі набрано <strong> ${petition?.numberOfVotes }
		</strong> голосів.
	<table class="wiki-table" cellspacing="0" cellpadding="0" border="0">
		<thead>
			<tr>
				<th>Метод голосування</th>
				<th>Кількість голосів</th>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td>За IP</td>
				<td align="center">
					${petition?.numberOfVotes }
				</td>
			</tr>
			<tr>
				<td>У соц. мережі</td>
				<td align="center">
					${petition?.numberOfShares }
				</td>
			</tr>
			<tr class="table-odd">
				<td><strong>Загалом</strong></td>
				<td align="center"><strong> ${petition?.numberOfVotes  + petition?.numberOfShares }
				</strong></td>
			</tr>
		</tbody>
	</table>
	</p>



	<g:if test="!${petition.closedOn}" style="text-align: center;">
		<h3>Ви можете проголосувати за пропозицію або розшарити її в соц.
			мережах (буде враховано)</h3>
		<center>
			<div id="vote">
				<div id="message"></div>
				<div id="error"></div>
				<g:formRemote name="voteform" url="[controller: 'vote']"
					update="[success: 'message', failure: 'error']">
					<recaptcha:recaptcha lang="uk" />
					<input type="hidden" name="id" value="${petition.id}" />
					<center>
						<input type="submit" class="btn-success btn"
							style="text-align: center; color: white;" value="Підтримую!!!" />
					</center>
				</g:formRemote>
			</div>
			<br />
			<div id="shares">
				<span class="facebok-like">
					<div id="fb-root"></div> <script>
						(function(d, s, id) {
							var js, fjs = d.getElementsByTagName(s)[0];
							if (d.getElementById(id))
								return;
							js = d.createElement(s);
							js.id = id;
							js.src = "//connect.facebook.net/en_EN/all.js#xfbml=1&appId=186071791550679";
							fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));
					</script>
					<div class="fb-like" data-href="http://ua-sprava.rhcloud.com"
						data-send="true" data-width="450" data-show-faces="true"></div>
				</span> 
				<span class="twitter-like" > <a
					href="https://twitter.com/share" class="twitter-share-button"
					data-via="bogdartysh">Tweet</a> <script>
						!function(d, s, id) {
							var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
									.test(d.location) ? 'http' : 'https';
							if (!d.getElementById(id)) {
								js = d.createElement(s);
								js.id = id;
								js.src = p
										+ '://platform.twitter.com/widgets.js';
								fjs.parentNode.insertBefore(js, fjs);
							}
						}(document, 'script', 'twitter-wjs');
					</script>
				</span> <span class="google-like">
					<div class="g-plusone" data-size="small" data-annotation="inline"
						data-width="300"></div>
				</span>
			</div>
			<br /> <br />
		</center>
	</g:if>
</body>
</html>
