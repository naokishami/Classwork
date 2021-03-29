    <?php
    $link = mysqli_connect('127.0.0.1', 'root', 'myPassword');
    // if (!$link) {
    //  die('Could not connect: ' . mysqli_error());
    // }
    // echo "Connected successfully. \n";
    $dbName = "DocOffice";
    mysqli_select_db($link, $dbName) or die("Unable to select database $dbName");

    ?>
