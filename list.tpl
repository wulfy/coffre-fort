<!doctype html>
<html lang="en" ng-app="coffrefortApp">
<head>
  <link rel="shortcut icon" href="coffre.ico" type="image/x-icon"/> 
  <link rel="icon" href="coffre.ico" type="image/x-icon"/>
  <link rel="stylesheet" type="text/css" href="style.css" media="screen">
  <meta charset="utf-8">
  <title>Coffre fort</title>
  <link rel="stylesheet" href="css/app.css">
  <link rel="stylesheet" href="css/bootstrap.css">
  <script>
	var angularData = <!--{$angularData}-->;
  </script>
  <script src="lib/angular/angular.js"></script>
  <script src="js/controllers.js"></script>
 
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
          <option value="date" ng-selected="reverse=true">Newest</option>
        </select>

      </div>
      <div class="span10">
        <!--Body content-->
		<div ng-repeat="directory in directories | filter:query">
		<a href='update.php?collector={{directory.directoryName}}'>{{directory.directoryName}}</a>
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