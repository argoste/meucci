<?php
$mysql_host = 'localhost';
$mysql_user = 'librarian';
$mysql_password = 'salame';
$database = 'pergamos';

function meucci_test_input($data) {
   $data = trim($data);
   $data = stripslashes($data);
   $data = htmlspecialchars($data);
   return $data;
  }

function meucci_connect_to_database() {
  $dsn = 'pgsql:dbname=meucci;host=localhost';
  $myPDO  = new PDO($dsn, 'ste', 'salame');
  if (! $myPDO) {
    echo("Error: cannot connect to Postgres database.\n");
  } else {
    echo("Connection to Postgres successful!\n");
  }
  return $myPDO;
}

function meucci_disconnect_from_database() {
  // close the query
  $result = null;
  // close the connection
  $myPDO = null;
}

function meucci_execute_sql($myPDO, $sql) {
  $result = $myPDO -> query($sql);
  if ($result !== False) {
    echo("My query was succesful\n");
  } else {
    echo("The query failed.\n");
  }
  return $result;
}


?>
