<?php
    $servername='localhost';
    $username='root';
    $password='Cg@b092006';
    $dbname = "dbmarine_automation";
    $conn=mysqli_connect($servername,$username,$password,"$dbname");
    
    if(!$conn){
        die('Could not Connect MySql Server:' .mysqli_error($mysqli));
    }
