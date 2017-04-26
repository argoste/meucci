#!/usr/bin/env python3
import web
web.page_title = 'Form test'
form =  '''
<form action='' method='post'>
    <label for='numero'>A number </label>
    <input type='number' name='numero'>
    <input type='submit'>
</form>
'''

data = web.cgi.FieldStorage()

if 'numero' in data:
    numero = data.getvalue(key='numero')
    message = 'Your input: ' + numero
else:
    message = 'Please enter a number'

monitor = '<div>' + message + '</div>'
web.main_content = form + monitor
web.web_page()
