<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Contact - Foreign Cash</title>

</head>
<body>
	<hr>
	<div class="row">
		<g:if test="${flash.message}">
			<div
				class="alert alert-success alert-dismissable col-md-8 col-md-offset-2">
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">&times;</button>
				<g:message code="${flash.message}" />
			</div>
		</g:if>
	</div>
	<div class="row">
		<div class="well col-md-8 col-md-offset-2">
			<strong>Pleases send your propositions and wishes below</strong> or
			contact us - <a id="mylo" href="" ></a>
		</div>
		<g:form name="sendform" class="col-md-8 col-md-offset-2"
			controller="send" action="letter">
			<div class="form-group ">

				<g:textArea name="letter" rows="5" disabled="false"
					class="form-control" placeholder="..."></g:textArea>
			</div>
			<g:submitButton name="sendbtn" class="btn btn-primary" value="send" />


		</g:form>
	</div>
	<script type="text/javascript">
	window.onload=function() {
			var a = document.getElementById('mylo');
			var address = "info";
			address += "@";
			address += "foreigncash.net";
			a.innerHTML = address;
			a.setAttribute("href", "mailto:"+address);

		}
	</script>
	<r:layoutResources />
</body>
</html>