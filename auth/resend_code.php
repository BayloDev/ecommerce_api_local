<?php

include "../connect.php";

$email = filterRequest('email');
$verify_code = rand(10000, 99999);

 $data = array("user_verify_code" => $verify_code);
            
            $isCodelSent = sendEmail($email, 'Verify Code Ecommerce', "Code : $verify_code");
                           updateData('users', $data, "user_email ='$email'");

        //    if ($isCodelSent) {
          //      updateData('users', $data, "user_email ='$email'");
            //} else {
              //  printFailure('code not sent');
  //  }