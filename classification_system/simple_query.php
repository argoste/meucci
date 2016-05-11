<?php
$db_hostname = 'localhost';
$db_user = 'ste';
$db_password = 'samovar37URS';
$connection = mysql_connect($db_hostname, $db_user, $db_password);
if ($connection == true) {
  echo "Successfully connected to database server";
  }
else {
  fwrite(STDERR, "An error occurred.\n");
  die('could not connect: ' . mysql_error());
  }
$db_database = 'pergamos';
mysql_select_db($db_database);
$query = 'SELECT * FROM books';
$result = mysql_query($query, $connection);
if ($result == false) {
  die('Could not get data' . mysql_error() );
}
//$resulting_rows = mysql_num_rows($result);
while ($current_row = mysql_fetch_array($result, MYSQL_ASSOC) ) {
  echo
  "<div>" .
  $current_row["title"]
  . " BY " .
  $current_row["authors"]
  . "</div>" ;
}


mysql_close($connection);
?>
