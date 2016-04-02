/*
 * ScrollDataServlet.java
 *
 */
package com.mantracker.cs304.servlets;

import com.mantracker.cs304.storage.DataStorage;
import com.mantracker.cs304.models.*;
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
        request.setAttribute("operationStatus", "");
        List<Product> mostPopularProducts = DataStorage.getPopularProduct("all");
        request.setAttribute("popularProductList", mostPopularProducts);
        request.setAttribute("popularProductListSize", Math.min(3,mostPopularProducts.size()));
        List<Product> mostPopularElectronicsProducts = DataStorage.getProductByType("electronics");
        request.setAttribute("popularElecProductList", mostPopularElectronicsProducts);
        request.setAttribute("popularElecProductListSize", Math.min(3,mostPopularElectronicsProducts.size()));
        List<Product> mostPopularFurnitureProducts = DataStorage.getProductByType("furniture");
        request.setAttribute("popularFurniProductList", mostPopularFurnitureProducts);
        request.setAttribute("popularFurniProductListSize", Math.min(3,mostPopularFurnitureProducts.size()));
        List<Product> mostPopularBookProducts = DataStorage.getProductByType("book");
        request.setAttribute("popularBookProductList", mostPopularBookProducts);
        request.setAttribute("popularBookProductListSize", Math.min(3,mostPopularBookProducts.size()));
        request.setAttribute("productsBoughtBySomeone", DataStorage.getProductsBoughtBySomeone());
        request.setAttribute("productsBoughtBySomeoneSize", Math.min(3,DataStorage.getProductsBoughtBySomeone().size()));
        request.setAttribute("loginStatus", false);
        RequestDispatcher requestDispather = request.getRequestDispatcher("/WEB-INF/index.jsp");
        requestDispather.forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws IOException, ServletException
    {
        request.setAttribute("operationStatus", "");
        List<Product> mostPopularProducts = DataStorage.getPopularProduct("all");
        request.setAttribute("popularProductList", mostPopularProducts);
        request.setAttribute("popularProductListSize", Math.min(3,mostPopularProducts.size()));
        List<Product> mostPopularElectronicsProducts = DataStorage.getProductByType("electronics");
        request.setAttribute("popularElecProductList", mostPopularElectronicsProducts);
        request.setAttribute("popularElecProductListSize", Math.min(3,mostPopularElectronicsProducts.size()));
        List<Product> mostPopularFurnitureProducts = DataStorage.getProductByType("furniture");
        request.setAttribute("popularFurniProductList", mostPopularFurnitureProducts);
        request.setAttribute("popularFurniProductListSize", Math.min(3,mostPopularFurnitureProducts.size()));
        List<Product> mostPopularBookProducts = DataStorage.getProductByType("book");
        request.setAttribute("popularBookProductList", mostPopularBookProducts);
        request.setAttribute("popularBookProductListSize", Math.min(3,mostPopularBookProducts.size()));
        request.setAttribute("productsBoughtBySomeone", DataStorage.getProductsBoughtBySomeone());
        request.setAttribute("productsBoughtBySomeoneSize", Math.min(3,DataStorage.getProductsBoughtBySomeone().size()));
        
        String requestType = (String) request.getParameter("type");
        String requestRedirAddress = (String) request.getParameter("address");
        String username = (String) request.getParameter("username");
        String password = (String) request.getParameter("password");
        request.setAttribute("username", request.getParameter("username"));
        request.setAttribute("password", request.getParameter("password"));
        if (requestType.equals("redirect")) {
            RequestDispatcher requestDispather;
            request.setAttribute("loginStatus", request.getParameter("loginStatus"));
            if (requestRedirAddress.equals("orderHistory")) {
                List<Purchase> orders =  DataStorage.getOrders(username);
                request.setAttribute("OrderListsSize", orders.size());
                request.setAttribute("OrderLists", orders);
                requestDispather = request.getRequestDispatcher("/WEB-INF/orderHistory.jsp");
            } else if (requestRedirAddress.equals("login")) {
                requestDispather = request.getRequestDispatcher("/WEB-INF/login.jsp");
            } else if (requestRedirAddress.equals("create")) {
                requestDispather = request.getRequestDispatcher("/WEB-INF/accountCreate.jsp");
            } else if (requestRedirAddress.equals("productPage")) {
                String productID = (String) request.getParameter("productID");
                Product product = DataStorage.getProduct(productID);
                request.setAttribute("ProductInfo", product);
                List<ProductFeedback> feedbackList = DataStorage.getProductFeedback(productID);
                request.setAttribute("FeedbackList", feedbackList);
                request.setAttribute("FeedbackListsSize", feedbackList.size());
                requestDispather = request.getRequestDispatcher("/WEB-INF/productPage.jsp");
            } else if (requestRedirAddress.equals("createProduct")) {
                requestDispather = request.getRequestDispatcher("/WEB-INF/productCreate.jsp");
            } else if (requestRedirAddress.equals("sellList")) {
                List<Product> products =  DataStorage.getProductLists(username);
                request.setAttribute("ProductListsSize", products.size());
                request.setAttribute("ProductLists", products);
                requestDispather = request.getRequestDispatcher("/WEB-INF/productSellingList.jsp");
            } else if (requestRedirAddress.equals("feedbackHistory")) {
                String supplierID = (String) request.getParameter("supplierID");
                List<SupplierFeedback> feedbackList = DataStorage.getSupplierFeedback(supplierID);
                request.setAttribute("FeedbackList", feedbackList);
                request.setAttribute("FeedbackListsSize", feedbackList.size());
                requestDispather = request.getRequestDispatcher("/WEB-INF/feedbackHistory.jsp");
            }  else if (requestRedirAddress.equals("createFeedback")) {
                String feedbackType = (String) request.getParameter("feedbackType");
                request.setAttribute("feedbackType", feedbackType);
                if (feedbackType.equals("Product")) {
                    // Submit a feedback for product
                    String productID = (String) request.getParameter("productID");
                    request.setAttribute("productID", productID);
                    
                } else {
                    // Subtmit a feedback for supplier
                    String supplierID = (String) request.getParameter("supplierID");
                    request.setAttribute("supplierID", supplierID);
                }
                requestDispather = request.getRequestDispatcher("/WEB-INF/createFeedback.jsp");
            } else if (requestRedirAddress.equals("createOrder")) {
                String loginStatus = (String) request.getParameter("loginStatus");
                if(loginStatus.equals("false")) {
                    requestDispather = request.getRequestDispatcher("/WEB-INF/login.jsp");
                } else {
                    String productID = (String) request.getParameter("productID");
                    request.setAttribute("productID", productID);
                    request.setAttribute("customerID", username);
                    List<paymentMethod> paymentMethods = DataStorage.getPaymentMethods(username);
                    request.setAttribute("paymentMethods", paymentMethods);
                    request.setAttribute("paymentMethodSize", paymentMethods.size());
                    Product product = DataStorage.getProduct(productID);
                    request.setAttribute("ProductInfo", product);
                    requestDispather = request.getRequestDispatcher("/WEB-INF/createOrder.jsp");
                }
            } else if (requestRedirAddress.equals("searchResult")) {
                String keyWords = (String) request.getParameter("keyWords");
                List<Product> productList =  DataStorage.getProductsByTitle(keyWords);
                request.setAttribute("productListSize", productList.size());
                request.setAttribute("productList", productList);
                requestDispather = request.getRequestDispatcher("/WEB-INF/searchResult.jsp");
            } else if (requestRedirAddress.equals("productList")) {
                String productCategory = (String) request.getParameter("productCategory");
                List<Product> productList;
                if (productCategory.equals("boughtBySomeone")) {
                    productList = DataStorage.getProductsBoughtBySomeone();
                } else {
                    productList = DataStorage.getProductByType(productCategory);
                }
                request.setAttribute("productCategory", productCategory);
                request.setAttribute("ProductLists", productList);
                request.setAttribute("ProductListsSize", productList.size());
                requestDispather = request.getRequestDispatcher("/WEB-INF/productList.jsp");
            } else if (requestRedirAddress.equals("cardList")) {
                List<paymentMethod> CardLists= DataStorage.getPaymentMethods(username);
                request.setAttribute("CardLists", CardLists);
                request.setAttribute("CardListsSize", CardLists.size());
                requestDispather = request.getRequestDispatcher("/WEB-INF/cardList.jsp");
            } else if (requestRedirAddress.equals("editCard")) {
                String cardNumber = (String) request.getParameter("cardNumber");
                String cardType = (String) request.getParameter("cardType");
                request.setAttribute("cardInfo", DataStorage.getCardInfo(cardNumber, cardType));
                requestDispather = request.getRequestDispatcher("/WEB-INF/editCard.jsp");
            }  else {
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
                request.setAttribute("operationStatus", DataStorage.createAccount(usernameNewAcc, passwordNewAcc, lastName, firstName));
                request.setAttribute("loginStatus", false);
            } catch (Exception e){
                request.setAttribute("operationStatus", e.getMessage());
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
                
                request.setAttribute("operationStatus", DataStorage.createProduct(username, title, type, price, description));
                request.setAttribute("loginStatus", loginStatus);
            } catch (Exception e){
                request.setAttribute("operationStatus", e.getMessage());
                request.setAttribute("loginStatus", loginStatus);
            }
            RequestDispatcher requestDispather = request.getRequestDispatcher("/WEB-INF/index.jsp");
            requestDispather.forward(request, response);
        } else if (requestType.equals("deleteProduct")) {
            String loginStatus = (String) request.getParameter("loginStatus");
            request.setAttribute("loginStatus", loginStatus);
            try {
                String productID = (String) request.getParameter("productID");
                
                request.setAttribute("operationStatus", DataStorage.deleteProduct(productID));
                List<Product> products =  DataStorage.getProductLists(username);
                request.setAttribute("ProductListsSize", products.size());
                request.setAttribute("ProductLists", products);
            } catch (Exception e){
                request.setAttribute("operationStatus", e.getMessage());
            }
            RequestDispatcher requestDispather = request.getRequestDispatcher("/WEB-INF/productSellingList.jsp");
            requestDispather.forward(request, response);
        } else if (requestType.equals("createFeedback")) {
            String loginStatus = (String) request.getParameter("loginStatus");
            request.setAttribute("loginStatus", loginStatus);
            try {
                String feedbackType = (String) request.getParameter("feedbackType");
                String CustomerID = (String) request.getParameter("customerID");
                String feedbackComment = (String) request.getParameter("feedbackComment");
                String rateStar = (String) request.getParameter("rateStar");
                String feedbackTitle = (String) request.getParameter("feedbackTitle");
                if (feedbackType.equals("Product")){
                    String productID = (String) request.getParameter("productID");
                    request.setAttribute("operationStatus", DataStorage.submitProductFeedback(productID, CustomerID, feedbackComment, rateStar, feedbackTitle));
                } else {
                    String supplierID = (String) request.getParameter("supplierID");
                    request.setAttribute("operationStatus", DataStorage.submitSupplierFeedback(supplierID, CustomerID, feedbackComment, rateStar, feedbackTitle));
                }
                List<Product> products =  DataStorage.getProductLists(username);
                request.setAttribute("ProductListsSize", products.size());
                request.setAttribute("ProductLists", products);
            } catch (Exception e){
                request.setAttribute("operationStatus", e.getMessage());
            }
            List<Purchase> orders =  DataStorage.getOrders(username);
            request.setAttribute("OrderListsSize", orders.size());
            request.setAttribute("OrderLists", orders);
            RequestDispatcher requestDispather = request.getRequestDispatcher("/WEB-INF/orderHistory.jsp");
            requestDispather.forward(request, response);
        } else if (requestType.equals("createOrder")) {
            String loginStatus = (String) request.getParameter("loginStatus");
            request.setAttribute("loginStatus", loginStatus);
            String productID = (String) request.getParameter("productID");
            try {
                String shippingAddress = (String) request.getParameter("shippingAddress");
                String CustomerID = username;
                String paymentMethodSelect = (String) request.getParameter("paymentMethodSelect");
                if (paymentMethodSelect.equals("Enter a new card")){
                    String newCardType = (String) request.getParameter("newCardType");
                    String newCardNumber = (String) request.getParameter("newCardNumber");
                    if (newCardType.equals("debit")){
                        String newCardAccType = (String) request.getParameter("newCardAccType");
                        DataStorage.addDebitPaymentMethod(newCardNumber, CustomerID, newCardAccType);
                    } else {
                        // Credit
                        String newCardExpire = (String) request.getParameter("newCardExpire");
                        DataStorage.addCreditPaymentMethod(newCardNumber, CustomerID, newCardExpire);
                    }
                    request.setAttribute("operationStatus", DataStorage.createOrder(productID, CustomerID, shippingAddress, newCardNumber));
                } else {
                    // Existing card
                    String cardNum = paymentMethodSelect.substring(paymentMethodSelect.indexOf("Card No.:") + 9, paymentMethodSelect.indexOf(";"));
                    request.setAttribute("operationStatus", DataStorage.createOrder(productID, CustomerID, shippingAddress, cardNum));
                }
            } catch (Exception e){
                request.setAttribute("operationStatus", e.getMessage()); 
            }
            Product product = DataStorage.getProduct(productID);
            request.setAttribute("ProductInfo", product);
            RequestDispatcher requestDispather = request.getRequestDispatcher("/WEB-INF/productPage.jsp");
            requestDispather.forward(request, response);
        }  else if (requestType.equals("deleteCard")) {
            String loginStatus = (String) request.getParameter("loginStatus");
            request.setAttribute("loginStatus", loginStatus);
            try {
                String cardNumber = (String) request.getParameter("cardNumber");
                
                request.setAttribute("operationStatus", DataStorage.deleteCard(cardNumber));
            } catch (Exception e){
                request.setAttribute("operationStatus", e.getMessage());
            }
            List<paymentMethod> CardLists= DataStorage.getPaymentMethods(username);
            request.setAttribute("CardLists", CardLists);
            request.setAttribute("CardListsSize", CardLists.size());
            RequestDispatcher requestDispather = request.getRequestDispatcher("/WEB-INF/cardList.jsp");
            requestDispather.forward(request, response);
        }  else if (requestType.equals("editCard")) {
            String loginStatus = (String) request.getParameter("loginStatus");
            request.setAttribute("loginStatus", loginStatus);
            try {
                String cardNumber = (String) request.getParameter("cardNumber");
                String cardType = (String) request.getParameter("cardType");
                String cardAccType = (String) request.getParameter("cardAccType");
                String cardExpire = (String) request.getParameter("cardExpire");
                String oldCardNumber = (String) request.getParameter("oldCardNumber");
                request.setAttribute("operationStatus", DataStorage.editCard(oldCardNumber, cardNumber, cardType, cardAccType, cardExpire));
            } catch (Exception e){
                request.setAttribute("operationStatus", e.getMessage());
            }
            List<paymentMethod> CardLists= DataStorage.getPaymentMethods(username);
            request.setAttribute("CardLists", CardLists);
            request.setAttribute("CardListsSize", CardLists.size());
            RequestDispatcher requestDispather = request.getRequestDispatcher("/WEB-INF/cardList.jsp");
            requestDispather.forward(request, response);
        }
    }

}
