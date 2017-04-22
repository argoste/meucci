<?php
require_once("common_functions.php");
// set some values for TESTING
$monography_title = "Quercia o mia quercia";
$author = array("Maccio", "Herbert", "Ivo");
$subject = array("3", "7", "9");
$copies_quantity = "4";
// in PRODUCTION these valuse are obtained like so
// $monography_title = meucci_test_input( $_POST['book_title']);
meucci_complete_insert($monography_title, $author, $subject, $copies_quantity);
?>
