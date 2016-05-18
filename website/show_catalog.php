<?php
require_once("common.php");
$page_title = "Catalogo della biblioteca";
include("open_the_html.php");;
// Using procedural style
$connection = mysqli_connect($mysql_host, $mysql_user, $mysql_password, $database);
if (!$connection) {
    echo "Error: unable to connect to MySQL";
    echo mysqli_connect_error();
}
else {
    echo "Successfully connected to MySQL database <b>" . $database . "</b>\n<br>";

}

//$the_query = "SELECT * FROM books";
//$result = $connection->query($the_query);
//while ( $row = $result->fetch_assoc() ){
//    //id, title, series, authors, category_id
//    echo $row['title'] . " " .  $row['authors'];
//    echo "<br/>";
//}
include("close_the_html.php");;

?>
