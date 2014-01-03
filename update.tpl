<!doctype html>
<html lang="en">
<head>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script>
		$('#display').load('http://www.lmsecurite.fr/ludo/coffre-fort/launcher.php?collector=Aviva&debug=true'); 
	</script>
</head>
<body>

  <div class="container-fluid">
		<div id="display">
			<iframe width="90%" height='400px' src='http://www.lmsecurite.fr/ludo/coffre-fort/launcher.php?collector={{$collector}}&debug=true'>
			</iframe>
		</div>
  </div>
</body>
</html>