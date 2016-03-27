<%-- 
    Document   : productCreate
    Created on : 22-Mar-2016, 6:41:37 PM
    Author     : syltaxue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" integrity="sha384-aUGj/X2zp5rLCbBxumKTCw2Z50WgIr1vs/PFN4praOTvYXWlVyh2UtNUU0KAUhAX" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <title>Create a Product</title>
    </head>
    <style>
        .createLable {
            font-weight:bolder;
            font-size: x-large;
            margin: 20px 0;
            text-align:center;
        }
        .categoryPriceWrapper {
            padding: 0;
        }
        .inputTitle{
            padding-left: 2px;
            padding-bottom: 2px;
            font-weight: 700;
            margin-top: 10px;
        }
        .description{
            height: 200px !important;
            margin-bottom: 20px;
        }
    </style>
    <script>
        sessionStorage.loginStatus = false;
        if (${loginStatus} === true) {
            sessionStorage.loginStatus = ${loginStatus};
            sessionStorage.username = "${username}";
            sessionStorage.password = "${password}";
            sessionStorage.lastname = "${lastname}";
            sessionStorage.firstname = "${firstname}";
        } else {
            sessionStorage.loginStatus = false;
            sessionStorage.username = "";
            sessionStorage.password = "";
            sessionStorage.lastname = "";
            sessionStorage.firstname = "";
        }
    </script>
    <body>
        <div class = "container-fluid" style="padding: 0;">
            <div class = "header" style = "height: 80px; background: #19193B; display:list-item">
                <div class = "header-container">
                    <div class= "row">
                        <div class = "col-xs-4 col-sm-4">
                            <form method="post">
                                <div style="display:none">
                                    <input class="username" type="text" name="username" value=""/>
                                    <input class="password" type="text" name="password" value=""/>
                                    <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                    <input type="text" name="type" value="redirect"/>
                                    <input type="text" name="address" value="home"/>
                                </div>
                                <input  type="submit" value="Shopping system" style="border:none; background:none; color:white; font-weight:bolder; font-size: x-large; padding-left:40px;"/>            
                            </form>
                        </div>
                        <div class = "col-xs-6 col-sm-5">
                            <form class="navbar-form navbar-left" role="search">
                              <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search">
                              </div>
                              <button type="submit" class="btn btn-default">Submit</button>
                            </form>
                        </div>
                        <div class = "col-xs-2 col-sm-3">
                            <div class = "header-login">
                                <div class="btn-group" style="display:flex">
                                    <form method="post">
                                        <div style="display:none">
                                            <input class="username" type="text" name="username" value=""/>
                                            <input class="password" type="text" name="password" value=""/>
                                            <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                            <input id = "signInType" type="text" name="type" value="redirect"/>
                                            <input id = "signInValue" type="text" name="address" value="login"/>
                                        </div>
                                        <input id="signInBtn" class="btn btn-primary" type="submit" value="Sign In">
                                    </form>
                                    <form method="post">
                                        <div style="display:none">
                                            <input class="username" type="text" name="username" value=""/>
                                            <input class="password" type="text" name="password" value=""/>
                                            <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                            <input type="text" name="type" value="redirect"/>
                                            <input type="text" name="address" value="create"/>
                                        </div>
                                        <input  id="createAccBtn" class="btn btn-primary" type="submit" value="Create account" >
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class= "col-sm-3"></div>
                <div class= "col-sm-6">
                    <div class="createLable">Create a new product</div>
                    <form id="productForm" class="form-signin" method="post">
                        <div style="display:none">
                            <input class="username" type="text" name="username" value=""/>
                            <input class="password" type="text" name="password" value=""/>
                            <input type="text" name="type" value="createProduct"/>
                            <input class="loginStatus" type="text" name="loginStatus" value=""/>
                        </div>
                        <div class=" inputTitle">Product Title</div>
                        <input class="form-control input-lg" type="text" name="title" placeholder="Title" required autofocus>
                        <div class="categoryPriceWrapper">
                            <div class="col-sm-6 categoryPriceWrapper">
                                <div class=" inputTitle">Category</div>
                                <select id="type-select" class="form-control">
                                  <option>Electronics</option>
                                  <option>Furniture</option>
                                  <option>Book</option>
                                </select>
                                <input id="product-type" type="text" style="display:none" class="form-control" name="productType">
                            </div>
                            <div class="col-sm-6 categoryPriceWrapper">
                                <div class=" inputTitle">Price</div>
                                <div class="input-group">
                                    <div class="input-group-addon">$</div>
                                    <input id="passwordConfirm" type="number" class="form-control" name="price" placeholder="0.00" required>
                                </div>
                            </div>
                        </div>
                        <div class=" inputTitle">Description</div>
                        <textArea type="text" class="form-control description" value = "" name="description" required></textarea>
                        <button id="submitBtn" class="btn btn-lg btn-primary btn-block" type="submit">
                            Create
                        </button>
                    </form>
                </div>
                <div class= "col-sm-3"></div>
            </div>
        </div>
    </body>
    <script>
        if (sessionStorage.loginStatus === "true") {
            document.getElementById("signInBtn").setAttribute("value", "Sign Out");
            document.getElementById("signInValue").setAttribute("value", "logout");
            document.getElementById("signInType").setAttribute("value", "logout");
            document.getElementById("createAccBtn").setAttribute("style", "display:none");
        } else if (sessionStorage.loginStatus === "false") {
            document.getElementById("signInBtn").setAttribute("value", "Sign In");
            document.getElementById("signInValue").setAttribute("value", "login");
            document.getElementById("signInType").setAttribute("value", "redirect");
            document.getElementById("createAccBtn").setAttribute("style", "display:inline-block");
        }
        
        var unArrays = document.getElementsByClassName("username");
        for(var i = 0; i < unArrays.length; i++) {
            unArrays[i].setAttribute("value", sessionStorage.username);
        }
        var pwArrays = document.getElementsByClassName("password");
        for(var i = 0; i < pwArrays.length; i++) {
            pwArrays[i].setAttribute("value", sessionStorage.password);
        }
        var loginArrays = document.getElementsByClassName("loginStatus");
        for(var i = 0; i < loginArrays.length; i++) {
            loginArrays[i].setAttribute("value", sessionStorage.loginStatus);
        }
    </script>
    <script>
        $("#productForm").submit(function (event) {
            document.getElementById("product-type").value = document.getElementById("type-select").value ? document.getElementById("type-select").value : "electronics";
        });
    </script>
</html>
