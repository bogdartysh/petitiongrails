<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="uk">
<head>
<title>Онлайн пропозиції із законодавства до структур Верховної
	Ради України</title>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="robots" content="index, follow" />
<link rel="stylesheet" href="http:ht//grails.org/doc/latest/css/main.css"
	type="text/css" media="screen, print" title="Style" charset="utf-8" />
<link rel="stylesheet" href="http://grails.org/doc/latest/css/pdf.css"
	type="text/css" media="print" title="PDF" charset="utf-8" />
<script type="text/javascript">
	function addJsClass() {
		var classes = document.body.className.split(" ");
		classes.push("js");
		document.body.className = classes.join(" ");
	}
</script>
</head>
<body onload="addJsClass();">
	<header>
		<div id="header">
			<h1>
				<g:link uri="/">Онлайн петиції до державних органів України та посадовців.</g:link>
			</h1>
			${petition.id}
			<h2>
				${petition.addressee?.title }
			</h2>
			<h2>
				Пропозиція No.
				${petition.id}
				"<b> ${petition.title}
				</b>"
			</h2>
		</div>
	</header>
	<article>
		<div id="article">
			<p>
				Пропозиція No.&nbsp;${petition.id}
				"<b> ${petition.title}</b>" подана від
				${petition.createdOn}.
			</p>
			<p>
				Текст петиції:
				<code>
					<div class="code">
						${petition.description }
					
				</code>
		</div>
		<g:if test="${petition.publicUrl?.trim()}">
			<p>
				Веб адреса на ресурс з більш детальною інформацією:
				${petition.publicUrl}
			</p>
		</g:if>

		<g:if test="${petition.closedOn}">
			<p>
			<div class="status closed">Статус ЗАКРИТО</div>
			</p>
			<p>
				Закрито
				${petition.closedOn}, персона що закрила:
				${petition.closedBy.title }
				${petition.closedBy.firstName }
				${ petition.closedBy.lastName }.

			</p>
			<p>
				Причина закриття:
				${petition.closedDue}
			</p>
		</g:if>

		<g:if test="${petition.seachabilityThresholdReachedOn}">
			<p>
				${petition.seachabilityThresholdReachedOn }
				досягнуто ліміту голосів потрапляння до пошуку.
			</p>
		</g:if>
		<g:if test="${petition.considerabilityThresholdReachedOn}">
			<p>
				${petition.considerabilityThresholdReachedOn}
				досягнуто ліміту голосів передачі до відповідальної особи.
			</p>
		</g:if>

		</div>
	</article>
	<footer>
		<div id="footer">Co. UA Справа</div>
	</footer>
</body>

<script type="text/javascript" src="http://grails.org/doc/latest/js/docs.js"></script>
</html>