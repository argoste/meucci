<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="generator" content=
  "HTML Tidy for HTML5 for Linux version 5.4.0">
  <meta charset='utf-8'>
  <link rel='icon' href='img/favicon.gif'>
  <title><?php echo $page_title; ?></title>
  <link rel="stylesheet" href="meucci.css">
</head>
<body>
  <header>
    <h1>The awesome Meucci Library</h1>
  </header>
  <nav>
    <ul>
      <li>
        <a href="index.php">Home page</a>
      </li>
      <li>
        <a href="show_catalog.php">Show the complete catalog</a>
      </li>
      <!-- TODO create a access privilege mechanism with login and stuff -->
      <li>Staff Members only
        <ul>
          <li>
            <a href="add_book_frontend.php">Add a new book</a>
          </li>
          <li>Register a book loan</li>
          <li>Register a book return</li>
        </ul>
      </li>
    </ul>
  </nav>
  <main>
    <h2><?php echo $page_title; ?></h2>
    <?php echo $main_content; ?>
  </main>
  <footer>
    <!-- I state some facts and show some of my moral values -->
    <div>
      <!-- TODO mobile accessibility e responsive layout -->
      The <strong>user interface</strong> tries (BUT IS FAR FROM COMPLETE) to be accessible to anyone by adhering to W3C standards (HTML5, CSS3).
    </div>
    <div>
      The <strong>code</strong> that makes this site respect your freedom (it is Libre Software), grab
      <a href="https://github.com/argoste/meucci">the source</a>.
    </div>
    <div>
      The <strong>content</strong> of this site was made by <a href="mailto:stefanocarlesso@gmx.com">Stefano Carlesso</a>
      and is released under Copyleft CC-BY-SA-NC.
    </div>
  </footer>
</body>
</html>
