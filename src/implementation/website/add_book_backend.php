<?php
require_once("common_functions.php");
$myPDO = meucci_connect_to_database();
// set some values for TESTING

//string(21) "Quercia o mia quercia"
$monography_title = "Quercia o mia quercia";
/*
array(3) {
  [0]=>
  string(6) "Maccio"
  [1]=>
  string(7) "Herbert"
  [2]=>
  string(3) "Ivo"
}
*/
$author = {"Maccio", "Herbert", "Ivo"};
/*
array(3) {
  [0]=>
  string(1) "3"
  [1]=>
  string(1) "7"
  [2]=>
  string(1) "9"
}
*/
$subject = {"3", "7", "9"};

//string(1) "4"
$copies_quantity = "4";

// in PRODUCTION these valuse are obtained like so
// $monography_title = meucci_test_input( $_POST['book_title']);

$sql0 = <<<SQL0
  BEGIN TRANSACTION;
  INSERT INTO monography (title) VALUES ($monography_title);
SQL0;

// TODO here I need to understand better INBSERT when there is a Relationship
// maybe is matter of an INSERT with a SELECT child, so to speak
$sql1 = '';
foreach ($author as $a) {
  $sql1 .= <<<SQL1
    INSERT INTO author (authorname) VALUES ($a);
    INSERT INTO monography_author(monography_id, author_id) VALUES (

    );
SQL1;
}

$sql2 =<<<SQL2
INSERT INTO physicalcopy(monography_id) VALUES ();

INSERT INTO monography_subject(monography_id, subject_id) VALUES ();
COMMIT;
SQL2;

$sql = $sql1 . $sql2 . $sql3;
$result = meucci_execute_sql($myPDO, $sql);
meucci_disconnect_from_database();

?>
