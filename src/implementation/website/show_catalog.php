<?php
require_once("common_functions.php");
$page_title = "Catalogo della biblioteca";

$myPDO = meucci_connect_to_database();
$sql = "SELECT * FROM monography;";
$result = meucci_execute_sql($myPDO, $sql);
meucci_disconnect_from_database();
$main_content = "<table><tr><th>id</th><th>title</th></tr>";
while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
    $main_content .= "<tr>";
    $main_content .= "<td>".$row['id']."</td>";
    $main_content .= "<td>".$row['title']."</td>";
    $main_content .= "</tr>";
}
$main_content .= "</table>";

require_once('page_template.php');
?>
