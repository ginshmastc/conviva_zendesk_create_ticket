import json

import requests
from bottle import route, template, run, static_file, request, response


run(host="0.0.0.0", port=5000)

@route('/create_ticket', method=['GET', 'POST'])
def handle_form():
    if 'verified_email' in request.cookies:
        ask_email = False
    else:
        ask_email = True
    status = ''

    if request.POST:
        # Get the form data
        subject = request.forms.get('subject')
        description = request.forms.get('description')
        if 'verified_email' in request.cookies:
            email = request.get_cookie('verified_email')
        else:
            email = request.forms.get('email')
        # Package the data for the API
        data = {'request': {'subject': subject, 'comment': {'body': description}}}
        ticket = json.dumps(data)
        print(ticket)
        # Make the API request
        user = email + '/token'
        api_token = 'FOV7zAS4ZIGylDLyqr4LbA56VNXgB9FFIU5hXkXF'
        url = 'https://convivasupport.zendesk.com/api/v2/requests.json'
        headers = {'content-type': 'application/json'}
        r = requests.post(url, data=ticket, auth=(user, api_token), headers=headers)
        if r.status_code != 201:
            if r.status_code == 401 or 422:
                status = 'Could not authenticate you. Check your email address or register.'
                ask_email = True
            else:
                status = 'Problem with the request. Status ' + str(r.status_code)
        else:
            status = 'Ticket was created. Look for an email notification.'
            if 'verified_email' not in request.cookies:
                response.set_cookie('verified_email', email, max_age=364*24*3600)
                ask_email = False
        print(status)
    return template('ticket_form', feedback=status, no_email=ask_email)

