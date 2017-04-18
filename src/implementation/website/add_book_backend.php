<?php
require_once("common_functions.php");
$myPDO = meucci_connect_to_database();
// set some values for TESTING
$monography_title = 'Six easy pieces';
$author_name = 'Richard Feynman';
$subject = 5;
// in PRODUCTION these valuse are obtained like so
// $monography_title = meucci_test_input( $_POST['book_title']);

$sql1 = <<<SQL1
BEGIN TRANSACTION;
INSERT INTO monography (title) VALUES ($monography_title);
SQL1;
$sql2 = '';
for () {
"INSERT INTO author (authorname) VALUES ($author_name);"
}
$sql3 =<<<SQL3
INSERT INTO physicalcopy(monography_id) VALUES ();
INSERT INTO monography_author(monography_id, author_id) VALUES ();
INSERT INTO monography_subject(monography_id, subject_id) VALUES ();
COMMIT;
SQL3;

$sql = $sql1 . $sql2 . $sql3;
$result = meucci_execute_sql($myPDO, $sql);
meucci_disconnect_from_database();

?>
