<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : productPage
    Created on : 20-Mar-2016, 7:54:37 PM
    Author     : syltaxue
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            display: flex;
        }
        .feedbackTitleWrapper{
            display: flex;
            margin-Top: 30px;
        }
        .feedbackTitle {
            font-weight:700;
            font-size:medium;
            padding-left: 10px;
        }
        .feedbackBody{
            margin: 30px;
        }
    </style>
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
                                            <input type="text" name="address" value="login"/>
                                        </div>
                                        <input  class="btn btn-primary" type="submit" value="Sign in">
                                    </form>
                                    <form method="post">
                                        <div style="display:none">
                                            <input type="text" name="type" value="redirect"/>
                                            <input type="text" name="address" value="create"/>
                                        </div>
                                        <input  class="btn btn-primary" type="submit" value="Create account" >
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="body">
                <div class="body-type">Category</div>
                <div class= "col-sm-1"></div>
                <div class= "col-sm-10">
                    <div class="body-description">
                        <div class="title">Title</div>
                        <div class="Wrapper" style="display:flex">
                            <div class="seller">seller name</div>
                            <div class="date">Created at: Date</div>
                        </div>
                        <div class="price-wrapper">
                            <div>Price:</div>
                            <div>number</div>
                            <div> CAD</div>
                        </div>
                        <button type="button" class="btn btn-primary active">Buy it now</button>
                        <hr>
                        <div class="description">Description</div>
                        <hr>
                    </div>
                    <div class="feedbacks">
                        <div class="feedbacksLabel">Customer Reviews</div>
                        <div class="feedbackTitleWrapper">
                            <div class="feedbackRate">Rate:5 star</div>
                            <div class="feedbackTitle">Feedback Title</div>
                        </div>
                        <div class="feedbackAuthorWrapper">
                            <div class="feedbackAuthor">Created by name</div>
                            <div class="feedbackDate">on Date</div>
                        </div>
                        <div class="feedbackBody">Feedback Body</div>
                    </div>
                </div>
                <div class= "col-sm-1"></div>
            </div>
        </div>
    </body>
</html>
