<%-- 
    Document   : create
    Created on : 20-Mar-2016, 5:36:38 PM
    Author     : syltaxue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <style>
        .form-signin
        {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
        .form-signin .form-signin-heading, .form-signin .checkbox
        {
            margin-bottom: 10px;
        }
        .form-signin .checkbox
        {
            font-weight: normal;
        }
        .form-signin .form-control
        {
            position: relative;
            font-size: 16px;
            height: auto;
            padding: 10px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        .form-signin .form-control:focus
        {
            z-index: 2;
        }
        .form-signin input[type="text"]
        {
            margin-bottom: 10px;
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
        }
        .form-signin input[type="password"]
        {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
        .account-wall
        {
            margin-top: 20px;
            padding: 40px 0px 20px 0px;
            background-color: #f7f7f7;
            -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        }
        .login-title
        {
            color: #555;
            font-size: 18px;
            font-weight: 400;
            display: block;
        }
        .profile-img
        {
            width: 96px;
            height: 96px;
            margin: 0 auto 10px;
            display: block;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
            border-radius: 50%;
        }
        .need-help
        {
            margin-top: 10px;
        }
        .new-account
        {
            display: block;
            margin-top: 10px;
        }
        .inputTitle {
            padding-left: 2px;
            padding-bottom: 2px;
            font-weight: 700;
        }
        .form-subField {
            margin-bottom: 8px !important;
        }
        .inputSubtitle {
            
        }
    </style>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <h1 class="text-center login-title">Create an account</h1>
                    <div class="account-wall">
                        <form class="form-signin">
                            <div class=" inputTitle">Username</div>
                            <input type="text" class="form-control" placeholder="Username" required autofocus>
                            <div class=" inputTitle">Password</div>
                            <input type="password" class="form-control" placeholder="Password" required>
                            <div class=" inputTitle">Password again</div>
                            <input type="password" class="form-control" placeholder="Confirm Password" required>
                            <div class=" inputTitle">Your Name</div>
                            <input type="text" class="form-control" placeholder="Name" required>
                            <div class=" inputTitle">Address</div>
                            <div class="inputSubtitle">Street Address</div>
                            <input type="text" class="form-control form-subField" placeholder="Street Address" required>
                            <div class="inputSubtitle">City</div>
                            <input type="text" class="form-control form-subField" placeholder="City">
                            <div class="inputSubtitle">Province</div>
                            <input type="text" class="form-control form-subField" placeholder="Province">
                            <div class="inputSubtitle">Postal code</div>
                            <input type="text" class="form-control form-subField" placeholder="Postal code">
                            <div class="inputSubtitle">Country</div>
                            <input type="text" class="form-control form-subField" placeholder="Country">
                            <button class="btn btn-lg btn-primary btn-block" type="submit">
                                Submit
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
