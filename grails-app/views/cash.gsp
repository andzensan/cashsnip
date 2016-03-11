<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>
	${(cashInstance)? cashInstance?.seo?.title : 'World currency list - Foreign Cash'}
</title>

<meta name="description"
	content="${(cashInstance)? cashInstance?.seo?.description : 'The list of currencies of the world, description, denominations and what countries are using.'}">
<meta name="keywords"
	content="${(cashInstance)? cashInstance?.seo?.keywords : 'currencies of countries, international currencies, currencies of the world, world currencies, currency list, denominations, pars, foreign cash, world money, foreign currency, banknotes, Photos of Banknotes'}">


</head>

<body>
	<div class="row">
		<div class="col-md-2">
			<div class="well">
				<button type="button" class="btn btn-default" data-toggle="collapse"
					data-target="#demo">Currencies</button>

				<div id="demo" class="collapse in">
					<table>

						<g:each in="${foreigncash.Currency.list(sort: 'name')}" var="curr">
							<tr>
								<td><a
									href="${createLink(controller:"currency", action: "show", id: curr?.id) }">
										<img
										src="${createLink(uri:'/pics/'+curr?.properties?.flagId+'.jpg')}"
										height="24" alt="${curr?.code}" /><small> ${curr?.name}
									</small>
								</a></td>
							</tr>
						</g:each>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-8 col-lg-8">
			<div class="row">
				<div id="carousel" class="carousel slide">
					<ol class="carousel-indicators">
						<li data-target="#carousel" data-slide-to="0" class="active"></li>
						<li data-target="#carousel" data-slide-to="1"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active ">
							<img
								src="${createLink(uri:'/pics/'+cashInstance?.properties?.frontId+'.jpg')}"
								alt="${cashInstance?.name} obverse" />
						</div>
						<div class="item text-center">
							<img
								src="${createLink(uri:'/pics/'+cashInstance?.properties?.backId+'.jpg')}"
								alt="${cashInstance?.name} reverse" />
						</div>

					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span>
					</a> <a class="right carousel-control" href="#carousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span>
					</a>

				</div>
			</div>
			<hr>
			<div class="row well">
				<h1>
					${cashInstance?.name}
				</h1>
				<p>
					${cashInstance?.description}
				</p>
				<p>
					Year:
					${cashInstance?.year}
				</p>
				<p>
					<g:if test="${cashInstance?.current}">
						<strong>Currently in use.</strong>
					</g:if>
					<g:else>
						<strong>Not used.</strong>
					</g:else>
				</p>
			</div>

		</div>
		<div class="col-md-2">
			<script style="text/javascript">
			  document.write('<a style="display:none!important" id="600972"></a>');
			  if (window.AED_SHOW) {
			    window.AED_SHOW({wid: '600972',shortkey:'qzniq7eMn', size:'160x600', custom:{}});
			  } else {
			    window.AED_ONLOAD = window.AED_ONLOAD || [];
			    window.AED_ONLOAD.push({wid:'600972',shortkey:'qzniq7eMn',size:'160x600',custom:{}});
			    if (!document.getElementById("ae-ad-script-$")) {
			      var s = document.createElement("script"),
			      h = document.getElementsByTagName("head")[0];
			      s.id = 'ae-ad-script-$';
			      s.charset = "utf-8";
			      s.async = !0;
			      s.src = "http://i.alicdn.com/ae-game/thirdparty/show-window/index.js";
			      h.insertBefore(s, h.firstChild)
			    }
			  }
			</script>
		</div>
	</div>
</body>
</html>