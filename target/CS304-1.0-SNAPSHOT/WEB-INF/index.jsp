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
        <title>Online Shopping System</title>
    </head>
    <script>
        sessionStorage.loginStatus = false;
        if (${loginStatus} == true) {
            sessionStorage.loginStatus = ${loginStatus};
            sessionStorage.username = "${username}";
            sessionStorage.password = "${password}";
            sessionStorage.lastname = "${lastname}";
            sessionStorage.firstname = "${firstname}";
        } else {
            sessionStorage.loginStatus = false;
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
                                            <input type="text" name="type" value="redirect"/>
                                            <input id = "signInValue" type="text" name="address" value="login"/>
                                        </div>
                                        <input id="signInBtn" class="btn btn-primary" type="submit" value="Sign In">
                                    </form>
                                    <form method="post">
                                        <div style="display:none">
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
                <div class= "row">
                    <div class= "col-sm-1"></div>
                    <div class= "col-sm-10">
                        <div class = "popularProduct" style="height:50px;">
                            <div class="title">
                             <div class = "popularProduct-title" style="display:inline; font-size:xx-large">Most Popular</div>
                             <div class ="btn btn-link" style="display:inline; flex:1; float:right; padding-top:20px; font-size:larger">See more >></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-md-4">
                                    <div class="caption"></div>
                                    <h3>Product title</h3>
                                    <p>Description.....</p>
                                    <p><a href="#" class="btn btn-primary" role="button">See Details</a></p>
                                </div>
                                <div class="col-sm-6 col-md-4">
                                    <div class="caption"></div>
                                    <h3>Product title</h3>
                                    <p>Description.....</p>
                                    <p><a href="#" class="btn btn-primary" role="button">See Details</a></p>
                                </div>
                                <div class="col-sm-6 col-md-4">
                                    <div class="caption"></div>
                                    <h3>Product title</h3>
                                    <p>Description.....</p>
                                    <p><a href="#" class="btn btn-primary" role="button">See Details</a></p>
                                </div>
                            </div>
                        </div>
                        <hr style="width:100%; height:2px; background:#507786">
                        <div class = "body-typeA">
                            <div class="title">
                             <div class = "typeA-title" style="display:inline; font-size:xx-large">Type A</div>
                             <div class ="btn btn-link" style="display:inline; flex:1; float:right; padding-top:20px; font-size:larger">See more >></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-md-4">
                                    <div class="caption"></div>
                                    <h3>Product title</h3>
                                    <p>Description.....</p>
                                    <p><a href="#" class="btn btn-primary" role="button">See Details</a></p>
                                </div>
                                <div class="col-sm-6 col-md-4">
                                    <div class="caption"></div>
                                    <h3>Product title</h3>
                                    <p>Description.....</p>
                                    <p><a href="#" class="btn btn-primary" role="button">See Details</a></p>
                                </div>
                                <div class="col-sm-6 col-md-4">
                                    <div class="caption"></div>
                                    <h3>Product title</h3>
                                    <p>Description.....</p>
                                    <p><a href="#" class="btn btn-primary" role="button">See Details</a></p>
                                </div>
                            </div>
                        </div>
                        <hr style="width:100%; height:2px; background:#507786">
                        <div class = "body-typeB">
                            <div class="title">
                             <div class = "typeB-title" style="display:inline; font-size:xx-large">Type B</div>
                             <div class ="btn btn-link" style="display:inline; flex:1; float:right; padding-top:20px; font-size:larger">See more >></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-md-4">
                                    <div class="caption"></div>
                                    <h3>Product title</h3>
                                    <p>Description.....</p>
                                    <p><a href="#" class="btn btn-primary" role="button">See Details</a></p>
                                </div>
                                <div class="col-sm-6 col-md-4">
                                    <div class="caption"></div>
                                    <h3>Product title</h3>
                                    <p>Description.....</p>
                                    <p><a href="#" class="btn btn-primary" role="button">See Details</a></p>
                                </div>
                                <div class="col-sm-6 col-md-4">
                                    <div class="caption"></div>
                                    <h3>Product title</h3>
                                    <p>Description.....</p>
                                    <p><a href="#" class="btn btn-primary" role="button">See Details</a></p>
                                </div>
                            </div>
                        </div>
                        <hr style="width:100%; height:2px; background:#507786">
                        <div class = "body-typeC">
                            <div class="title">
                             <div class = "typeC-title" style="display:inline; font-size:xx-large">Type C</div>
                             <div class ="btn btn-link" style="display:inline; flex:1; float:right; padding-top:20px; font-size:larger">See more >></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-md-4">
                                    <div class="caption"></div>
                                    <h3>Product title</h3>
                                    <p>Description.....</p>
                                    <p><a href="#" class="btn btn-primary" role="button">See Details</a></p>
                                </div>
                                <div class="col-sm-6 col-md-4">
                                    <div class="caption"></div>
                                    <h3>Product title</h3>
                                    <p>Description.....</p>
                                    <p><a href="#" class="btn btn-primary" role="button">See Details</a></p>
                                </div>
                                <div class="col-sm-6 col-md-4">
                                    <div class="caption"></div>
                                    <h3>Product title</h3>
                                    <p>Description.....</p>
                                    <p><a href="#" class="btn btn-primary" role="button">See Details</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class= "col-sm-1"></div>
                </div>
            </div>
        </div>

        <table class="pure-table pure-table-striped">
            <thead>
                <th>Title</th>
                <th>UserName</th>
                <th>Purchase Amount</th>
            </thead>
            <tbody>
                <c:forEach items="${PurchaseCounts}" var="PurchaseCount" varStatus="counter">
                    <tr>
                       <td>${PurchaseCount.getTitle()} ${loginStatus}</td>
                       <td>${PurchaseCount.getUserName()}</td>
                       <td>${PurchaseCount.getPurchaseAmount()}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <form method="post">
            <div style="display:none">
                <input type="text" name="type" value="redirect"/>
                <input type="text" name="address" value="productPage"/>
            </div>
            <input  class="btn btn-primary" type="submit" value="Link to product page" >
        </form>
    </body>
    <script>
        if (sessionStorage.loginStatus == "true") {
            document.getElementById("signInBtn").setAttribute("value", "Sign Out");
            document.getElementById("signInValue").setAttribute("value", "logout");
            document.getElementById("createAccBtn").setAttribute("style", "display:none");
        } else if (sessionStorage.loginStatus == "false") {
            document.getElementById("signInBtn").setAttribute("value", "Sign In");
            document.getElementById("signInValue").setAttribute("value", "login");
            document.getElementById("createAccBtn").setAttribute("style", "display:inline-block");
        }
    </script>
</html>
