<?php
	header("Content-Type: text/html; charset=UTF-8");
	$host = "mariaDB";
	$username = "root";
	$password = "654321";
	$database = "test_mariaDB";
	try {
		$connection = new mysqli($host, $username, $password, $database);
		$connection->set_charset("utf8");
		if ($connection->connect_error) {
			die("Connection failed");
		}
	
		// $sql = "SELECT * FROM ISD_db";
		// $result = $connection->query($sql);

		// while ($row = $result->fetch_assoc()) {
		// 	echo "Лабораторна робота №" . $row['id'] . " \t Тема. " . $row['theme'];
		// 	echo "<br>";
		// }
	} catch (Exception $e) {
		echo 'Exception: ',  $e->getMessage(), "\n";
	}

	echo phpinfo();
?>
