<%-- 
    Document   : cardList
    Created on : 1-April-2016, 6:41:37 PM
    Author     : syltaxue
--%>
<%@page import="com.mantracker.cs304.models.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <title>Your Card List</title>
    </head>
    <style>
        .productItem {
            border-width: thick;
            border-style: ridge;
            margin: 10px 0;
        }
        .productItemWrapper {
            margin: 10px;
        }
        .productItem-title {
            text-decoration: underline;
        }
        .productColumns {
            font-weight: 500;
        }
        .purchaseLabel {
            font-weight: bolder;
            font-size:xx-large;
            margin: 30px 0;
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
            <div class="row">
                <div class= "col-sm-2"></div>
                <div class= "col-sm-8">
                    <div class="purchaseLabel">Your Card</div>
                    <c:if test="${CardListsSize ge 1}">
                        <div class="productHeader">
                            <table class="table">
                                <thead>
                                  <tr>
                                    <th style="width:15%">Card Type.</th>
                                    <th style="width:20%">Card No.</th>
                                    <th style="width:30%">Card Property</th>
                                    <th style="width:18%">Edit</th>
                                    <th style="width:18%">Delete</th>
                                  </tr>
                                </thead>
                            </table>
                        </div>
                        <c:forEach var="i" begin="0" end="${CardListsSize - 1}">
                            <div class="productItem">
                                <div class="productItemWrapper">
                                    <table class="table">
                                        <tbody>
                                          <tr>
                                            <th class="productColumns" style="width:15%">${CardLists.get(i).getCardType()}</th>
                                            <th class="productColumns" style="width:20%">${CardLists.get(i).getCardNumber()}</th>
                                            <c:if test="${CardLists.get(i).getCardType() == 'debit'}">
                                                <th class="productColumns" style="width:30%">Type: ${CardLists.get(i).getAccountType()}</th>
                                            </c:if>
                                            <c:if test="${CardLists.get(i).getCardType() == 'credit'}">
                                                <th class="productColumns" style="width:30%">Expires: ${CardLists.get(i).getExpireDate()}</th>
                                            </c:if>
                                            <th class="productColumns" style="width:18%">
                                                <form method="post">
                                                    <div style="display:none">
                                                        <input class="username" type="text" name="username" value=""/>
                                                        <input class="password" type="text" name="password" value=""/>
                                                        <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                                        <input id = "signInType" type="text" name="type" value="deleteProduct"/>
                                                        <input id = "signInValue" type="text" name="productID" value="${CardLists.get(i).getCardNumber()}"/>
                                                    </div>
                                                    <input class="btn btn-primary" type="submit" value="Edit">
                                                </form>
                                            </th>
                                            <th class="productColumns" style="width:18%">
                                                <form method="post">
                                                    <div style="display:none">
                                                        <input class="username" type="text" name="username" value=""/>
                                                        <input class="password" type="text" name="password" value=""/>
                                                        <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                                        <input id = "signInType" type="text" name="type" value="deleteProduct"/>
                                                        <input id = "signInValue" type="text" name="productID" value="${CardLists.get(i).getCardNumber()}"/>
                                                    </div>
                                                    <input class="btn btn-primary" type="submit" value="Delete">
                                                </form>
                                            </th>
                                          </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
                <div class= "col-sm-2"></div>
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
</html>
