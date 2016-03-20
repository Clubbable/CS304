<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <body>
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
                                <input  type="submit" value="Shopping system" style="border:none; background:none; color:white; font-weight:bolder; font-size: x-large"/>            
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
                                <form method="post">
                                    <div style="display:none">
                                        <input type="text" name="type" value="redirect"/>
                                        <input type="text" name="address" value="orderHistory"/>
                                    </div>
                                    <input  class="btn btn-primary" type="submit" value="sign in" >             
                                </form>
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
                            Most popular
                            See more
                        </div>
                        <div class = "body-typeA">Type1</div>
                        <div class = "body-typeB">Type2</div>
                        <div class = "body-typeC">Type3</div>
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
                       <td>${PurchaseCount.getTitle()}</td>
                       <td>${PurchaseCount.getUserName()}</td>
                       <td>${PurchaseCount.getPurchaseAmount()}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
