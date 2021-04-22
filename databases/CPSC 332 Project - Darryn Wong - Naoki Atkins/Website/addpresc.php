<?php
require_once 'connect.php';

$prescName = $_REQUEST['prescName'];


// store info into person
$sql = "INSERT INTO prescription (prescriptionName) VALUES";
$sql .= "('" . $prescName . "')";



if (mysqli_query($link, $sql)) {
  print("Stored Prescription");
} else {
  print("Failed Prescription");
}

//
echo mysqli_error($link);

// close connection
mysqli_close($link);

echo "<script>location.href='index.html'</script>";

 ?>
