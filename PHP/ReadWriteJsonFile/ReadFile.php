<?php
	
	$fileName = $_GET["File"];
	$myfile = fopen($fileName, "r");
	
	$json = file_get_contents($fileName);
	
	echo "</br>", $json, "</br></br>";
	
	$json = json_decode($json);
	
	$Name = $json->Name;
	$Text = $json->Text;
	$Date = $json->TimeStamp;
	
	echo "FileName: <b>", $fileName, "</b></br>";
	echo "Name: <b>",     $Name,     "</b></br>";
	echo "Text: <b>",     $Text,     "</b></br>";
	echo "Date: <b>",     $Date,     "</b></br>";
	
	
	
	//fwrite($myfile, $json);
?>