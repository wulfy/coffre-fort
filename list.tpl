<!doctype html>
<html lang="en" ng-app="coffrefortApp">
<head>
  <link rel="shortcut icon" href="coffre.ico" type="image/x-icon"/> 
  <link rel="icon" href="coffre.ico" type="image/x-icon"/>
  <link rel="stylesheet" type="text/css" href="css/style.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/jquery.fancybox-1.3.4.css" media="screen">
  <meta charset="utf-8">
  <title>Coffre fort</title>
  <link rel="stylesheet" href="css/app.css">
  <link rel="stylesheet" href="css/bootstrap.css">
  <script>
	var angularData = <!--{$angularData}-->;
  </script>
  <script src="lib/angular/angular.js"></script>
  <script src="js/controllers.js"></script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
  <script>
 	function refresh(element){

		var newImg = document.createElement('img');
		newImg.setAttribute('src',"http://carte.allonspecher.com/images/loading.gif");
		newImg.setAttribute('id',"loading_"+element.parentNode.id);
		newImg.setAttribute('width',"20px");
		element.parentNode.appendChild(newImg);
		var xmlhttp;
		if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		xmlhttp.onreadystatechange=function()
		  {
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				var el = document.getElementById( "loading_"+element.parentNode.id );
				var parent = el.parentNode;
				parent.removeChild(el);
				response =  xmlhttp.responseText;
				errorPos = response.search("CasperError:");
				if(errorPos>0)
				{
					var newAlert = document.createElement('font');
					newAlert.setAttribute('style',"color:red");
					newAlert.innerHTML ="Erreur";
					parent.appendChild(newAlert);
					alert(response.substr(errorPos, 200));
				}
			}
		  }
		xmlhttp.open("GET","launcher.php?collector="+element.parentNode.id,true);
		xmlhttp.send();
		//
	}
  </script>
</head>
<body ng-controller="FacturesListCtrl">

  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span2">
        <!--Sidebar content-->
		<a href='index.php?update=true'>Mettre a jour</a>
        Search: <input ng-model="query">
        Sort by:
        <select ng-model="orderProp">
          <option value="url" ng-selected="reverse=true">Alphabetical</option>
          <option value="timestamp" ng-selected="reverse=true">Newest</option>
        </select>

      </div>
      <div class="span10">
        <!--Body content-->
		<div ng-repeat="directory in directories | filter:query">
		<div id='{{directory.directoryName}}' > <a href='#' onclick="refresh(this)">{{directory.directoryName}}</a> </div>
        <ul class="files">
		  <li ng-repeat="file in directory.files | filter:query | orderBy:orderProp:reverse">
           <a href='{{file.url}}' target='_blank'>{{file.name}}</a>
          </li>
        </ul>
		</div>
      </div>
    </div>
  </div>
</body>
</html>