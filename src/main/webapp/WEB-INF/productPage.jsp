<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : productPage
    Created on : 20-Mar-2016, 7:54:37 PM
    Author     : syltaxue
--%>

<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" integrity="sha384-aUGj/X2zp5rLCbBxumKTCw2Z50WgIr1vs/PFN4praOTvYXWlVyh2UtNUU0KAUhAX" crossorigin="anonymous">
        <title>Product</title>
    </head>
    <style>
        .body-type{
           font-size: x-large;
           margin: 10px 0px;
           padding-left:40px;
           padding-bottom:10px;
           border-bottom: 1px solid #e7e7e7;
        }
        .title{
            font-weight:700;
            font-size:x-large;
        }
        .date {
            margin-left: 50px;
        }
        .price-wrapper {
            display:flex;
            margin:20px 0;
        }
        .description {
            margin: 50px 0;
        }
        .feedbacksLabel{
            font-weight:700;
            font-size:large;
        }
        .feedbackAuthorWrapper{
            margin-left:30px;
            display: flex;
        }
        .feedbackTitleWrapper{
            display: flex;
            margin-top: 30px;
            margin-left:30px;
        }
        .feedbackTitle {
            font-weight:700;
            font-size:medium;
            padding-left: 10px;
        }
        .feedbackBody{
            margin: 30px;
        }
        .feedbackWrapper{
            border-style: double;
            border-width: thin;
            margin: 20px 0;
        }
        .seller{
            display: flex;
        }
        .viewSellerFeedback {
            border:none;
            background:none;
            font-weight:bolder;
            padding: 0;
            margin: 0;
            margin-left: 10px;
            text-decoration: underline;
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
                <div class="body-type">${ProductInfo.getType().toUpperCase()}</div>
                <div class= "col-sm-1"></div>
                <div class= "col-sm-10">
                    <div class="body-description">
                        <div class="title">${ProductInfo.getTitle()}</div>
                        <div class="Wrapper" style="display:flex">
                            <div class="seller">
                                Seller: ${ProductInfo.getFirstName()} ${ProductInfo.getLastName()}
                                <form method="post">
                                    <div style="display:none">
                                        <input class="username" type="text" name="username" value=""/>
                                        <input class="password" type="text" name="password" value=""/>
                                        <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                        <input type="text" name="type" value="redirect"/>
                                        <input type="text" name="address" value="feedbackHistory"/>
                                        <input type="text" name="supplierID" value="${ProductInfo.getSupplierUserId()}"/>
                                    </div>
                                    <input class="btn btn-default navbar-btn userActBtn viewSellerFeedback" type="submit" value="View Seller's Feedback"></input>
                                </form>
                            </div>
                        </div>
                        <div class="price-wrapper">
                            <div>Price:</div>
                            <div>${ProductInfo.getPrice()}</div>
                            <div> CAD</div>
                        </div>
                        <form method="post">
                            <div style="display:none">
                                <input class="username" type="text" name="username" value=""/>
                                <input class="password" type="text" name="password" value=""/>
                                <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                <input type="text" name="type" value="redirect"/>
                                <input type="text" name="address" value="createOrder"/>
                                <input type="text" name="supplierID" value="${ProductInfo.getSupplierUserId()}"/>
                                <input type="text" name="productID" value="${ProductInfo.getProductId()}"/>
                            </div>
                            <input class="btn btn-primary active" type="submit" value="Buy it now"></input>
                        </form> 
                        <hr>
                        
                        <div class="description"><div>Description:</div>${ProductInfo.getDescription()}</div>
                        <hr>
                    </div>
                    <div class="feedbacks">
                        <div class="feedbacksLabel">Customer Reviews</div>
                        <c:if test="${FeedbackListsSize ge 1}">
                            <c:forEach var="i" begin="0" end="${FeedbackListsSize - 1}">
                                <div class="feedbackWrapper">
                                    <div class="feedbackTitleWrapper">
                                        <div class="feedbackRate">Rate:${FeedbackList.get(i).getRateStar()}</div>
                                        <div class="feedbackTitle">Feedback Title: ${FeedbackList.get(i).getFeedbackTitle()}</div>
                                    </div>
                                    <div class="feedbackAuthorWrapper">
                                        <div class="feedbackAuthor">Created by ${FeedbackList.get(i).getFirstName()} ${FeedbackList.get(i).getLastName()}</div>
                                        <div class="feedbackDate">&nbsp;on ${FeedbackList.get(i).getFeedbackDate()}</div>
                                    </div>
                                    <div class="feedbackBody"><div>Feedback Comments:</div>${FeedbackList.get(i).getFeedBackComment()}</div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
                <div class= "col-sm-1"></div>
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
        
        if(${operationStatus != ""}) {
            alert("${operationStatus}");
        }
    </script>
</html>
