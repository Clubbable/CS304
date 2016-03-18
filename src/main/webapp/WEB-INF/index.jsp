 <%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <img src="http://icons.iconarchive.com/icons/paomedia/small-n-flat/1024/sign-check-icon.png" alt="Mountain View" style="width:304px;height:228px;">
        
        <div class = "container-fluid">
            <div class = "header">
                <div class = "header-container">
                    <div class= "row">
                        <div class = "col-xs-4 col-sm-4">
                            <div class = "item" onClick={this._handleClick.bind(this, 'home')}>
                                <Link class="header-buttons-text" to={'/'}>Shopping system</Link>
                            </div>
                        </div>
                        <div class = "col-xs-6 col-sm-5">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">Go!</button>
                                </span>
                            </div>
                        </div>
                        <div class = "col-xs-2 col-sm-3">
                            <div class = "header-login">
                                <form method="post">
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
                        <div class = "popularProduct">
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
    </body>
</html>
