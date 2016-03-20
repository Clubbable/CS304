/*
 * ScrollDataServlet.java
 *
 */
package com.mantracker.cs304.servlets;

import com.mantracker.cs304.models.PurchaseCount;
import com.mantracker.cs304.storage.DataStorage;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Martin Liu <martinliu1993@hotmail.com>
 * @version $Revision$ on $Date$ by $Author$
 */
@WebServlet(name = "Servlet", urlPatterns =
{
    "", "/"
})

public class Servlet extends HttpServlet
{
    @Override
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws IOException, ServletException
    {
        request.setAttribute("PurchaseCounts", DataStorage.getPurchaseCounts());
        
        RequestDispatcher requestDispather = request.getRequestDispatcher("/WEB-INF/index.jsp");
        requestDispather.forward(request, response);

    }

    @Override
    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws IOException, ServletException
    {
        
        String requestType = (String) request.getParameter("type");
        String requestRedirAddress = (String) request.getParameter("address");
        
        if (requestType.equals("redirect")) {
            RequestDispatcher requestDispather;
            if (requestRedirAddress.equals("orderHistory")) {
                requestDispather = request.getRequestDispatcher("/WEB-INF/orderHistory.jsp");
            } else {
                requestDispather = request.getRequestDispatcher("/WEB-INF/index.jsp");
            }
            requestDispather.forward(request, response);
        }

    }

}
