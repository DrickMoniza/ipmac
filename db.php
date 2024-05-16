<?php
    //https://databases-auth.000webhost.com/index.php?route=/database/structure&db=id22102970_dbmarine_automation
    $servername='localhost';
    $username='id22102970_root'; //'root';  //id22102970_root
    $password='Cg@b092006';
    $dbname = 'https://databases-auth.000webhost.com/index.php?route=/database/structure&db=id22102970_dbmarine_automation'; //'dbmarine_automation';
    $conn = mysqli_connect($servername,$username,$password,"$dbname");
    
    if(!$conn){
        die('Could not Connect MySql Server:' .mysqli_error($mysqli));
    }
