<?php
$collectorCommand = "";

if(isset($_GET["collector"]) && !empty($_GET["collector"]))
{
	$collector = $_GET["collector"];
	$collectorCommand = " --collector=".$collector;
}

if(isset($_GET["debug"]) && !empty($_GET["debug"]))
{
	if(!!$_GET["debug"])
		$collectorCommand .= " --log-level='debug'";
}

$fullpath = realpath(dirname(__FILE__));
$collectorCommand .= " --fullpath='$fullpath'";

$command = '/kunden/homepages/3/d333316483/htdocs/ludo/coffre-fort/casperjs/bin/casperjs --ignore-ssl-errors=yes --web-security=no'.
' /kunden/homepages/3/d333316483/htdocs/ludo/coffre-fort/collecteurs/collector.js '.$collectorCommand;

echo "<pre>";
$data = system($command);
echo "</pre>";

//echo $command."\r\n";
//echo $data;