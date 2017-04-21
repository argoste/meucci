<?php
// CONSTANTS have  global scope

define("HOST", 'localhost');
define("USER" , 'ste');
define("PASSWORD", 'salame');
define("DBNAME", 'meucci');

function meucci_test_input($data) {
   $data = trim($data);
   $data = stripslashes($data);
   $data = htmlspecialchars($data);
   return $data;
  }

function meucci_connect_to_database() {
  // variales defined withinn a function have a local scope
  $dsn = "pgsql:dbname=".DBNAME.";host=".HOST;
  global $myPDO; // this variable will be available everywhere
  $myPDO  = new PDO($dsn, USER, PASSWORD);
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

function meucci_execute_sql($sql) {
  global $myPDO, $result;
  $result = $myPDO->query($sql);
  if ($result !== False) {
    echo("My query was succesful\n");
  } else {
    echo("The query failed.\n");
  }
  return $result;
}
function meucci_test_sql($sql){
  meucci_connect_to_database();
  global $myPDO, $result;
  $result = meucci_execute_sql($myPDO, $sql);
  echo(gettype($result) . "\n");
  meucci_disconnect_from_database();
}
function meucci_complete_insert ($monography_title, $author, $subject, $copies_quantity) {
  $myPDO = meucci_connect_to_database();
  meucci_test_sql("BEGIN TRANSACTION;");
  meucci_test_sql("INSERT INTO monography (title) VALUES ($monography_title) ON CONFLICT DO NOTHING;");
  foreach ($author as $a) {
    meucci_test_sql("INSERT INTO author (authorname) VALUES ($a);");
  }
  meucci_test_sql("SELECT id FROM monography WHERE title = $monography_title;");
  for ($b = 0; $b <= $copies_quantity; $b ++) {
    meucci_test_sql("INSERT INTO physicalcopy (monography_id) $result[$b];");
  }
  // Populate the Junction Table. It can be done either with logic managed by PHP as here
  // or maybe using a SQL INSERT with a subquery
  //meucci_test_sql("INSERT INTO physicalcopy(monography_id) VALUES ();");
  meucci_test_sql("INSERT INTO monography_subject(monography_id, subject_id) VALUES ();");
  meucci_test_sql("COMMIT;");
  meucci_disconnect_from_database();
}
?>
