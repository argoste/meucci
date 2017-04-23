<?php
require_once('common_functions.php');
meucci_connect_to_database();
$sql = "SELECT * FROM monography;";
$result = meucci_execute_sql($myPDO, $sql);
echo(gettype($result) . "\n");
meucci_disconnect_from_database();

?>
