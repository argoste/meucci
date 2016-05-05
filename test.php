<?php
require_once("common.php");
$page_title = "Test testato";
open_the_html($page_title);
echo("<p>This is a test for <emph>mysqli<emph>, a modern way to use MySQL
     Databases with PHP</p>");
// COPYING `PHP The good parts` MacIntyre
$connection = new mysqli($mysql_host, $mysql_user, $mysql_password, $database);
$the_query = "SELECT * FROM books";
$result = $connection->query($the_query);
while ( $row = $result->fetch_assoc() ){
    //id, title, series, authors, category_id
    echo $row['title'] . " " .  $row['authors'];
    echo "<br/>";
}
close_the_html();

?>
