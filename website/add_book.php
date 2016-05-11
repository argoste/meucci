<?php
require_once("common.php");
$page_title = "Aggiungi un nuovo libro al catalogo";
include("open_the_html.php");
?>
<form action="" method="post">
    <div>Titolo: <input type="text" name="book_title"></div>
    <div>Autori: <input type="text" name="book_authors"></div>
    <input type="submit" value="cerca">
</form>
<?php
$connection = new mysqli($mysql_host, $mysql_user, $mysql_password, $database);
$book_authors = test_input(  $_POST["book_authors"]  );
$book_title = test_input(  $_POST["book_title"]  );
$the_query = <<<QUERY
INSERT INTO books (title, authors) VALUES (
"$book_title"
,
"$book_authors"
)
QUERY;
$connection->query($the_query);
// please add here some feedback to the user
/*
if () {
    
}
else {
    
}
*/
include("close_the_html.php");
?>
