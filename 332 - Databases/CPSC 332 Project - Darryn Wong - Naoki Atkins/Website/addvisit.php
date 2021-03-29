<?php
require_once 'connect.php';

$patientID = $_REQUEST['patientID'];
$doctorID = $_REQUEST['doctorID'];
$doctorNote = $_REQUEST['doctorNote'];
$visitDate = $_REQUEST['visitDate'];


// store info into person
$sql = "INSERT INTO patientvisit (patientID, doctorID, docNote, visitDate) VALUES";
$sql .= "('" . $patientID . "',";
$sql .= "'" . $doctorID . "',";
$sql .= "'" . $doctorNote . "',";
$sql .= "'" . $visitDate . "')";


if (mysqli_query($link, $sql)) {
  print("Stored Patient Visit");
} else {
  print("Failed Patient Visit");
}

//
echo mysqli_error($link);

// close connection
mysqli_close($link);

echo "<script>location.href='index.html'</script>";

 ?>
