<?php
$mysql_host = 'localhost';
$mysql_user = 'librarian';
$mysql_password = 'samovar37URS';
$database = 'pergamos';

function test_input($data) {
   $data = trim($data);
   $data = stripslashes($data);
   $data = htmlspecialchars($data);
   return $data;
  }
  
function open_the_html(){
global $page_title;
echo <<<INITIAL
<!DOCTYPE html>
<html>
  <head>
    <meta charset='utf-8'>
    <link rel='icon' href='img/favicon.gif'>
    <title>$page_title</title>
    <style type="text/css">
      .bigbox {
         border: thin solid grey;
         margin: 4em;
         padding: 1em;
      }
      footer {
         position: fixed;
         bottom: 1em;
      }
    </style>
  </head>
  <body>
    <header>
      <div><a href="index.php">Torna alla pagina iniziale</a></div>
      <div>Pergamos Library</div>
      
    </header>
    <h1>$page_title</h1>
INITIAL;
}


function close_the_html() {
  echo  <<<FINAL
  <footer>Copyleft CC-BY-SA-NC <a href="mailto:stefanocarlesso@gmx.com">Stefano Carlesso</a></footer>
  </body>
</html>
FINAL;
}
?>
