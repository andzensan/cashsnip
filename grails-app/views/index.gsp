<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Foreign Cash</title>
<meta name="description"
	content="The list of currencies of the world, description, denominations, currency images and what countries are using.">
<meta name="keywords"
	content="currencies of countries, international currencies, currencies of the world, world currencies, currency list, denominations, pars, notes, foreign cash, world money, foreign currency, banknotes, Photos of Banknotes,currency calculator, currencies, rates, exchanges, fx rates, currency, foreign, currency convertor">


</head>

<body>
	<g:set var="randomcash" value="${foreigncash.Cash.randomthree()}"></g:set>
	<g:set var="lastcurrs"
		value="${foreigncash.Currency.list(max:'4', sort:'id', order:'desc')}"></g:set>
	<div class="container">
		<div class="row">
			<div id="carousel" class="carousel slide col-md-10 col-md-offset-1">
				<ol class="carousel-indicators">
					<li data-target="#carousel" data-slide-to="0" class="active"></li>
					<li data-target="#carousel" data-slide-to="1"></li>
					<li data-target="#carousel" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="item active ">
						<img
							src="${createLink(uri:'/pics/'+randomcash[0]?.properties?.frontId+'.jpg')}"
							alt="${randomcash[0]?.name} obverse" />
						<div class="carousel-caption">
							<h1>
								<a
									href="${createLink(controller:'cash',action:'show', id:randomcash[0]?.id)}"><strong>
										${randomcash[0]?.name}
								</strong></a>

							</h1>
							<p></p>
						</div>
					</div>
					<div class="item text-center">
						<img
							src="${createLink(uri:'/pics/'+randomcash[1]?.properties?.frontId+'.jpg')}"
							alt="${randomcash[1]?.name} obverse" />
						<div class="carousel-caption">
							<h1>
								<a
									href="${createLink(controller:'cash',action:'show', id:randomcash[1]?.id)}"><strong>
										${randomcash[1]?.name}
								</strong></a>
							</h1>
						</div>
					</div>
					<div class="item text-center">
						<img
							src="${createLink(uri:'/pics/'+randomcash[2]?.properties?.frontId+'.jpg')}"
							alt="${randomcash[2]?.name} obverse" />
						<div class="carousel-caption">
							<h1>
								<a
									href="${createLink(controller:'cash',action:'show', id:randomcash[2]?.id)}"><strong>
										${randomcash[2]?.name}
								</strong></a>
							</h1>
						</div>
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
		<div class="row" style="text-align: center;">
			 <!-- Begin BidVertiser code -->
			 <div class="col-md-2"></div>
			 <div class="col-md-8">
			<SCRIPT SRC="http://bdv.bidvertiser.com/BidVertiser.dbm?pid=613291&bid=1531481" TYPE="text/javascript"></SCRIPT></div>
			<!-- End BidVertiser code --> 
		</div>
		<br />

		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="row">
						<div class="jumbotron">
							<h1>Foreign cash</h1>
							<p>The project which is focused on providing information
								about currencies of all the countries, their cash money and
								various monetary units. Now you can explore and find out how
								money looks from different countries.</p>
							<p>
								<a class="btn btn-info btn-lg"
									href="${createLink(controller:'currency')}">Click here!</a>
							</p>
						</div>
					</div>
					<g:each in="${newsrss}" var="item">
						<div class="row">
							<div class="jumbotron">
									<h6>${item.pubDate}</h6>
									${item.description.toString()}
							</div>
						</div>

					</g:each>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
		<hr>
		<div class="row">
			<g:each in="${lastcurrs}" var="curr">
				<div class="col-md-3">
					<div class="thumbnail">
						<img
							src="${createLink(uri:'/pics/'+curr?.properties?.flagId+'.jpg')}"
							alt="${curr?.code}" />
						<div class="caption text-center">
							<span style="font-size: 120px;"> <g:if
									test="${!curr?.symbol?.isEmpty()}">
									${curr?.symbol}
								</g:if> <g:else>
									&nbsp;<img alt="symb" height="100"
										src="${createLink(uri:'/pics/'+curr?.properties?.symbolImageId+'.jpg')}" />&nbsp;
								</g:else>
							</span>
							<h2>
								${curr?.name}
							</h2>
							<p>
								<a
									href="${createLink(controller:'currency',action:'show',id:curr?.id)}"
									class="btn btn-primary btn-lg">View</a>
							</p>
						</div>
					</div>
				</div>
			</g:each>
		</div>
		<hr>
		<div class="row">
		<div class="well">
			<h3>External links</h3>
			<br><p><a href="http://www.onlinecasino.website/">Casino Forums</a></p>
			
		</div>
		</div>
	</div>
</body>
</html>
