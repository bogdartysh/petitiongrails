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
		<div class="like">
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
			</span> <span class="twitter-like"> <a
				href="https://twitter.com/share" class="twitter-share-button"
				data-via="bogdartysh">Tweet</a> <script>
					!function(d, s, id) {
						var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
								.test(d.location) ? 'http' : 'https';
						if (!d.getElementById(id)) {
							js = d.createElement(s);
							js.id = id;
							js.src = p + '://platform.twitter.com/widgets.js';
							fjs.parentNode.insertBefore(js, fjs);
						}
					}(document, 'script', 'twitter-wjs');
				</script>
			</span> <span class="google-like">
				<div class="g-plusone" data-size="small" data-annotation="inline"
					data-width="300"></div>
			</span>
		</div>
		<div id="footer">Co. UA Справа</div>
	</footer>
</body>
</html>
