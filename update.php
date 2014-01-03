<?php

require_once('includes.php');

if(isset($_GET["collector"]) && !empty($_GET["collector"]))
{
	$collector = $_GET["collector"];
}
$smarty->assign('collector',$collector);
$smarty->display('update.tpl');