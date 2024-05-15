<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Teacher's Approval for New Registrants</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style type="text/css">
        .bs-example{
            margin: 20px;
        }
        table {
            margin-left: 0;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();   
        });
    </script>
</head>
<body>
    <div class="bs-example">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-header clearfix">
                        <h2 class="pull-left">New Users List for Confirmation</h2>
                    </div>
                    <?php
                        include_once "db.php";
                        $result = mysqli_query($conn,"SELECT * FROM students WHERE Stud_Status = 'P'");
                        $result2 = mysqli_query($conn,"SELECT * FROM instructors WHERE TStatus = 'P'");
                    ?>
                    
                    <?php
                        //******************************************************/
                        if ((mysqli_num_rows($result) > 0) Or (mysqli_num_rows($result2) > 0)) {
                    ?>
                      <table class='table table-bordered table-striped'>
                      
                      <tr>
                        <td>Serial/Employee Number</td>
                        <td>Lastname</td>
                        <td>Firstname</td>
                        <td>Email Address</td>
                        <td>Verification Code</td>
                        <td>Date/Time Registered</td>
                        <td>Action to Make</td>
                      </tr>
                    <?php
                    $i=0;
                    while($row = mysqli_fetch_array($result)) {
                    ?>
                    <tr>
                        <td><?php echo $row["StudSN"]; ?></td>
                        <td><?php echo $row["StudLName"]; ?></td>
                        <td><?php echo $row["StudFName"]; ?></td>
                        <td><?php echo $row["Stud_email"]; ?></td>
                        <td><?php echo $row["Stud_VCode"]; ?></td>
                        <td><?php echo $row["Stud_Created_at"]; ?></td>
                        <td><?php echo '<a href="#" style = "color: Green">Accept</a>'.' / '. '<a href="#" style = "color: Red">Reject</a>'?></td>
                    </tr>
                    <?php
                        $i++;
                    }
                    //*****************************************************/
                    ?>
                    <?php
                    $i=0;
                    while($row = mysqli_fetch_array($result2)) {
                    ?>
                    <tr>
                        <td><?php echo $row["EmpNum"]; ?></td>
                        <td><?php echo $row["TLName"]; ?></td>
                        <td><?php echo $row["TFName"]; ?></td>
                        <td><?php echo $row["TEmail"]; ?></td>
                        <td><?php echo $row["TVCode"]; ?></td>
                        <td><?php echo $row["TCreated_at"]; ?></td>
                        <td><?php echo '<a href="#" style = "color: Green">Accept</a>'.' / '. '<a href="#" style = "color: Red">Reject</a>'?></td>
                    </tr>
                    <?php
                        $i++;
                    }
                    //*****************************************************/
                    ?>
                    </table>
                    <?php
                    }
                    else{
                        echo "No result found";
                    }
                    ?>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>