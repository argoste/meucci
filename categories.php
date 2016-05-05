<?php

/*
echo <<<FRIM
<div>
Classifica il libro in una delle seguenti categorie
(Classificazione Decimale Universale):
FRIM;

$book_category[0] = "Generalitá. Informatica. Biblioteche";
$book_category[1] = "Filosofia. Psicologia";
$book_category[2] = "Religione. Teologia";
$book_category[3] = "Scienze Sociali";
//$book_category[4] = ""; //this is vacant for future expansion
$book_category[5] = "Scienze naturali. Matematica";
$book_category[6] = "Scienze Applicate. Medicina. Tecnologia";
$book_category[7] = "Arti. Architettura. Fotografia. Musica. Intrattenimento. Sport";
$book_category[8] = "Lingua. Linguistica. Letteratura";
$book_category[9] = "Geografia. Biografia. Storia";

echo "<ul style='list-style-type:none;'>";
foreach($book_category as $value) {
  echo "<li><input type='radio' name='book_category' value=$key>$value</li>\n";
}
echo "</ul>\n</div>";
*/



echo <<< INTERMEZZO

<div><input type='submit' value='Conferma'></div>
</form>
INTERMEZZO;
echo $intermezzo;
close_the_html();
?>
