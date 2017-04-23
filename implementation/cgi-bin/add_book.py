#!/usr/bin/env python3
import web
import database

web.page_title = "Add a new book"

form  = '''
<form action="add_book.py" method="post">
  <legend>Add a new book</legend>
  <fieldset>
  <label for="monography_title">Title</label>
      <!-- in PHP it will became a simple string -->
    <input type="text" name="monography_title">
  </fieldset>
  <fieldset  id="fieldset_authors">
    <legend>Authors (one for each line)</legend>
    <!-- in PHP it will became an array of strings -->
    <div>
      <input type="text" name="author">
    </div>
    <div>
      <input type="text" name="author">
    </div>
    <div>
      <input type="text" name="author">
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
        <!-- in PHP it will became an array of strings (I need to be converted to number)-->
    <div>
        <input type="checkbox" name="subject" value="0" id="subject0">
        <label for="subject0">Information sciences</label>
      </div>
      <div>
        <input type="checkbox" name="subject" value="1" id="subject1">
        <label for="subject1">Philosophy or Psycology</label>
      </div>
      <div>
        <input type="checkbox" name="subject" value="2" id="subject2">
        <label for="subject2">Religion</label>
      </div>
      <div>
        <input type="checkbox" name="subject" value="3" id="subject3">
        <label for="subject3">Social sciences</label>
      </div>
      <div>
        <input type="checkbox" name="subject" value="5" id="subject5">
        <label for="subject5">Mathematics or natural sciences</label>
      </div>
      <div>
        <input type="checkbox" name="subject" value="6" id="subject6">
        <label for="subject6">Applied sciences, Medicine and Technology</label>
      </div>
      <div>
        <input type="checkbox" name="subject" value="7" id="subject7">
        <label for="subject7">Arts, entertainment and Sport</label>
      </div>
      <div>
        <input type="checkbox" name="subject" value="8" id="subject8">
        <label for="subject8">Language, Linguistics and Literature</label>
      </div>
      <div>
        <input type="checkbox" name="subject" value="9" id="subject9">
        <label for="subject9">Geography, History and Biography</label>
      </div>
    </fieldset>
    <fieldset>
      <label for="copies_quantity">Number of copies</label>
          <!-- in PHP it will became strings (I need to convert it to a number)-->
        <input type="number" name="copies_quantity" value="1">
        </fieldset>

      <fieldset>
          <input type="submit" value="Submit">
      <input type="reset" value="Reset">
    </fieldset>
</form>
'''


user_input = web.cgi.FieldStorage()

if "monography_title" not in user_input:
    message = "PLEASE ENTER SOME VALUES"
else:
    message = "You have input: "
    message = message + user_input.getvalue("monography_title")
subject = user_input.getvalue("subject")
if isinstance(subject, list):
    message = message + "; multiple subjects;"
else:
    message = message + "; 0 or 1 subject;"
monitor = '<div class="monitor">'+ message  + "</div>"

database.execute()


web.main_content = form + monitor
web.web_page()
