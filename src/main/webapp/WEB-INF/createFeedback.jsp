<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : createFeedback
    Created on : 26-Mar-2016, 7:54:37 PM
    Author     : syltaxue
--%>

<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" integrity="sha384-aUGj/X2zp5rLCbBxumKTCw2Z50WgIr1vs/PFN4praOTvYXWlVyh2UtNUU0KAUhAX" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <title>Submit a feedback</title>
    </head>
    <style>
        .createLable {
            font-weight:bolder;
            font-size: x-large;
            margin: 20px 0;
            text-align:center;
        }
        .rateWrapper {
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
                            <form class="navbar-form navbar-left" role="search" method='post'>
                                <div style="display:none">
                                    <input class="username" type="text" name="username" value=""/>
                                    <input class="password" type="text" name="password" value=""/>
                                    <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                    <input type="text" name="type" value="redirect"/>
                                    <input type="text" name="address" value="searchResult"/>
                                </div>
                                <div class="form-group">
                                  <input type="text" class="form-control" placeholder="Search" name='keyWords'>
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
            <div class="body">
                <div class="row">
                    <div class= "col-sm-3"></div>
                    <div class= "col-sm-6">
                        <div class="createLable">Submit a Feedback</div>
                        <form class="form-signin" method="post">
                            <div style="display:none">
                                <input class="username" type="text" name="username" value=""/>
                                <input class="password" type="text" name="password" value=""/>
                                <input type="text" name="type" value="createFeedback"/>
                                <input type="text" name="feedbackType" value="${feedbackType}"/>
                                <c:if test="${feedbackType == 'Product'}">
                                    <input type="text" name="productID" value="${productID}"/>
                                    <input class="username" type="text" name="customerID" value=""/>
                                </c:if>
                                <c:if test="${feedbackType == 'Supplier'}">
                                    <input type="text" name="supplierID" value="${supplierID}"/>
                                    <input class="username" type="text" name="customerID" value=""/>
                                </c:if>
                                <input class="loginStatus" type="text" name="loginStatus" value=""/>
                            </div>
                            <div class=" inputTitle">Feedback Title</div>
                            <input class="form-control input-lg" type="text" name="feedbackTitle" placeholder="Title" required autofocus>
                            <div class="rateWrapper">
                                <div class="col-sm-12 rateWrapper">
                                    <div class=" inputTitle">Rate</div>
                                    <select id="type-select" class="form-control">
                                      <option>5</option>
                                      <option>4</option>
                                      <option>3</option>
                                      <option>2</option>
                                      <option>1</option>
                                    </select>
                                    <input id="feedback-rate" type="text" style="display:none" class="form-control" name="rateStar" value="5">
                                </div>
                            </div>
                            <div class=" inputTitle">Feedback Comment</div>
                            <textArea type="text" class="form-control description" value = "" name="feedbackComment" required></textarea>
                            <button id="submitBtn" class="btn btn-lg btn-primary btn-block" type="submit">
                                Create
                            </button>
                        </form>
                    </div>
                    <div class= "col-sm-3"></div>
                </div>
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
        $("#type-select").on("change", function (event) {
            document.getElementById("feedback-rate").value = document.getElementById("type-select").value ? document.getElementById("type-select").value : "5";
        });
    </script>
</html>
