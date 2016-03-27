/*
 * ScrollDataServlet.java
 *
 */
package com.mantracker.cs304.servlets;

import com.mantracker.cs304.storage.DataStorage;
import com.mantracker.cs304.models.loginInfo;
import com.mantracker.cs304.models.Product;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.ArrayList;
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
        request.setAttribute("loginStatus", false);
        RequestDispatcher requestDispather = request.getRequestDispatcher("/WEB-INF/index.jsp");
        requestDispather.forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws IOException, ServletException
    {
        
        String requestType = (String) request.getParameter("type");
        String requestRedirAddress = (String) request.getParameter("address");
        String username = (String) request.getParameter("username");
        String password = (String) request.getParameter("password");
        request.setAttribute("username", request.getParameter("username"));
        request.setAttribute("password", request.getParameter("password"));
        if (requestType.equals("redirect")) {
            RequestDispatcher requestDispather;
            request.setAttribute("loginStatus", request.getParameter("loginStatus"));
            request.setAttribute("username", request.getParameter("username"));
            request.setAttribute("password", request.getParameter("password"));
            if (requestRedirAddress.equals("orderHistory")) {
                requestDispather = request.getRequestDispatcher("/WEB-INF/orderHistory.jsp");
            } else if (requestRedirAddress.equals("login")) {
                requestDispather = request.getRequestDispatcher("/WEB-INF/login.jsp");
            } else if (requestRedirAddress.equals("create")) {
                requestDispather = request.getRequestDispatcher("/WEB-INF/accountCreate.jsp");
            } else if (requestRedirAddress.equals("productPage")) {
                String productID = (String) request.getParameter("productID");
                Product product = DataStorage.getProduct(productID);
                request.setAttribute("ProductInfo", product);
                requestDispather = request.getRequestDispatcher("/WEB-INF/productPage.jsp");
            } else if (requestRedirAddress.equals("createProduct")) {
                requestDispather = request.getRequestDispatcher("/WEB-INF/productCreate.jsp");
            } else if (requestRedirAddress.equals("sellList")) {
                List<Product> products =  DataStorage.getProductLists(username);
                if (products.size() > 0) {
                    request.setAttribute("ProductListsLastItemIndex", products.size() - 1);
                } else {
                    request.setAttribute("ProductListsLastItemIndex", 0);
                }
                request.setAttribute("ProductLists", products);
                requestDispather = request.getRequestDispatcher("/WEB-INF/productSellingList.jsp");
            } else if (requestRedirAddress.equals("feedbackHistory")) {
                requestDispather = request.getRequestDispatcher("/WEB-INF/feedbackHistory.jsp");
            } else {
                requestDispather = request.getRequestDispatcher("/WEB-INF/index.jsp");
            }
            requestDispather.forward(request, response);
        } else if (requestType.equals("login")) {
            try {
                request.setAttribute("PurchaseCounts", DataStorage.getPurchaseCounts());
                List<loginInfo> login = DataStorage.verifySignin(username, password);
                request.setAttribute("loginStatus", false);
                for(loginInfo item : login) {
                    request.setAttribute("loginStatus", item.getLoginStatus());
                    request.setAttribute("username", item.getUsername());
                    request.setAttribute("password", item.getPassword());
                    request.setAttribute("lastname", item.getLastName());
                    request.setAttribute("firstname", item.getFirstName());
                }
            } catch (Exception e){
                request.setAttribute("loginStatus", false);
            }
            RequestDispatcher requestDispather = request.getRequestDispatcher("/WEB-INF/index.jsp");
            requestDispather.forward(request, response);
        } else if (requestType.equals("logout")) {
            request.setAttribute("loginStatus", false);
            RequestDispatcher requestDispather = request.getRequestDispatcher("/WEB-INF/index.jsp");
            requestDispather.forward(request, response);
        } else if (requestType.equals("createAcc")) {
            try {
                String usernameNewAcc = (String) request.getParameter("username");
                String passwordNewAcc = (String) request.getParameter("password");
                String lastName = (String) request.getParameter("lastname");
                String firstName = (String) request.getParameter("firstname");
                request.setAttribute("createStatus", DataStorage.createAccount(usernameNewAcc, passwordNewAcc, lastName, firstName));
                request.setAttribute("loginStatus", false);
            } catch (Exception e){
                request.setAttribute("createStatus", false);
                request.setAttribute("loginStatus", false);
            }
            RequestDispatcher requestDispather = request.getRequestDispatcher("/WEB-INF/index.jsp");
            requestDispather.forward(request, response);
        } else if (requestType.equals("createProduct")) {
            String loginStatus = (String) request.getParameter("loginStatus");
            try {
                String title = (String) request.getParameter("title");
                String type = (String) request.getParameter("productType");
                String price = (String) request.getParameter("price");
                String description = (String) request.getParameter("description");
                
                request.setAttribute("createStatus", DataStorage.createProduct(username, title, type, price, description));
                request.setAttribute("loginStatus", loginStatus);
            } catch (Exception e){
                request.setAttribute("createProductStatus", false);
                request.setAttribute("loginStatus", loginStatus);
            }
            RequestDispatcher requestDispather = request.getRequestDispatcher("/WEB-INF/index.jsp");
            requestDispather.forward(request, response);
        } else if (requestType.equals("deleteProduct")) {
            String loginStatus = (String) request.getParameter("loginStatus");
            try {
                String productID = (String) request.getParameter("productID");
                
                request.setAttribute("deleteProductStatus", DataStorage.deleteProduct(productID));
                request.setAttribute("deleteProductStatus", loginStatus);
                List<Product> products =  DataStorage.getProductLists(username);
                if (products.size() > 0) {
                    request.setAttribute("ProductListsLastItemIndex", products.size() - 1);
                } else {
                    request.setAttribute("ProductListsLastItemIndex", 0);
                }
                request.setAttribute("ProductLists", products);
            } catch (Exception e){
                request.setAttribute("deleteProductStatus", false);
                request.setAttribute("deleteProductStatus", loginStatus);
            }
            RequestDispatcher requestDispather = request.getRequestDispatcher("/WEB-INF/productSellingList.jsp");
            requestDispather.forward(request, response);
        }
    }

}
