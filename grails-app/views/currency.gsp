<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>
	${(currencyInstance)? currencyInstance?.seo?.title : 'World currency list - Foreign Cash'}
</title>

<meta name="description"
	content="${(currencyInstance)? currencyInstance?.seo?.description : 'The list of currencies of the world, description, denominations and what countries are using.'}">
<meta name="keywords"
	content="${(currencyInstance)? currencyInstance?.seo?.keywords : 'currencies of countries, international currencies, currencies of the world, world currencies, currency list, denominations, pars, foreign cash, world money, foreign currency, banknotes, Photos of Banknotes'}">


</head>

<body>
	<div class="row">
		<div class="col-md-2">
			<div class="well">
				<button type="button" class="btn btn-default" data-toggle="collapse"
					data-target="#currencynav">Currencies</button>

				<div id="currencynav" class="collapse">
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
			<g:if test="${actionName=='list'}">
				<g:each in="${currencyList}" var="curr" status="i">
					<g:if test="${((i)%4)==0||(i+1)==1}">
						${"<div class='row'>" }
					</g:if>

					<div class="col-md-3 col-lg-3">
						<div class="thumbnail">

							<img
								src="${createLink(uri:'/pics/'+curr?.properties?.flagId+'.jpg')}"
								alt="${curr?.code}" />
							<div class="caption text-center">
								<span style="font-size: 40px;"> <g:if
										test="${!curr?.symbol?.isEmpty()}">
										${curr?.symbol}
									</g:if> <g:else>
									&nbsp;<img alt="symb" height="35"
											src="${createLink(uri:'/pics/'+curr?.properties?.symbolImageId+'.jpg')}" />&nbsp;
								</g:else>
								</span>
								<h3>
									${curr?.name}
								</h3>
								<p>
									<a
										href="${createLink(controller:'currency', action:'show', id:curr?.id) }"
										class="btn btn-primary">&nbsp;&nbsp;&nbsp;View&nbsp;&nbsp;&nbsp;</a>
								</p>
							</div>
						</div>
					</div>
					<g:if test="${((i+1)%4)==0||i==currencyList.size()-1}">
						${"</div><hr>" }
					</g:if>

				</g:each>
			</g:if>
			<g:if test="${actionName=='show'}">
				<div class="row well">
					<div class="page-header">
						<h1>
							<img
								src="${createLink(uri:'/pics/'+currencyInstance?.properties?.flagId+'.jpg')}"
								alt="${currencyInstance?.code}" /> <span> ${currencyInstance?.symbol}
							</span> -
							${currencyInstance?.name}
						</h1>
						<h3>
							ISO code: <strong> ${currencyInstance?.code}
							</strong>
						</h3>
					</div>
					<p class="lead">
						${currencyInstance?.description}
					</p>


				</div>
								<div class="row" style="text-align: center;">
			 <!-- Begin BidVertiser code -->
			<SCRIPT SRC="http://bdv.bidvertiser.com/BidVertiser.dbm?pid=613291&bid=1531481" TYPE="text/javascript"></SCRIPT>
			<!-- End BidVertiser code --> 
</div>
<br/>
				<div class="row well">
					<div class="col-md-3 col-lg-3">
						<dl>
							<dt>Official uses:</dt>
							<g:each in="${currencyInstance?.country.sort()}" var="country">
								<dd>
									<g:img dir="images/countries" file="${country}.gif"
										alt="${country}" />
									<g:country code="${country}" />
								</dd>
							</g:each>
						</dl>
					</div>
					<div class="col-md-9 col-lg-9">
						<h4>
							<strong>Denominations:</strong>
						</h4>
						<g:each in="${currencyInstance?.cash.sort{ it.par}}" var="cash"
							status="i">
							<g:if test="${((i)%2)==0||(i+1)==1}">
								${"<div class='row'>" }
							</g:if>

							<div class="col-md-6 col-lg-6">
								<div class="thumbnail">

									<img
										src="${createLink(uri:'/pics/'+cash?.properties?.frontsmallId+'.jpg')}"
										alt="${cash?.name} obverse" />
									<div class="caption text-center">
										<h3>
											${cash?.name}
										</h3>
										<p>
											<a
												href="${createLink(controller:'cash', action:'show', id:cash?.id) }"
												class="btn btn-success">&nbsp;&nbsp;&nbsp;View&nbsp;&nbsp;&nbsp;</a>
										</p>
									</div>
								</div>
							</div>
							<g:if test="${((i+1)%2)==0||i==currencyInstance?.cash.size()-1}">
								${"</div><hr>" }
							</g:if>

						</g:each>
					</div>
				</div>


			</g:if>
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