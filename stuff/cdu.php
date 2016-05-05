<?php
require_once('common.php');
open_the_html('Classificazione Decimale Universale');
?>
<p>La <dfn>Classificazione Decimale Universale</dfn> (<acronym>UDC</acronym>)
é uno schema di classificazione per tutti i campi della conoscenza.</p>
<p>La notazione usa numeri arabi, simboli matematici come piú e meno e
alcuni simboli usati normalmente come punteggiatura. Ogni classe é una frazione
decimale del numero uno.</p>
<?php
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

echo "<form action='' method='post'>
<!-- by default the action is set to the current URL -->";

$categoryX = array(
	  0 => "Generalitá. Informatica. Biblioteche",
	  1 => "Filosofia. Psicologia",
	  2 => "Religione. Teologia",
	  3 => "Scienze Sociali",
	  5 => "Scienze naturali. Matematica",
	  6 => "Scienze Applicate. Medicina. Tecnologia",
	  7 => "Arti. Architettura. Fotografia. Musica. Intrattenimento. Sport",
	  8 => "Lingua. Linguistica. Letteratura",
	  9 => "Geografia. Biografia. Storia"
);
echo "<input type='text' name='categoryX' list='list1'>
<datalist id='list1'>";
foreach ($categoryX as $key => $value ) {
	//echo 	"<div><input type='radio' name='categoryX' value='$key'>$value</div>";
	echo "<option value='$key' label='$value'>	";
}
echo '</datalist>';
	/*
5 Mathematics. Natural Sciences
51 Mathematics
52 Astronomy. Astrophisics. Space reasearch. Geodesy
53 Physics
54 Chemistry. Crystallography. Mineralogy
55 Earth Sciences. Geological sciences
56 Paleontology
57 Biological sciences in general
58 Botany (including Fungi)
59 Zoology
*/
	echo "<input type='submit'>";
	echo"</form>";
	echo "<p> Questa é la classe risultante</p> ";
	echo "<div style='background: yellow;'>" . $_POST['categoryX'] . "</div></p>";
?>


<?php
echo "<p>The main source of information for this page is the 
<a href='http://udcc.org'>UDC Consortium</a>
</p>";
close_the_html();
?>