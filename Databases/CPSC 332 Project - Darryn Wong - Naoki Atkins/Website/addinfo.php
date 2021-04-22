
<html>

  <head>
    <script src="./jsfile.js"></script>

    <title>Doc Website</title>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Shadows+Into+Light&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
  </head>

  <body>
    <div id="navbar">
      <a href="./index.html">&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;Home&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;</a>
      <a href="./addinfo.php">&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;Add Info&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;</a>
      <a href="./viewinfo.php">&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;View Info&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;</a>
    </div>
    <div id="container">

      <select id="dropdown" onchange="displayTable(this.value)" >

          <option value="">What would you like to do?</option>
          <option value=1>Add new Patient</option>
          <option value=2>Add new Doctor</option>
          <option value=3>Add new Prescription</option>
          <option value=4>Add new Visit</option>

      </select>

      <p id="table"></p>
    </div>
  </body>
  <footer>
    <p>Created By Darryn Wong and Naoki Atkins. CPSC332 </p>
  </footer>

</html>



<?php
require_once 'connect.php';



?>
