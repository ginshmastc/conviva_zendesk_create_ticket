<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<link rel="stylesheet" href="style.css">
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
	padding: 3px 10px;
  }
  input[type='text'], input[type='email'], textarea {
    width: 500px;
  }
  input[type='submit'] {
    border: solid;
    border-radius: 2px;
	border-color: rgb(130, 177, 12);
	border-width: 1px;
    background-color: rgb(147, 201, 14);
	font-size: 14px;
	color: white;
	width: 75px;
	line-height: 21x;
	padding: 1.4px 14px;
	height: 28px;
  }
  input, select, textarea {
    border-color: #3a8eaa;
	border-width: thin;
  }
  table span {
    font-size: 18.2px;
    color: rgb(51, 51, 51);
    font-family: "Helvetica Neue", "Helvetica", "Arial", sans-serif;
  }
  table label {
    font-size: 14px;
    color: rgb(80, 80, 80);
    font-family: "Helvetica Neue", "Helvetica", "Arial", sans-serif;
  }
  table textarea {
    font-size: 14px;
    color: rgb(80, 80, 80);
    font-family: "Helvetica Neue", "Helvetica", "Arial", sans-serif;
  }
  table input, table select, table textarea {
    color: rgb(80, 80, 80);
    background-color: rgb(255, 255, 255);
	border-color: rgb(127, 157, 185);
	border-radius: 2px;
	border-style: solid;
	border-width: 1px;
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15);
	box-sizing: border-box;
	font-size: 14px;
	height: 28px;
	line-height: 21px;
	padding 2.8px 5.6px;
	transition: border linear .2s, box-shadow linear .2s;
	vertical-align: middle;
  }
  
  table input:focus, table select:focus, table textarea:focus {
    outline: 0;
    border-color: #75b9f0;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
  }
  
  table input {
    width: 546px;
  }
  
  table select {
    width: 210px;
	background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMiAxMiI+PHBhdGggZD0iTTAsNSA4LDUgNCw5eiIvPjwvc3ZnPg==);
    background-position: 100% 50%;
	background-position-x: 100%;
	background-position-y: 50%;
	background-repeat: no-repeat;
	background-size: 12px 12px;
	-moz-appearance: none;
  }
  input[type=file] {
    width: 200px;
	border: none;
  }
  table textarea {
    height: 210px;
  }
</style>

<script type="text/javascript">

    window.addEventListener("load", function() {
	var url = window.location.href;
	var params = url.split('?')[1];
	var get_params = [];
	for(var i = 0; i < params.split('&').length; i++) {
      var param = url.split('?')[1].split('&')[i];
	  get_params[param.split('=')[0]] = param.split('=')[1];
	}
	
	console.log(get_params['customer_id']);
	console.log(get_params['email']);
	document.getElementById('c3account').value = get_params['customer_id'] ? get_params['customer_id'] : 'c3.conviva';
	  var c3 = document.getElementById('c3account').value;
	  if(c3)
	    document.getElementById('spantitle').innerHTML = 'Support Form for ' + c3;
      document.getElementById("attachment").onchange = function(event) {
        var reader = new FileReader();
        reader.readAsDataURL(event.srcElement.files[0]);
        var me = this;
        reader.onload = function () {
          var fileread = reader.result;
		  var fileheader = fileread.split(',')[0];
		  var filecontent = fileread.substring(fileheader.length+1);
		  var filetype = fileheader.split(';')[0].substring(5);
		  document.getElementById("hiddentype").value = filetype;
		  document.getElementById("hiddendata").value = filecontent;
		  document.getElementById('hiddenname').value = document.getElementById('attachment').files[0].name;
    	  document.getElementById('hiddensize').value = document.getElementById('attachment').files[0].size;
		  console.log(fileread);
        }
    }});

</script>

<form action="create_ticket" method="POST" enctype='multipart/form-data'>
<input type='hidden' name='hiddenname' id='hiddenname'>
<input type='hidden' name='hiddensize' id='hiddensize'>
<input type='hidden' name='hiddentype' id='hiddentype'>
<input type='hidden' name='hiddendata' id='hiddendata'>
<input type='hidden' name='c3account' id='c3account'>
<table id='table'>
<tr>
  <td>
    <span id='spantitle'>Support Form</span>
  </td>
  <td>
  </td>
</tr><tr><td></td></tr><tr>
  <td>
    <label for='email'>Email</label>
  </td>
  <td>
    <input type="email" name="email" class="field" required>
  </td>
  <!--
</tr><tr>
  <td></td>
  <td>
    <div class="register"><a href="https://convivasupport.zendesk.com/auth/v2/login/registration" target="_blank">Register</a> so our support team can email you to solve your problem.</div>
  </td>
  -->
</tr><tr>
  <td>
    <label for='id_subject'>Subject</label>
  </td>
  <td>
    <input id="id_subject" type="text" name="subject" maxlength="80" required>
  </td>
</tr><tr>
  <td>
    <label for='id_description'>Summary</label>
  </td>
  <td>
    <textarea id="id_description" rows="10" cols="40" name="description" required></textarea>
  </td>
</tr><tr>
  <td>
    <label for='priority'>Priority</label>
  </td>
  <td>
    <select name="priority" id="id_priority">
    <option value="urgent">P0 - Critical</option>
    <option value="high">P1 - Urgent</option>
    <option value="normal" selected="selected">P2 - Standard</option>
	<option value="low">P3 - Low</option>
    </select>
  </td>
</tr><tr>
  <td>
    <label for='id_00N400000025F5S'>Feature</label>
  </td>
  <td>
    <select name="00N400000025F5S" id="id_00N400000025F5S">
    <option value="" selected="selected">-None-</option>
    <option value="ad_insights">Ad Insights</option>
    <option value="alerts">Alerts</option>
    <option value="community">Community</option>
    <option value="device_validation">Device Validation</option>
    <option value="insights_api">Insights API</option>
    <option value="live_events">Live Events</option>
	<option value="pendo">Pendo</option>
    <option value="personal_data">Personal Data</option>
    <option value="player">Player</option>
    <option value="portal">Portal</option>
    <option value="precision">Precision</option>
    <option value="pulse">Pulse</option>
    <option value="reports">Reports</option>
    <option value="ssd">SSD</option>
    <option value="touchstone">Touchstone</option>
    <option value="vai_alerts">VAI Alerts</option>
    <option value="viewer_api">Viewer API</option>
    <option value="viewer_module">Viewer Module</option>
    </select>
  </td>
</tr><tr>
  <td>
  
  </td>
  <td>
    <input type="file" name="attachment" id="attachment" accept="*" onchange='onInput()'>
  </td>
</tr><tr>
  <td>
  </td>
  <td>
    <input type="submit" value="Submit">
  </td>
</tr></table>
</form>
</div>
