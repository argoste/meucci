<?php
require_once("common.php");
$page_title = "Catalogo della biblioteca";
include("open_the_html.php");;
// COPYING `PHP The good parts` MacIntyre
$connection = new mysqli($mysql_host, $mysql_user, $mysql_password, $database);
$the_query = "SELECT * FROM books";
$result = $connection->query($the_query);
while ( $row = $result->fetch_assoc() ){
    //id, title, series, authors, category_id
    echo $row['title'] . " " .  $row['authors'];
    echo "<br/>";
}
include("close_the_html.php");;

?>
