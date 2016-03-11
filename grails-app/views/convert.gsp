<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Exchange Rates &amp; Converter - Foreign Cash</title>
<meta name="description" content="Usable currency converter, all major currencies in one table, calculating with the latest exchange rates"> 
<meta name="keywords" content="currency calculator, currencies, rates, exchanges, fx rates, currency, foreign, x-rates,exchange rates, currency exchange, currency rates, currency services, best exchange rates, rates, convert, currencies, currency,  central bank rates, charting, charts,foreign exchange, foreign exchange payment,"> 
 
</head>
<body>
	<div class="container">
		<div class="col-md-2">
			<script style="text/javascript">
			  document.write('<a style="display:none!important" id="600974"></a>');
			  if (window.AED_SHOW) {
			    window.AED_SHOW({wid: '600974',shortkey:'qzniq7eMn', size:'160x600', custom:{}});
			  } else {
			    window.AED_ONLOAD = window.AED_ONLOAD || [];
			    window.AED_ONLOAD.push({wid:'600974',shortkey:'qzniq7eMn',size:'160x600',custom:{}});
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
		<div class="col-md-8">
			<div class="well"><h4>Simply to use - just enter necessary amount in the column Rates</h4> default - 1 USD</div>
			<table class="table table-bordered table-hover">
				<tr class="active">
					<th><span class="pull-right">Currency</span></th>
					<th>Rates for <g:formatDate format="yyyy-MM-dd" /></th>
				</tr>
				<g:each in="${rates.sort()}" var="rate">
					<g:set value="${foreigncash.Currency.findByCode(rate.key)}"
						var="flag"></g:set>
					<tr class="warning">
						<td><span class="pull-right"> ${rate.key}
						</span>
						<g:if test="${flag?.flag}">
								<img src="${createLink(uri:'/pics/'+flag?.properties?.flagId+'.jpg') }" 
								alt="${flag?.name}" height="32px" />
							</g:if></td>
						<td><g:hiddenField name="ratevalue${rate.key}"
								value="${rate.value}" /> <g:field type="text"
								name="rate${rate.key}"
								onchange="rates('${rate.key}',this.value,${rate.value})"
								value="${rate.value.round(2)}" class="form-control" /></td>
					</tr>
				</g:each>



			</table>
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
	<script type="text/javascript">
		function rates(code,count,rate) {

			var base = document.getElementById('rate' + code);
			
			var rows = document.getElementsByTagName('tr');
			for (i = 0; i < rows.length; i++) {
				var cells = rows[i].getElementsByTagName('td');
				if(cells.length>0){
					var inp = cells[1].getElementsByTagName('input');
					if(inp[1].name!=base){
					
					   inp[1].value=(1/rate*inp[0].value*count).toFixed(2);
					}
										}
				
			}
		}
	</script>
	<r:layoutResources />
</body>
</html>
