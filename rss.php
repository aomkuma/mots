<?php
	

	$content = file_get_contents('http://motstesting.webstarterz.com/mots/services/public/news/rss/');
	
	$data = json_decode($content, true);

	$rss = $data['data']['DATA']['News'];

	echo '<?xml version="1.0" encoding="UTF-8"?>'.PHP_EOL;
	echo '<rss version="2.0">'.PHP_EOL;
	echo "	<channel>".PHP_EOL;
	echo "		<title>กระทรวงการท่องเที่ยวและกีฬา</title>".PHP_EOL;;
	echo "		<link>https://www.mots.go.th/</link>".PHP_EOL;;
	echo "		<description>กระทรวงการท่องเที่ยวและกีฬา</description>".PHP_EOL;;
	
	foreach ($rss as $key => $value) {
		echo "		<item>".PHP_EOL;
		echo "			<title>" . $value['title_th'] . "</title>".PHP_EOL;;
		echo "			<link>http://motstesting.webstarterz.com/mots/#/news/detail/" . $value['id'] . "</link>".PHP_EOL;;
		echo "			<description>" . htmlentities($value['contents']) . "</description>".PHP_EOL;;
		// foreach ($value as $k => $v) {
			// echo "	<" . $k . ">" . htmlentities($v) . "</" . $k . ">".PHP_EOL;

		// }
		echo "		</item>".PHP_EOL;
	}
	echo "	</channel>".PHP_EOL;
	echo "</rss>".PHP_EOL;
	// echo "<pre>";
	// print_r($rss);
	exit;
?>