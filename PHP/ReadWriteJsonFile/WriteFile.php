<?php
	
	$fileName = $_GET["File"];
	$Name = $_GET["Name"];
	$Text = $_GET["Text"];
	$Date = date('d-m-y h:i:s');
	
	
	echo "FileName: <b>", $fileName, "</b></br>";
	echo "Name: <b>",     $Name,     "</b></br>";
	echo "Text: <b>",     $Text,     "</b></br>";
	echo "Date: <b>",     $Date,     "</b></br>";
	
	$json = "{Name:JHstruton,Text:testing}";
	$json = '{"Name":"'.$Name.'","Text":"'.$Text.'","TimeStamp":"'.$Date.'"}';
	
	
	$myfile = fopen($fileName, "w");
	fwrite($myfile, $json);
?>