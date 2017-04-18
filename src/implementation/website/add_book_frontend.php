<?php
require_once("common_functions.php");
$page_title = "Add a new book";
$main_content = <<<MAIN
<!-- IN PRODUCTION change action="add_book_backend.php" -->
<form action="test_backend" method="post">

  <legend>A new book!</legend>

  <fieldset>
  <label for="monography_title">Title</label>
    <input type="text" name="monography_title">
  </fieldset>

  <fieldset  id="fieldset_authors">
    <legend>Authors (one for each line)</legend>
    <div>
      <input type="text" name="author[]">
    </div>
    <div>
      <input type="text" name="author[]">
    </div>
    <div>
      <input type="text" name="author[]">
    </div>
    <!-- TODO add a button and some javascript
    to dynamically create more author input boxes
    something along the lines of this
    <input type="button" value="Add more authors" id="myButton">
    <script>
        var myButton = document.getElementById('myButton');
        myButton.addEventListener('click', createParagraph);
        function createParagraph() {
          var para = document.createElement('p');
          para.textContent = "another";
          document.body.appendChild(para);
        }
    </script>
    -->
  </fieldset>

  <fieldset>
    <legend>Subject (UDC)</legend>
    <div>
        <input type="checkbox" name="subject[]" value="0" id="su0">
        <label for="su0">Information sciences</label>
      </div>
      <div>
        <input type="checkbox" name="subject[]" value="1" id="su1">
        <label for="su1">Philosophy or Psycology</label>
      </div>
      <div>
        <input type="checkbox" name="subject[]" value="2" id="su2">
        <label for="su2">Religion</label>
      </div>
      <div>
        <input type="checkbox" name="subject[]" value="3" id="su3">
        <label for="su3">Social sciences</label>
      </div>
      <div>
        <input type="checkbox" name="subject[]" value="5" id="su5">
        <label for="su5">Mathematics or natural sciences</label>
      </div>
      <div>
        <input type="checkbox" name="subject[]" value="6" id="su6">
        <label for="su6">Applied sciences, Medicine and Technology</label>
      </div>
      <div>
        <input type="checkbox" name="subject[]" value="7" id="su7">
        <label for="su7">Arts, entertainment and Sport</label>
      </div>
      <div>
        <input type="checkbox" name="subject[]" value="8" id="su8">
        <label for="su8">Language, Linguistics and Literature</label>
      </div>
      <div>
        <input type="checkbox" name="subject[]" value="9" id="su9">
        <label for="su9">Geography, History and Biography</label>
      </div>
    </fieldset>

<fieldset>
  <label for="copies_quantity">Number of copies</label>
    <input type="number" name="copies_quantity" value="1">
  </fieldset>

  <fieldset>
      <input type="submit" value="Submit">
  <input type="reset" value="Reset">
</fieldset>


</form>
MAIN;
require_once('page_template.php');
?>
