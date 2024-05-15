<?php
  require_once "db.php";
  $ustatus = 'P';
  $vcode = rand(1, 31999); 
  $pwd_strength = "";
  $strengthOutput = "";

  if(isset($_SESSION['user_id'])!="") {
    header("Location: dashboard.php");
  }

if (isset($_POST['signup'])) {
    $serial = mysqli_real_escape_string($conn, $_POST['serial']);
    $fname = mysqli_real_escape_string($conn, $_POST['fname']);
    $lname = mysqli_real_escape_string($conn, $_POST['lname']);
    $gender = mysqli_real_escape_string($conn, $_POST['gender']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $usertype = mysqli_real_escape_string($conn, $_POST['usertype']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);
    $cpassword = mysqli_real_escape_string($conn, $_POST['cpassword']); 
    
    if(strlen($serial) == 7) {
        $serial_error = "Serial Number must be entered correctly";
    }
    if (!preg_match("/^[a-zA-Z ]+$/",$fname)) {
        $fname_error = "Firstname must contain only alphabets and space";
    }
    if (!preg_match("/^[a-zA-Z ]+$/",$lname)) {
        $lname_error = "Lastname must contain only alphabets and space";
    }
    if(strlen($gender) == 0) {
        $gender_error = "Gender must not be empty";
    }
    if(strlen($ustatus) == 0) {
          $ustatus_error = "Status must not be empty";
    }
    if(!filter_var($email,FILTER_VALIDATE_EMAIL)) {
        $email_error = "Please Enter Valid Email ID";
    }
    if(strlen($usertype) == 0) {
        $usertype_error = "User Type must not be empty";
    }
    if(strlen($password) < 6) {
        $password_error = "Password must be minimum of 6 characters";
    }       
    if($password != $cpassword) {
        $cpassword_error = "Password and Confirm Password doesn't match";
    }

    if(((((substr($serial, 0, 2)) == "EM") Or ((substr($serial, 0, 2)) == "NM")) And ($usertype == "1")) And (($pwd_strength == $pwd_strength))) { 
        if (!$error) {
            if(mysqli_query($conn, "INSERT INTO students(StudSN, StudFName, StudLName, Stud_Gender, Stud_email, Stud_Password, Stud_VCode, Stud_Status, Stud_Created_at, Stud_Updated_at, UserID) VALUES ('" . $serial . "', '" . $fname . "', '" . $lname . "', '" . $gender . "', '" . $email . "', '" . md5($password) . "', '". $vcode ."', '" . $ustatus . "', '" . date("Y-m-d h:i:s") . "', '" . date("Y-m-d h:i:s") . "', '" . $usertype . "')")) 
            {
                header("location: login.php"); 
                exit();
            }
        }
    } elseif (((preg_match('/^\d{4}$/', $serial)) And ($usertype == "2" Or $usertype == "3")) And (($pwd_strength == $pwd_strength))) {
        if (!$error) {
            if(mysqli_query($conn, "INSERT INTO instructors(EmpNum, TFName, TLName, TGender, TEmail, TPassword, TVCode, TStatus, TCreated_at, TUpdated_at, UserID) VALUES ('" . $serial . "', '" . $fname . "', '" . $lname . "', '" . $gender . "', '" . $email . "', '" . md5($password) . "', '" . $vcode . "', '" . $ustatus . "', '" . date("Y-m-d h:i:s") . "', '" . date("Y-m-d h:i:s") . "', '" . $usertype . "')")) 
            {
                header("location: login.php");
                exit();
            }
        }    
    } else {
        //echo "Error: " . $sql . "" . mysqli_error($conn);
        echo '<script>alert("Incorrect Student Serial Number / Employee ID Number!\\nData mismatched\\nWeak password is not also allowed to be registered!");</script>';
    }
} 

mysqli_close($conn);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>IPMAC New User Registration</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>


<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-offset-2">
                <div class="page-header">
                    <h2>New User's Registration Form</h2>
                </div>
                <p>Please fill out all the fields in the form</p>
                <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">

                    <div class="form-group">
                        <label>Serial Number for Students / Employee ID Number for Instructors & Admin<font color="red">*</font> </label>
                        <input type="text" autofocus name ="serial" class="form-control" value="" maxlength="50" required placeholder="Example EM12345 for students/ 1234 for employee ID">
                        <span class="text-danger"><?php if (isset($serial_error)) echo $serial_error; ?></span>
                    </div>
                    <div class="form-group">
                        <label>FirstName<font color="red">*</font> </label>
                        <input type="text" name="fname" class="form-control" value="" maxlength="50" required="">
                        <span class="text-danger"><?php if (isset($fname_error)) echo $fname_error; ?></span>
                    </div>

                    <div class="form-group">
                        <label>LastName<font color="red">*</font> </label>
                        <input type="text" name="lname" class="form-control" value="" maxlength="50" required="">
                        <span class="text-danger"><?php if (isset($lname_error)) echo $lname_error; ?></span>
                    </div>

                    <div class="form-group">
                        <label>Gender<font color="red">*</font> </label>
                        <input type="text" name="gender" list="genderlist" class="form-control" value="" maxlength="50" required="">
                        <datalist id="genderlist">
                            <option value="Male"></option>  
                            <option value="Female"></option>
                        </datalist>
                        <span class="text-danger"><?php if (isset($gender_error)) echo $gender_error; ?></span>
                    </div>

                    <div class="form-group ">
                        <label>Email<font color="red">*</font></label>
                        <input type="email" name="email" class="form-control" value="" maxlength="30" required placeholder="Enter a valid email address: Example juandelacruz@yahoo.com">
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        <span class="text-danger"><?php if (isset($email_error)) echo $email_error; ?></span>
                    </div>

                    <div class="form-group">
                        <label>User Type<font color="red">*</font> </label>
                        <input type="usertype" name="usertype" list="usertypelist" class="form-control" value="" maxlength="50" required="">
                        <?php if (isset($usertype_error)) echo $usertype_error;?></span>

                        <datalist id="usertypelist">
                            <option label = "Student" value = "1">Student</option>
                            <option label = "Instructor" value = "2">Instructor</option>
                            <option label = "Systems Administrator" value = "3">Systems Administrator</option>
                        </datalist>

                        <script>
                            const select = document.querySelector("usertypelist");

                            usertypelist.addEventListener("change", setUser);

                            function setUser() {
                                const choice = document.getElementsById("usertypelist").value; //select.value
                                if (choice === "1") {
                                    $usertype = 1;
                                } else if (choice === "2") {
                                    $usertype = 2;
                                } else if (choice === "3") {
                                    $usertype = 3;
                                }
                            }
                        </script>
                    </div>

                    <div class="form-group">
                        <label>Password<font color="red">* </font></label>
                        <input type="password" name="password" class="form-control" value="" maxlength="8" required="" oninput="checkPasswordStrength(this.value)">
                        <span class="text-danger"><?php if (isset($password_error)) echo $password_error; ?></span>
                        <strong><div id="strengthOutput"></div></strong>
                    </div>  

                    <div class="form-group">
                        <label>Confirm Password<font color="red">*</font> </label>
                        <input type="password" name="cpassword" class="form-control" value="" maxlength="8" required="">
                        <span class="text-danger"><?php if (isset($cpassword_error)) echo $cpassword_error; ?></span>
                    </div>

                    <input type="submit" class="btn btn-primary" name="signup" value="submit">
                    
                    Already have a account?<a href="login.php" class="btn btn-default">Login</a>

                </form>
            </div>
        </div>    
    </div>

    <script>
        $strengthOutput = document.getElementById('strengthOutput');
        //var $pwd_strength = "";
        function checkPasswordStrength(password) {
            var strength = 0;
            var color = '';
            if (password.length >= 8) strength += 1; // Length at least 8
            if (password.match(/[a-z]/)) strength += 1; // Contains lowercase
            if (password.match(/[A-Z]/)) strength += 1; // Contains uppercase
            if (password.match(/[0-9]/)) strength += 1; // Contains number
            if (password.match(/[\W]/)) strength += 1; // Contains special character

            //var strengthOutput = document.getElementById('strengthOutput');
            switch(strength) {
                case 1:
                case 2:
                    $strengthOutput.innerHTML = 'Weak';
                    color = 'Red';
                    $pwd_strength = $strengthOutput.innerHTML;
                    document.getElementById('strengthOutput').innerHTML = '<span style="color: ' + color + ';">' + $strengthOutput.innerHTML + '</span>';
                    break;
                case 3:
                case 4:
                    $strengthOutput.innerHTML = 'Moderate'; 
                    color = 'Orange';
                    $pwd_strength = $strengthOutput.innerHTML;
                    document.getElementById('strengthOutput').innerHTML = '<span style="color: ' + color + ';">' + $strengthOutput.innerHTML + '</span>';
                    break;
                case 5:
                    $strengthOutput.innerHTML = 'Strong';
                    color = 'Green';
                    $pwd_strength = $strengthOutput.innerHTML;
                    document.getElementById('strengthOutput').innerHTML = '<span style="color: ' + color + ';">' + $strengthOutput.innerHTML + '</span>';
                    break;
                default:
                    $strengthOutput.innerHTML = 'Very Weak';
                    $pwd_strength = $strengthOutput.innerHTML;
            }
            //$pwd_strength = "";
            //$pwd_strength = $strengthOutput.innerHTML;
        }

    </script>
</body>
</html>
