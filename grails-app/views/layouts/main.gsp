<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Foreign Cash" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name='mysitecost.ru' content='addurl' />
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.png')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'favicon.png')}">
<link rel="apple-touch-icon" sizes="114x114" href="">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
<!-- Bootstrap core CSS -->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="${resource(dir: 'js', file: 'html5shiv.js')}"></script>
      <script src="${resource(dir: 'js', file: 'respond.min.js')}"></script>
    <![endif]-->

<!-- Custom styles for this template -->
<link href="${resource(dir: 'css', file: 'carousel.css')}"
	rel="stylesheet">

<style type="text/css">
.vcontainer {
	display: table-cell;
	vertical-align: middle;
}
</style>
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js',
			'ga');

	ga('create', 'UA-43388032-3', 'foreigncash.net');
	ga('send', 'pageview');
</script>
<g:layoutHead />
<r:layoutResources />
</head>
<body>
	<div id="floating-bar"></div>

	<div class="navbar-wrapper">
		<div class="container">

			<div class="navbar navbar-inverse navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="${createLink(uri:"/") }">₣<g:img
								dir="images" file="favicon.png" height="16" alt="O" />R€IG₦ ₡A$H
						</a>
					</div>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li
								<g:if test="${request?.getRequestURI()==createLink(uri: "/")}">class="active"</g:if>><a
								href="${createLink(uri:"/")}">Home</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">World Currencies<b class="caret"></b></a>
								<ul class="dropdown-menu">
									<g:each in="${foreigncash.Currency.findAllByTop(true)}"
										var="curr">
										<li><a
											href="${createLink(controller:"currency",action:"show",id:curr?.id) }">
												<img
												src="${createLink(uri:'/pics/'+curr?.properties?.flagId+'.jpg')}"
												alt="${curr?.code}" height="24" /> ${curr?.code}
										</a></li>
									</g:each>
									<li class="divider"></li>
									<li><a href="${createLink(controller:"currency")}">Find
											more</a></li>

								</ul></li>
							<li
								<g:if test="${request?.getRequestURI()==createLink(uri: "/convert")}">class="active"</g:if>><a
								href="${createLink(uri:"/convert")}">Exchange Rates &amp;
									Converter</a></li>
							<li
								<g:if test="${request?.getRequestURI()==createLink(uri: "/contact")}">class="active"</g:if>><a
								href="${createLink(uri:"/contact")}">Contact</a></li>
							<sec:ifAllGranted roles="ROLE_ADMIN">
								<li
									<g:if test="${request?.getRequestURI().contains('/admin/')}">class="active"</g:if>><a
									href="${createLink(controller: 'admin')}">Admin</a></li>
								<li><g:link class="btn btn-primary" controller="logout"
										action="index">Exit</g:link></li>
							</sec:ifAllGranted>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div class="container">
		
		<!-- Main hero unit for a primary marketing message or call to action -->
		<g:layoutBody />


		<hr>

		<footer class="footer">
			<div class="pull-right">

				<a href="http://qubservice.com/"> <small>Designed by</small> <g:img
						dir="images" file="qub.png" alt="qub service" />
				</a>

			</div>
		</footer>

	</div>
	<g:javascript src="jquery.js" />
	<g:javascript src="bootstrap.js" />
	<!-- AddThis Smart Layers BEGIN -->
	<!-- Go to http://www.addthis.com/get/smart-layers to customize -->
	<script type="text/javascript"
		src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-52402bc722f873c2"></script>
	<script type="text/javascript">
		addthis
				.layers({
					'theme' : 'gray',
					'share' : {
						'position' : 'left',
						'numPreferredServices' : 7,
						'services' : 'facebook,twitter,google_plusone_share,linkedin,tumblr,vk,more'

					}
				});
	</script>
	<!-- AddThis Smart Layers END -->
	<!-- Start Alexa Certify Javascript -->
	<script type="text/javascript">
		_atrk_opts = {
			atrk_acct : "Y9Gmi1a8s700O9",
			domain : "foreigncash.net",
			dynamic : true
		};
		(function() {
			var as = document.createElement('script');
			as.type = 'text/javascript';
			as.async = true;
			as.src = "https://d31qbv1cthcecs.cloudfront.net/atrk.js";
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(as, s);
		})();
	</script>
	<noscript>
		<img
			src="https://d5nxst8fruw4z.cloudfront.net/atrk.gif?account=Y9Gmi1a8s700O9"
			style="display: none" height="1" width="1" alt="" />
	</noscript>
	<!-- End Alexa Certify Javascript -->
	<r:layoutResources />
</body>
</html>
