<?php

function strextract($text, $start, $end, $occurs)
{
	$offset = 0;

	for ($i = 0; $i <= $occurs; $i++) 
		$offset = strpos($text, $start, $offset+strlen($start));

   	$init = strpos($text, $start, $offset );
   	$final = strpos($text, $end, $init);
   	$len = $final - $init;

   	return substr($text, $init, $len);

}

$FULLTEXT = "teste <oi>hello man</oi>
					CHUNK<oi>vai cavalo</oi>
		<oi>xua</oi>sjnsdaofjiosdajfiosdafsofas
		fsadopfjpsadjpiofjipsda
		fpadsjifjpisad
		<oi>lucas</oi>
		asdokfjpdsiafpjkdsapjkofsdapkofkosdafkdsfpsd
		<oi>fim</oi>
	";

$TOTAL_TAGS = substr_count($FULLTEXT,"<oi>");

for ($i = 0; $i < $TOTAL_TAGS; $i++) 
{
	echo strextract($FULLTEXT,"<oi>","</oi>", $i) ;
	echo "<br>";
}
	



?>