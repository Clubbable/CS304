<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List" %>
<%@page import="javax.servlet.*" %>
<%@page import="com.mantracker.cs304.models.PurchaseCount" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" integrity="sha384-aUGj/X2zp5rLCbBxumKTCw2Z50WgIr1vs/PFN4praOTvYXWlVyh2UtNUU0KAUhAX" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <title>Online Shopping System</title>
    </head>
    <style>
        #userActivities {
            background-color: #E0FFFF;
        }
        .userActBtn {
            margin-right: 30px;
        }
        .words{
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .rateSelect{
            display: inline;
        }
        .inline {
            display: inline;
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
    <body stlye ="overflow-x:hidden">
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
            </div>
            <div class="body">
                <div class= "row" id="userActivities">
                    <div class= "col-sm-1"></div>
                    <div class= "col-sm-10">
                        <div style="display:flex">
                            <form method="post">
                                <div style="display:none">
                                    <input class="username" type="text" name="username" value=""/>
                                    <input class="password" type="text" name="password" value=""/>
                                    <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                    <input type="text" name="type" value="redirect"/>
                                    <input type="text" name="address" value="createProduct"/>
                                </div>
                                <input class="btn btn-default navbar-btn userActBtn" type="submit" value="Create a Sale"></input>
                            </form>
                            <form method="post">
                                <div style="display:none">
                                    <input class="username" type="text" name="username" value=""/>
                                    <input class="password" type="text" name="password" value=""/>
                                    <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                    <input type="text" name="type" value="redirect"/>
                                    <input type="text" name="address" value="sellList"/>
                                </div>
                                <input class="btn btn-default navbar-btn userActBtn" type="submit" value="Your Selling List"></input>
                            </form>
                            <form method="post">
                                <div style="display:none">
                                    <input class="username" type="text" name="username" value=""/>
                                    <input class="password" type="text" name="password" value=""/>
                                    <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                    <input type="text" name="type" value="redirect"/>
                                    <input type="text" name="address" value="orderHistory"/>
                                </div>
                                <input class="btn btn-default navbar-btn userActBtn" type="submit" value="Order History"></input>
                            </form>
                            <form method="post">
                                <div style="display:none">
                                    <input class="username" type="text" name="username" value=""/>
                                    <input class="password" type="text" name="password" value=""/>
                                    <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                    <input type="text" name="type" value="redirect"/>
                                    <input type="text" name="address" value="feedbackHistory"/>
                                    <input id="feedbackHistorySupplierID" type="text" name="supplierID" value=""/>
                                </div>
                                <input class="btn btn-default navbar-btn userActBtn" type="submit" value="Your Feedbacks"></input>
                            </form>
                            <form method="post">
                                <div style="display:none">
                                    <input class="username" type="text" name="username" value=""/>
                                    <input class="password" type="text" name="password" value=""/>
                                    <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                    <input type="text" name="type" value="redirect"/>
                                    <input type="text" name="address" value="cardList"/>
                                </div>
                                <input class="btn btn-default navbar-btn userActBtn" type="submit" value="Card List"></input>
                            </form>
                        </div>
                    </div>
                    <div class= "col-sm-1"></div>
                </div>
                <div class= "row">
                    <div class= "col-sm-1"></div>
                    <div class= "col-sm-10">
                        <c:if test="${popularProductListSize ge 1}">
                            <div class = "popularProduct" style="height:50px;">
                                <div class="title">
                                    <div class = "popularProduct-title" style="display:inline; font-size:xx-large">Most Popular</div>
                                    <div class="rateSelect">Show Rate: <select id="rate-select"><option>Max</option> <option>Min</option></select></div>
                                    <form method="post" class="inline">
                                        <div style="display:none">
                                            <input class="username" type="text" name="username" value=""/>
                                            <input class="password" type="text" name="password" value=""/>
                                            <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                            <input type="text" name="type" value="redirect"/>
                                            <input type="text" name="address" value="productList"/>
                                            <input type="text" name="productCategory" value="all"/>
                                        </div>
                                        <input  class="btn btn-link" type="submit" value="See more >>" style="display:inline; flex:1; float:right; padding-top:20px; font-size:larger"/>            
                                    </form>
                                 </div>
                                <div class="row">
                                    <c:if test="${popularProductListSize ge 1}">
                                        <c:forEach var="i" begin="0" end="${popularProductListSize - 1}">
                                            <div class="col-sm-6 col-md-4">
                                                <div class="caption"></div>
                                                <h3 class="words">${popularProductList.get(i).getTitle()}</h3>
                                                <p class="words">Total Order amount: ${popularProductList.get(i).getProductAmount()}</p>
                                                <p class="words">${popularProductList.get(i).getDescription()}</p>
                                                <p class="words">Average Rate: ${popularProductList.get(i).getAverageRate()}</p>
                                                <p class="words maxRate">Best Rate: ${popularProductList.get(i).getMaxRate()}</p>
                                                <p class="words minRate" style="display: none">Least Rate: ${popularProductList.get(i).getMinRate()}</p>
                                                    <form method="post">
                                                        <div style="display:none">
                                                            <input class="username" type="text" name="username" value=""/>
                                                            <input class="password" type="text" name="password" value=""/>
                                                            <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                                            <input type="text" name="type" value="redirect"/>
                                                            <input type="text" name="address" value="productPage"/>
                                                            <input type="text" name="productID" value="${popularProductList.get(i).getProductId()}"/>
                                                        </div>
                                                        <input  class="btn btn-primary" type="submit" value="See Details"/>            
                                                    </form>
                                                </p>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                            <hr style="width:100%; height:2px; background:#507786">
                        </c:if>
                        <c:if test="${productsBoughtBySomeoneSize ge 1}">
                            <div class = "popularProduct" style="height:50px;">
                                <div class="title">
                                    <div class = "popularProduct-title" style="display:inline; font-size:xx-large">Products Others have purchased</div>
                                    <form method="post" class="inline">
                                        <div style="display:none">
                                            <input class="username" type="text" name="username" value=""/>
                                            <input class="password" type="text" name="password" value=""/>
                                            <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                            <input type="text" name="type" value="redirect"/>
                                            <input type="text" name="address" value="productList"/>
                                            <input type="text" name="productCategory" value="boughtBySomeone"/>
                                        </div>
                                        <input  class="btn btn-link" type="submit" value="See more >>" style="display:inline; flex:1; float:right; padding-top:20px; font-size:larger"/>            
                                    </form>
                                 </div>
                                <div class="row">
                                    <c:if test="${productsBoughtBySomeoneSize ge 1}">
                                        <c:forEach var="i" begin="0" end="${productsBoughtBySomeoneSize - 1}">
                                            <div class="col-sm-6 col-md-4">
                                                <div class="caption"></div>
                                                <h3 class="words">${productsBoughtBySomeone.get(i).getTitle()}</h3>
                                                <p class="words">${productsBoughtBySomeone.get(i).getDescription()}</p>
                                                <p>
                                                    <form method="post">
                                                        <div style="display:none">
                                                            <input class="username" type="text" name="username" value=""/>
                                                            <input class="password" type="text" name="password" value=""/>
                                                            <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                                            <input type="text" name="type" value="redirect"/>
                                                            <input type="text" name="address" value="productPage"/>
                                                            <input type="text" name="productID" value="${productsBoughtBySomeone.get(i).getProductId()}"/>
                                                        </div>
                                                        <input  class="btn btn-primary" type="submit" value="See Details"/>            
                                                    </form>
                                                </p>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                            <hr style="width:100%; height:2px; background:#507786">
                        </c:if>
                        <c:if test="${popularElecProductListSize ge 1}">
                            <div class = "body-typeElectronics">
                                <div class="title">
                                    <div class = "typeA-title" style="display:inline; font-size:xx-large">All ELECTRONICS</div>
                                    <form class="inline" method="post">
                                        <div style="display:none" class="inline">
                                            <input class="username" type="text" name="username" value=""/>
                                            <input class="password" type="text" name="password" value=""/>
                                            <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                            <input type="text" name="type" value="redirect"/>
                                            <input type="text" name="address" value="productList"/>
                                            <input type="text" name="productCategory" value="electronics"/>
                                        </div>
                                        <input  class="btn btn-link" type="submit" value="See more >>" style="display:inline; flex:1; float:right; padding-top:20px; font-size:larger"/>            
                                    </form>
                                 </div>
                                <div class="row">
                                    <c:if test="${popularElecProductListSize ge 1}">
                                        <c:forEach var="i" begin="0" end="${popularElecProductListSize - 1}">
                                            <div class="col-sm-6 col-md-4">
                                                <div class="caption"></div>
                                                <h3 class="words">${popularElecProductList.get(i).getTitle()}</h3>
                                                <p class="words">${popularElecProductList.get(i).getDescription()}</p>
                                                <p>
                                                    <form method="post">
                                                        <div style="display:none">
                                                            <input class="username" type="text" name="username" value=""/>
                                                            <input class="password" type="text" name="password" value=""/>
                                                            <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                                            <input type="text" name="type" value="redirect"/>
                                                            <input type="text" name="address" value="productPage"/>
                                                            <input type="text" name="productID" value="${popularElecProductList.get(i).getProductId()}"/>
                                                        </div>
                                                        <input  class="btn btn-primary" type="submit" value="See Details"/>            
                                                    </form>
                                                </p>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${popularFurniProductListSize ge 1}">
                            <hr style="width:100%; height:2px; background:#507786">
                            <div class = "body-typeFurniture">
                                <div class="title">
                                <div class = "typeB-title" style="display:inline; font-size:xx-large">All Furniture</div>
                                <form method="post" class="inline">
                                    <div style="display:none">
                                        <input class="username" type="text" name="username" value=""/>
                                        <input class="password" type="text" name="password" value=""/>
                                        <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                        <input type="text" name="type" value="redirect"/>
                                        <input type="text" name="address" value="productList"/>
                                        <input type="text" name="productCategory" value="furniture"/>
                                    </div>
                                    <input  class="btn btn-link" type="submit" value="See more >>" style="display:inline; flex:1; float:right; padding-top:20px; font-size:larger"/>            
                                </form>
                                </div>
                                <div class="row">
                                    <c:if test="${popularFurniProductListSize ge 1}">
                                        <c:forEach var="i" begin="0" end="${popularFurniProductListSize - 1}">
                                            <div class="col-sm-6 col-md-4">
                                                <div class="caption"></div>
                                                <h3 class="words">${popularFurniProductList.get(i).getTitle()}</h3>
                                                <p class="words">${popularFurniProductList.get(i).getDescription()}</p>
                                                <p>
                                                    <form method="post">
                                                        <div style="display:none">
                                                            <input class="username" type="text" name="username" value=""/>
                                                            <input class="password" type="text" name="password" value=""/>
                                                            <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                                            <input type="text" name="type" value="redirect"/>
                                                            <input type="text" name="address" value="productPage"/>
                                                            <input type="text" name="productID" value="${popularFurniProductList.get(i).getProductId()}"/>
                                                        </div>
                                                        <input  class="btn btn-primary" type="submit" value="See Details"/>            
                                                    </form>
                                                </p>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${popularBookProductListSize ge 1}">
                            <hr style="width:100%; height:2px; background:#507786">
                            <div class = "body-typeBook">
                                <div class="title">
                                 <div class = "typeC-title" style="display:inline; font-size:xx-large">All BOOKS</div>
                                <form method="post" class="inline">
                                    <div style="display:none">
                                        <input class="username" type="text" name="username" value=""/>
                                        <input class="password" type="text" name="password" value=""/>
                                        <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                        <input type="text" name="type" value="redirect"/>
                                        <input type="text" name="address" value="productList"/>
                                        <input type="text" name="productCategory" value="book"/>
                                    </div>
                                    <input  class="btn btn-link" type="submit" value="See more >>" style="display:inline; flex:1; float:right; padding-top:20px; font-size:larger"/>            
                                </form>
                                 </div>
                                <div class="row">
                                    <c:if test="${popularBookProductListSize ge 1}">
                                        <c:forEach var="i" begin="0" end="${popularBookProductListSize - 1}">
                                            <div class="col-sm-6 col-md-4">
                                                <div class="caption"></div>
                                                <h3 class="words">${popularBookProductList.get(i).getTitle()}</h3>
                                                <p class="words">${popularBookProductList.get(i).getDescription()}</p>
                                                <p>
                                                    <form method="post">
                                                        <div style="display:none">
                                                            <input class="username" type="text" name="username" value=""/>
                                                            <input class="password" type="text" name="password" value=""/>
                                                            <input class="loginStatus" type="text" name="loginStatus" value=""/>
                                                            <input type="text" name="type" value="redirect"/>
                                                            <input type="text" name="address" value="productPage"/>
                                                            <input type="text" name="productID" value="${popularBookProductList.get(i).getProductId()}"/>
                                                        </div>
                                                        <input  class="btn btn-primary" type="submit" value="See Details"/>            
                                                    </form>
                                                </p>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <div class= "col-sm-1"></div>
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
            document.getElementById("userActivities").setAttribute("style", "display:block");
            document.getElementById("feedbackHistorySupplierID").setAttribute("value", sessionStorage.username);
        } else if (sessionStorage.loginStatus === "false") {
            document.getElementById("signInBtn").setAttribute("value", "Sign In");
            document.getElementById("signInValue").setAttribute("value", "login");
            document.getElementById("signInType").setAttribute("value", "redirect");
            document.getElementById("createAccBtn").setAttribute("style", "display:inline-block");
            document.getElementById("userActivities").setAttribute("style", "display:none");
            document.getElementById("feedbackHistorySupplierID").setAttribute("value", null);
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
        
        $("#rate-select").on("change", function (event) {
            if (document.getElementById("rate-select").value === "Max") {
                var maxRate = document.getElementsByClassName("maxRate");
                for(var i = 0; i < maxRate.length; i++) {
                    maxRate[i].setAttribute("style", "display: block");
                }
                var minRate = document.getElementsByClassName("minRate");
                for(var i = 0; i < minRate.length; i++) {
                    minRate[i].setAttribute("style", "display: none");
                }
            } else {
                var maxRate = document.getElementsByClassName("maxRate");
                for(var i = 0; i < maxRate.length; i++) {
                    maxRate[i].setAttribute("style", "display: none");
                }
                var minRate = document.getElementsByClassName("minRate");
                for(var i = 0; i < minRate.length; i++) {
                    minRate[i].setAttribute("style", "display: block");
                }
            }
        });
        
        if(${operationStatus != ""}) {
            alert("${operationStatus}");
        }
    </script>
</html>
