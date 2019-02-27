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

<script type="text/javascript">

    window.addEventListener("load", function() {
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
<table id='table'>
<tr>
  <td>
    <span>Submit a ticket</span>
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
</tr><tr>
  <td></td>
  <td>
    <div class="register"><a href="https://convivasupport.zendesk.com/auth/v2/login/registration" target="_blank">Register</a> so our support team can email you to solve your problem.</div>
  </td>
</tr><tr>
  <td>
    <label for='id_subject'>Subject</label>
  </td>
  <td>
    <input id="id_subject" type="text" name="subject" maxlength="80" required>
  </td>
</tr><tr>
  <td>
    <label for='id_description'>Description</label>
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
