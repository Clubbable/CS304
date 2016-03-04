<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <!-- The following variable comes from com.mantracker.cs304.servlets: request.setAttribute("test"), ("recipeId");-->
        ${test}
        ${recipeId}
        
        <form class="pure-form pure-form-right" method="post">
            <input type="text" name="name" value="hi"/><br>        
            <input type="text" name="group" value="hi2"/>
            <input type="text" name="pass" value="hi3"/>
            <!-- the values inputted into the 3 fields above will be received by com.mantracker.cs304.servlets: request.getAttribute("name"), ("group"), ("pass") -->
            
            <input type="submit" value="submit" >            
        </form>
    </body>
</html>
