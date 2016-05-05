<?php
$page_title = "New book";
require_once("common.php");
//connect to mysql
connect_to_mysql();
//2 SELECT the database to use
mysql_select_db($db_database)
  or die("Unable to select database: " . mysql_error() );

//cREATE WEBPAGE AND USER INPUT
open_the_html("Inserimento di un nuovo libro");
echo <<< INIZ
<h2>Inserisci i dati del nuovo libro</h2>
<form action='insert.php' method='post'>
  <div>Titolo: <input type='text' name='book_title'></div>
  <div>Autori: <input type='text' name='book_authors'></div>
INIZ;
$book_authors = test_input(  $_POST["book_title"]  );
$book_title = test_input(  $_POST["book_authors"]  );


// 3 Building a query
$query = <<<INSQUERY
INSERT INTO books (title, authors) VALUES (
"$book_title"
,
"$book_authors"
)
INSQUERY;

// 4 execute the query
$result = mysql_query($query);

// 5 DISCONNECT from MYsql
mysql_close();





mysql_select_db($db_database);

$retval = mysql_query($query, $connection);
if ($retval == false) {
  die('Could not insert data' . mysql_error() );
}
echo "Entered data successfully!<br>";

echo "<a href='new-book.php'>Inserisci un nuovo libro</a><br>";
echo "<a href='index.php'>Torna alla pagina iniziale</a><br>";

mysql_close($connection);

?>