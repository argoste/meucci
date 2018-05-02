# this module is to create web pages in a very minimalistic style
import cgi
# to debug TODO remove in production
import cgitb
cgitb.enable(display=1, logdir='/home/ste/logs', format="text")

# Default values to be overridden by your values
site_name="The awesome Meucci Library"
page_title = "page title here"
stylesheet = "/styles/style.css"
favicon = '/img/favicon.gif'
main_content = "main content here"

# I use simple built-in python templates
myfile = open('../templates/common.html')
template = myfile.read()

def web_page():
    """Create the HTML for a web page"""
    print("Content-Type: text/html")
    print()
    print(
        template.format(
            SiteName=site_name,
            PageTitle=page_title,
            Favicon=favicon,
            Stylesheet=stylesheet,
            MainContent=main_content
            ),
        )
