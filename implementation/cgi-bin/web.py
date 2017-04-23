# this module is to create web pages in a very minimalistic style
import cgi
import cgitb # to debug TODO remove in production
cgitb.enable()


# Default values to be overridden by your values
site_name="The awesome Meucci Library"
page_title = "page title here"
stylesheet = "/styles/style.css"
favicon = '/img/favicon.gif'
main_content = "main content here"
# I use simple built-in python templates
## a simple template
template ="""
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset='utf-8'>
  <link rel='icon' href="{Favicon}">
  <title>{PageTitle}</title>
  <link rel="stylesheet" href="{Stylesheet}">
</head>
<body>
  <header>
    <h1>{SiteName}</h1>
      <nav>
        <ul>
            <li><a href="index.py">Home page</a></li>
            <li>
                <a href="show_catalog.py">The complete catalog in one page</a>
            </li>
            <li>Search the catalog</li>
            <!--
                TODO create a access privilege mechanism with login and stuff
            -->
            <!--Staff Members only-->
            <li><a href="add_book.py">Add a new book</a></li>
            <li>Register a book loan</li>
            <li>Register a book return</li>
        </ul>
      </nav>
  </header>

  <main>
    {MainContent}
  </main>
  <footer>
    <!-- I state some facts and show some of my moral values -->
    <div>
      <!-- TODO mobile accessibility e responsive layout -->
      The <strong>user interface</strong> tries (BUT IS FAR FROM COMPLETE) to
      be accessible to anyone by adhering to W3C standards (HTML5, CSS3).
    </div>
    <div>
      The <strong>code</strong> that makes this site respect your freedom
      (it is Libre Software), grab
      <a href="https://github.com/argoste/meucci">the source</a>.
    </div>
    <div>
      The <strong>content</strong> of this site was made by
      <a href="mailto:stefanocarlesso@gmx.com">Stefano Carlesso</a>
      and is released under Copyleft CC-BY-SA-NC.
    </div>
  </footer>
</body>
</html>
"""


def web_page():
    """Create the HTML for a web page"""
    print("Content-Type: text/html;charset=utf-8")
    print()
    print(
        template.format(
            SiteName=site_name,
            PageTitle=page_title,
            Favicon=favicon,
            Stylesheet=stylesheet,
            MainContent=main_content
            )
        )
