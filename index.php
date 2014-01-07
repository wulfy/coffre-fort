<?php

require_once('includes.php');
$base_dir = getcwd();
$files_dir = 'docs';
$rootdir    = getcwd() . '/'.$files_dir;

$dirData = scandir($rootdir);
$directories=[];
chdir($rootdir);
$query = $_SERVER['PHP_SELF'];
$path = pathinfo( $query );
$baseUrl = $path['dirname'];


foreach($dirData as $data)
{	
	if(is_dir($data))
	{
		$dir = $data."/";
		chdir($data);
		$directories[$data] = glob("*.pdf");
		chdir($rootdir);
	}
}

$angularData = [];
$directoryData=[];
foreach($directories as $directoryName => $files)
{
	$directoryData["directoryName"] = $directoryName;
	$filesData=[];
	$index=0;
	foreach($files as $fileName)
	{
		$filesData[$index]["name"]=$fileName;
		$filesData[$index]["type"]="pdf";
		$filesData[$index]["url"]= $files_dir."/".$directoryName."/".$fileName;
		$filesData[$index]["img"]="http://www.sft-congres.fr/Images/Public//PAGE__17__122013--347-1.gif";
		
		preg_match("/(0[1-9]|[12][0-9]|3[01])[_](0[1-9]|1[012])[_](19|20)\d\d/", $fileName, $matches);
		$filesData[$index]["date"] = $matches[0];
		$filesData[$index]["timestamp"] = strtotime(str_replace("_","-",$matches[0]));

		$index++;
	}
	$directoryData["files"] = $filesData;
	$angularData[] = $directoryData;
}
chdir($base_dir);
$smarty->left_delimiter = '<!--{';
$smarty->right_delimiter = '}-->';
$smarty->assign('angularData',json_encode($angularData));
$smarty->display('list.tpl');