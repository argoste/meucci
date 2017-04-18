<?php
/*
echo($_POST['monography_title']);
echo "<br/>";
echo( "<pre>" . var_dump($_POST['author']) . "</pre>");
echo "<br/>";

foreach($_POST['author'] as $foo) {
  echo($foo . "<br/>");
}
*/
echo "<h1>All variables given by user</h1>";
foreach($_POST as $user_input) {
  echo "<pre>";
  echo var_dump($user_input);
  echo "</pre>";
}
?>
