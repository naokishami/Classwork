<!-- url = https://images-na.ssl-images-amazon.com/images/I/71ZwJq8yriL._AC_SL1500_.jpg -->

<!DOCTYPE html>

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
<form method = "post" action = "">
      <select name="viewingOption">

          <option value="">What would you like to do?</option>
          <option value=5>View Patients</option>
          <option value=6>View Doctors</option>
          <option value=7>View Prescriptions</option>
          <option value=8>View Visits</option>

      </select>
      <input type = "submit" name = "submit" value = Submit>

      <p id="table"></p>



<?php
    require_once 'connect.php';



    // Check if form is submitted successfully
     if(isset($_POST["submit"]))
     {
         // Check if any option is selected
         if(isset($_POST["viewingOption"]))
         {
           $viewingOption = $_POST['viewingOption'];
            if ($viewingOption == 5) {
                $sql = "SELECT * FROM patient";
                $result = mysqli_query($link,$sql);
                print "<pre>";
                print "<table border=1 style=\"border:1px solid black;margin-left:auto;margin-right:auto;\">";
                print "<tr><td>patient id </td><td> DOB </td><td>phone number </td><td> person id </td>";
                while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
                {
                print "\n";
                print "<tr><td>$row[patientID] </td><td> $row[DOB]  </td><td>$row[phoneNumber] </td><td>$row[personID] </td></tr>	";
                }
                print "</table>";
                print "</pre>";
                mysqli_free_result($result);
                mysqli_close($link);
            }
            else if ($viewingOption == 6) {
                $sql = "SELECT * FROM doctor";
                $result = mysqli_query($link,$sql);
                print "<pre>";
                print "<table border=1 style=\"border:1px solid black;margin-left:auto;margin-right:auto;\">";
                print "<tr><td>doctor id </td><td>medical degree </td><td> person id </td>";
                while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
                {
                print "\n";
                print "<tr><td>$row[doctorID] </td><td> $row[medicalDegree]  </td><td>$row[personID] </td></tr>	";
                }
                print "</table>";
                print "</pre>";
                mysqli_free_result($result);
                mysqli_close($link);
            }
            else if ($viewingOption == 7) {
                $sql = "SELECT * FROM prescription";
                $result = mysqli_query($link,$sql);
                print "<pre>";
                print "<table border=1 style=\"border:1px solid black;margin-left:auto;margin-right:auto;\">";
                print "<tr><td>prescription id </td><td> prescription name </td>";
                while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
                {
                print "\n";
                print "<tr><td>$row[prescriptionID] </td><td> $row[prescriptionName]  </td></tr>	";
                }
                print "</table>";
                print "</pre>";
                mysqli_free_result($result);
                mysqli_close($link);
            }
            else if ($viewingOption == 8) {
                $sql = "SELECT * FROM patientvisit";
                $result = mysqli_query($link,$sql);
                print "<pre>";
                print "<table border=1 style=\"border:1px solid black;margin-left:auto;margin-right:auto;\">";
                print "<tr><td>visit id </td><td> patient id </td><td>doctor id </td><td> doc note </td><td>visit date </td></tr>";
                while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
                {
                print "\n";
                print "<tr><td>$row[visitID] </td><td> $row[patientID]  </td><td>$row[doctorID] </td><td> $row[docNote]  </td><td>$row[visitDate] </td></tr>	";
                }
                print "</table>";
                print "</pre>";
                mysqli_free_result($result);
                mysqli_close($link);
            }

         }
     else
         echo "Select an option first !!";
     }




?>




    </div>
  </body>
  <footer>
    <p>Created By Darryn Wong and Naoki Atkins. CPSC332 </p>
  </footer>

</html>
