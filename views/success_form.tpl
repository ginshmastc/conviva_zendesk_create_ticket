<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<link rel="stylesheet" href="form_styles.css">
<div id="ticket_form">
<style>
  body {
    background-color: rgb(250, 250, 250);
  }
  table {
    margin: auto;
  }
  td {
    vertical-align: top;
	padding: 5px 30px;
  }
  input[type='text'], input[type='email'], textarea {
    width: 500px;
  }
  input[type='submit'] {
    border-radius: 2px;
	border-color: gray;
	border-width: 1px;
    background-color: #93D10E;
	font-size: 14px;
	color: white;
	width: 75px;
	height: 30px;
  }
  input, select, textarea {
    border-color: #3a8eaa;
	border-width: thin;
  }
</style>

<form action="create_ticket" method="post">
  <p>
    Your ticket has successfully been created. Please check your email for confirmation.
	<br><a href="javascript:history.back()">Return to form</a>
  </p>
</form>
</div>
