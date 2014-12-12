<html>
<head>
<meta name="layout" content="main" />
<h2>Системна помилка</h2>
</head>
<body>
	<g:if env="development">
		<g:renderException exception="${exception}" />
	</g:if>
	<g:else>
		<ul class="errors">
			<li>Вибачте, сталась системна помилка.</li>
		</ul>
	</g:else>
</body>
</html>
