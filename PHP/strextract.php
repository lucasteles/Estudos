<?php

function strextract($text, $start, $end, $occurs)
{
	$offset = 0;

	for ($i = 0; $i <= $occurs; $i++) 
		$offset = strpos($text, $start, $offset+strlen($start));

	
   	$init = strpos($text, $start, $offset  )+strlen($start);
   	$final = strpos($text, $end, $init);
   	$len = $final - $init;

   	return substr($text, $init, $len);

}

$FULLTEXT = "teste <span>hello man</span> CHUNK
		<span>vai cavalo</span>
		<span>xua</span>sjnsdaofjiosdajfiosdafsofas
		fsadopfjpsadjpiofjipsda
		fpadsjifjpisad
		<span>lucas</span>
		asdokfjpdsiafpjkdsapjkofsdapkofkosdafkdsfpsd
		<span>fim</span>
	";

$TOTAL_TAGS = substr_count($FULLTEXT,"<span>");

for ($i = 0; $i < $TOTAL_TAGS; $i++) 
{
	echo strextract($FULLTEXT,"<span>","</span>", $i) ;
	echo "<br>";
}
	



?>