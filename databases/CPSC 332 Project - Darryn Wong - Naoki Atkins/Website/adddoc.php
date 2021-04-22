<?php
require_once 'connect.php';

$firstName = $_REQUEST['firstName'];
$lastName = $_REQUEST['lastName'];
$phoneNumber = $_REQUEST['phoneNumber'];
$strAddr = $_REQUEST['strAddr'];
$city = $_REQUEST['city'];
$state = $_REQUEST['state'];
$zip = $_REQUEST['zip'];
$socialSecurityNum = $_REQUEST['socialSecurityNum'];
$docID = $_REQUEST['docID'];
$medDeg = $_REQUEST['medDeg'];

// store info into person
$sql = "INSERT INTO person (lastName, firstName, streetAdress, city, state, zip, phoneNumber, SSN) VALUES";
$sql .= "('" . $lastName . "',";
$sql .= "'" . $firstName . "',";
$sql .= "'" . $strAddr . "',";
$sql .= "'" . $city . "',";
$sql .= "'" . $state . "',";
$sql .= "'" . $zip . "',";
$sql .= "'" . $phoneNumber . "',";
$sql .= "'" . $socialSecurityNum . "')";


if (mysqli_query($link, $sql)) {
  print("Stored Person");
} else {
  print("Failed Person");
}

//
echo mysqli_error($link);




// retrieve the personID of the just stored person
$sql1 = "SELECT * FROM person ORDER BY personID DESC LIMIT 1";

// use this personID to store DOB into patient
$lastPersonID = mysqli_query($link,$sql1);
// $row = mysqli_fetch_assoc($lastPersonID);

// if (!$lastPersonID) {
//   echo "Could not run query : " . mysqli_error($link);
//   exit;
// }
// $row = mysqli_fetch_array($lastPersonID);
//
// echo $row[0];



$row = mysqli_fetch_array($lastPersonID);
echo $row[0];

$lastpersonrealID = $row[0];
echo $lastpersonrealID;



$sql2 = "INSERT INTO doctor (doctorID, medicalDegree, personID) VALUES";
$sql2 .= "('" . $docID . "',";
$sql2 .= "'" . $medDeg . "',";
$sql2 .= "'" . $lastpersonrealID . "')";

if (mysqli_query($link, $sql2)) {
  print("Stored Doctor");
} else {
  print("Failed Doctor");
}

echo mysqli_error($link);





// close connection
mysqli_close($link);

echo "<script>location.href='index.html'</script>";

 ?>
