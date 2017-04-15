<?php
$mysql_host = 'localhost';
$mysql_user = 'librarian';
$mysql_password = 'salame';
$database = 'pergamos';

function test_input($data) {
   $data = trim($data);
   $data = stripslashes($data);
   $data = htmlspecialchars($data);
   return $data;
  }
?>
