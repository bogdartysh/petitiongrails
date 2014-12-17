<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<head>
<title><g:message code="default.title" /></title>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="robots" content="index, follow" />

<link rel="stylesheet" href="${resource(dir: 'css', file: 'pdf.css')}"
	type="text/css" media="screen, print" title="Style" charset="utf-8" />

<g:javascript library="jquery" plugin="jquery" />

<script src="https://apis.google.com/js/platform.js" async defer>
	{
		lang: 'uk'
	}
</script>
</head>

<body class="body">
	<header>
		<div id="navigation">
			<ul>
				<li><g:link uri="/">Головна</g:link></li>
				<li><g:link controller="petition" action="open">Відкриті пропозиції</g:link></li>
				<li><g:link uri="/">Додати пропозицію</g:link></li>
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
			<g:layoutHead />
		</div>
	</header>
	<article>
		<div id="main" class="corner all container">
			<g:layoutBody />
		</div>
	</article>
	<footer>
		<br />
		

		<div id="footer">Co. UA Справа	<br/> Всі права застережено. Co. 2014</div>
	
	
	</footer>
</body>
</html>
