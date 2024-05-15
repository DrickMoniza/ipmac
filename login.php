<?php
session_start();
$login_ctr = 3;
require_once "db.php";

if(isset($_SESSION['user_id'])!="") {
    header("Location: dashboard.php");
}
if (isset($_POST['login'])) {
    $usertype = mysqli_real_escape_string($conn, $_POST['usertype']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    if(strlen($usertype) == 0) {
      $usertype_error = "You must select User Type";
    }
    if(!filter_var($email,FILTER_VALIDATE_EMAIL)) {
        $email_error = "Please Enter Valid Email ID";
    }
    if(strlen($password) < 6) {
        $password_error = "Password must be minimum of 6 characters";
    }  

    if($usertype == 1) {
        $result = mysqli_query($conn, "SELECT * FROM students WHERE Stud_email = '" . $email . "' and Stud_Password = '" . md5($password) . "' and UserID = '" . $usertype."' and Stud_Status = 'A'");
        if(!empty($result)){
            if ($row = mysqli_fetch_array($result)) {
                $_SESSION['user_id'] = $row['uid'];
                $_SESSION['user_name'] = $row['name'];
                $_SESSION['user_email'] = $row['email'];
                //$_SESSION['user_mobile'] = $row['mobile'];
                header("Location: index2.html"); //Student User type
            } 
        }
        else {
            if($login_ctr == 0)
                echo '<script>alert("No Login Attempts Available\\nAccount is Temporarily Suspended\\nPlease notify your Instructor!");</script>';
            else {
                $login_ctr = $login_ctr - 1;
                echo '<script>alert("You now only have " + $login_ctr + " Login Attempts Available");</script>';  
            }
            $error_message = "Incorrect Email or Password!!!";
        }
        $login_ctr = $login_ctr - 1;
        echo '<script>alert("You now only have " + $login_ctr + " Login Attempts Available");</script>';
            
            //echo '<script>alert("Incorrect Email or Password! / Account not yet confirmed or verified!");</script>';
            //$login_ctr = $login_ctr - 1;
            //if($login_ctr==0)
            //{
                //document.getElementById("usertype").disabled=true;
                //document.getElementById("email").disabled=true;
                //document.getElementById("password").disabled=true;
            //}
        
    }elseif($usertype == 2 OR $usertype == 3) {
        $result = mysqli_query($conn, "SELECT * FROM instructors WHERE TEmail = '" . $email. "' and TPassword = '" . md5($password). "' and UserID = '" . $usertype. "' and TStatus = 'A'");
        if(!empty($result)){
            if ($row = mysqli_fetch_array($result)) {
                $_SESSION['user_id'] = $row['uid'];
                $_SESSION['user_name'] = $row['name'];
                $_SESSION['user_email'] = $row['email'];
                //$_SESSION['user_mobile'] = $row['mobile'];
                header("Location: index1.html"); //Instructor & Systems Admin user types
            } 
        }
        else {
            if($login_ctr == 0)
                echo '<script>alert("No Login Attempts Available\\nAccount is Temporarily Suspended\\nPlease notify your Instructor!");</script>';
            else {
                $login_ctr = $login_ctr - 1;
                echo '<script>alert("You now only have " + $login_ctr + " Login Attempts Available");</script>';   
            }

            //$error_message = "Incorrect Email or Password!"; 
        }
        $login_ctr = $login_ctr - 1;
        echo '<script>alert("You now only have " + $login_ctr + " Login Attempts Available");</script>';
            //echo '<script>alert("Incorrect Email or Password! / Account not yet confirmed or verified!");</script>';
            //alert($error_message);
        
    }
    //return false;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Form in IPMAC</title>
     <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-10">
                <div class="page-header">
                    <h2>Login Form in IPMAC</h2>
                </div>
                <p>Please fill all fields in the form</p>
                <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">

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

                    <div class="form-group ">
                        <label>Email<font color="red">*</font></label>
                        <input type="email" name="email" class="form-control" value="" maxlength="30" required="">
                        <span class="text-danger"><?php if (isset($email_error)) echo $email_error; ?></span>
                    </div>

                    <div class="form-group">
                        <label>Password<font color="red">*</font></label>
                        <input type="password" name="password" class="form-control" value="" maxlength="8" required="">
                        <span class="text-danger"><?php if (isset($password_error)) echo $password_error; ?></span>
                    </div>  
                    
                    <input type="submit" class="btn btn-primary" name="login" value="submit">
                    <br>
                    You don't have account?<a href="registration.php" class="mt-3">Click Here</a>
                    
                </form>
            </div>
        </div>     
    </div>
</body>
</html>
