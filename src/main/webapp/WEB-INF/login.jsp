<%-- 
    Document   : login
    Created on : 20-Mar-2016, 5:36:38 PM
    Author     : syltaxue
    This signin template is from a git open source project from
    https://gist.github.com/bMinaise/7329874#file-bs3-login-form-html-L12
--%>
<%@page import="javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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
            margin-bottom: -1px;
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
    </style>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <h1 class="text-center login-title">Sign in to continue</h1>
                    <div class="account-wall">
                        <img class="profile-img" src="https://s.yimg.com/dh/ap/social/profile/profile_b96.png"
                            alt="">
                        <form class="form-signin" method="post">
                            <div style="display:none">
                                <input type="text" name="type" value="login"/>
                            </div>
                            <input type="text" name="username" class="form-control" placeholder="Username" required autofocus>
                            <input type="password" name="password" class="form-control" placeholder="Password" required>
                            <input type="text" name="supplierID" value="${ProductInfo.getSupplierUserId()}" style="display:none"/>
                            <input type="text" name="productID" value="${productID}" style="display:none"/>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">
                                Sign in
                            </button>
                        </form>
                    </div>
                    <form method="post">
                        <div style="display:none">
                            <input type="text" name="type" value="redirect"/>
                            <input type="text" name="address" value="create"/>
                        </div>
                        <a class="text-center new-account"><input  class="text-center new-account" type="submit" value="Create an account" style="border:none; background:none; padding-left:120px"></a>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script>
        if(${operationStatus != ""}) {
            alert("${operationStatus}");
        }
    </script>
</html>
