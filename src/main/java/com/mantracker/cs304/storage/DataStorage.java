/*
 * ScrollDataStorage.java
 *
 *
 */
package com.mantracker.cs304.storage;

import com.mantracker.cs304.database.DatabaseStorage;
import com.mantracker.cs304.models.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import java.text.SimpleDateFormat;
import java.util.Calendar;
/**
 * @author Martin Liu
 * @version $Revision$ on $Date$ by $Author$
 */
public class DataStorage extends DatabaseStorage
{

    public static List<PurchaseCount> getPurchaseCounts()
    {
        List<PurchaseCount> counts = new ArrayList();
        
        // Define database variables
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();

            // Build the query
            sb.append("SELECT title, userName, COUNT(*) AS purchaseAmount FROM User, Product, Purchase ");
            sb.append("WHERE User.userName = Purchase.CustomerUserID ");
            sb.append("AND Product.productID = Purchase.productID ");
            sb.append("GROUP BY title");

            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb.toString());

            // Execute the query
            resultSet = statement.executeQuery();
            // Get the result
            while (resultSet.next())
            {
                String title = resultSet.getString("title");
                String userName = resultSet.getString("userName");
                int purchaseAmount = resultSet.getInt("purchaseAmount");
                
                counts.add(new PurchaseCount(title, userName, purchaseAmount));
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("getPurchaseCounts error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        return counts;
    }

    public static List<loginInfo> verifySignin(String username, String password) {
        // Define database variables
        List<loginInfo> login = new ArrayList();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();

            // Build the query
            sb.append("SELECT userName, password, firstName, lastName ");
            sb.append("FROM User ");
            sb.append("WHERE userName = '" + username + "' ");
            sb.append("AND password = '" + password + "' ");

            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb.toString());

            // Execute the query
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String userN = resultSet.getString("username");
                String pw = resultSet.getString("password");
                String firstName = resultSet.getString("firstname");
                String lastName = resultSet.getString("lastname");
                login.add(new loginInfo(userN, pw, true, firstName, lastName));
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("verifySignin error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }

        return login;
    }
   
    public static boolean createAccount(String username, String password, String lastName, String firstName) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean createSuccessful = false;
        boolean noDuplicate = true;
        int result = 0;
        // Check if the user exists
        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();
            // Build the query
            sb.append("SELECT userName ");
            sb.append("FROM User ");
            sb.append("WHERE userName = '" + username + "';");
            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb.toString());

            // Execute the query
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                noDuplicate = false;
            }
        }
        catch (Exception ex)
        {
            noDuplicate = false;
            // Log
            LogManager.getLogger(DataStorage.class).fatal("Verify User exist error", ex);
        }
        if (noDuplicate) {
            try {
                // Create new user
                // Build the query
                StringBuilder sb = new StringBuilder();
                // Build the query
                sb.append("INSERT INTO User (userName, password, firstName, lastName)");
                sb.append("VALUES (");
                sb.append("'" + username+ "',");
                sb.append("'" + password+ "',");
                sb.append("'" + firstName+ "',");
                sb.append("'" + lastName+ "')");
                // Get a connection
                connection = getConnection();
                statement = connection.prepareStatement(sb.toString());
                // Execute the query
                result = statement.executeUpdate();
                if (result == 1) {
                    createSuccessful = true;
                }
            }
            catch (Exception ex)
            {
                // Log
                LogManager.getLogger(DataStorage.class).fatal("Creat Account error", ex);
            }
            finally
            {
                safeClose(resultSet);
                safeClose(statement);
                safeClose(connection);
            }
        }
        return createSuccessful;
    }
    
    public static boolean createProduct(String username, String title, String type, String price, String description) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean createSuccessful = false;
        int result = 0;

        try
        {
        // Create new user
        // Build the query
        StringBuilder sb = new StringBuilder();
        // Build the query
        sb.append("INSERT INTO Product (description, title, price, supplierUserID, type)");
        sb.append("VALUES (");
        sb.append("'" + description+ "',");
        sb.append("'" + title+ "',");
        sb.append(price+ ",");
        sb.append("'" + username+ "',");
        sb.append("'" + type+ "')");
        // Get a connection
        connection = getConnection();
        statement = connection.prepareStatement(sb.toString());
        // Execute the query
        result = statement.executeUpdate();
        if (result == 1) {
            createSuccessful = true;
        }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("Creat Product error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        
        return createSuccessful;
    }
    
    public static List<Product> getProductLists(String username) {
        List<Product> productList = new ArrayList();
        
        // Define database variables
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();

            // Build the query
            sb.append("SELECT title, description, price, type, supplierUserID, productID ");
            sb.append("FROM Product ");
            sb.append("WHERE supplierUserID = '" + username + "' ");
            sb.append("ORDER BY productID ASC ");

            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb.toString());

            // Execute the query
            resultSet = statement.executeQuery();
            // Get the result
            while (resultSet.next())
            {
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                float price = resultSet.getFloat("price");
                String type = resultSet.getString("type");
                String supplierUserID = resultSet.getString("supplierUserID");
                int productID = resultSet.getInt("productID");
                
                productList.add(new Product(productID, description, title, price, type, supplierUserID, null, null, 0,0,0,0));
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("get Product List error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        return productList;
    }

    public static boolean deleteProduct(String productID) {
        // Define database variables
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean deleteStatus = false;
        int result = 0;
        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();

            // Build the query
            sb.append("DELETE FROM Product ");
            sb.append("WHERE productID = '" + productID + "' ");

            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb.toString());

            result = statement.executeUpdate();
            if (result == 1) {
                deleteStatus = true;
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("Delete Product error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        return deleteStatus;
    }
    
    public static Product getProduct(String productID) {
        // Define database variables
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Product product = null;
        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();

            // Build the query
            sb.append("SELECT title, description, price, type, supplierUserID, productID, lastName, firstName ");
            sb.append("FROM Product, User ");
            sb.append("Where ProductID = '" + productID + "' ");
            sb.append("AND userName = supplierUserID ");
            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb.toString());

            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                float price = resultSet.getFloat("price");
                String type = resultSet.getString("type");
                String supplierUserID = resultSet.getString("supplierUserID");
                int productNumber = resultSet.getInt("productID");
                String lastName = resultSet.getString("lastName");
                String firstName = resultSet.getString("firstName");
                product = new Product(productNumber, description, title, price, type, supplierUserID, lastName, firstName, 0,0,0,0);
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("Get Product error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        return product;
    }
    
    public static List<Purchase> getOrders (String username) {
        List<Purchase> orderList = new ArrayList();
        
        // Define database variables
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();

            // Build the query
            sb.append("SELECT Purch.ShippingAddress, Purch.OrderNumber, Purch.purchaseDate, Purch.productID, Purch.CustomerUserID, Purch.CardNumber, Prod.title, Prod.price, Prod.supplierUserID, U.lastName, U.firstName ");
            sb.append("FROM Purchase Purch, User U, Product Prod ");
            sb.append("WHERE Purch.productID = Prod.productID AND U.userName = Purch.CustomerUserID " + "AND U.userName = '" + username + "' ");
            sb.append("ORDER BY Purch.OrderNumber ASC ");

            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb.toString());

            // Execute the query
            resultSet = statement.executeQuery();
            // Get the result
            while (resultSet.next())
            {
                String ShippingAddress = resultSet.getString("ShippingAddress");
                int OrderNumber = resultSet.getInt("OrderNumber");
                String purchaseDate = resultSet.getString("purchaseDate");
                int productID = resultSet.getInt("productID");
                String title = resultSet.getString("title");
                String lastName = resultSet.getString("lastName");
                String firstName = resultSet.getString("firstName");
                String customerID = resultSet.getString("CustomerUserID");
                String cardNumber = resultSet.getString("CardNumber");
                float price = resultSet.getFloat("price");
                String supplierUserID = resultSet.getString("supplierUserID");
                
                orderList.add(new Purchase(ShippingAddress, OrderNumber, productID, price, supplierUserID, cardNumber, customerID, purchaseDate, firstName, lastName, title));
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("get Order List error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        return orderList;
    }
    
    public static List<ProductFeedback> getProductFeedback (String productID) {
        List<ProductFeedback> feedbackList = new ArrayList();
        
        // Define database variables
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();

            // Build the query
            sb.append("SELECT * ");
            sb.append("FROM ProductFeedback, User ");
            sb.append("WHERE productID = '" + productID + "' AND UserName = CustomerUserID ");
            sb.append("ORDER BY FeedbackID ASC ");

            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb.toString());

            // Execute the query
            resultSet = statement.executeQuery();
            // Get the result
            while (resultSet.next())
            {
                int FeedbackID = resultSet.getInt("FeedbackID");
                String FeedbackDate = resultSet.getString("FeedBackDate");
                String FeedBackComment = resultSet.getString("FeedBackComment");
                int rateStar = resultSet.getInt("rateStar");
                int productId = resultSet.getInt("productID");
                String FeedBackTitle = resultSet.getString("FeedBackTitle");
                String CustomerUserID = resultSet.getString("CustomerUserID");
                String lastName = resultSet.getString("lastName");
                String firstName = resultSet.getString("firstName");
                
                feedbackList.add(new ProductFeedback(FeedbackID, FeedbackDate, FeedBackComment, rateStar, productId, FeedBackTitle, CustomerUserID, lastName, firstName));
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("get feedback List error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        return feedbackList;
    }

    public static List<SupplierFeedback> getSupplierFeedback (String username) {
        List<SupplierFeedback> feedbackList = new ArrayList();
        
        // Define database variables
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();

            // Build the query
            sb.append("SELECT * ");
            sb.append("FROM SupplierFeedback, User ");
            sb.append("WHERE supplierUserID = '" + username + "' AND UserName = CustomerUserID ");
            sb.append("ORDER BY FeedbackID ASC ");

            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb.toString());

            // Execute the query
            resultSet = statement.executeQuery();
            // Get the result
            while (resultSet.next())
            {
                int FeedbackID = resultSet.getInt("FeedbackID");
                String FeedbackDate = resultSet.getString("FeedBackDate");
                String FeedBackComment = resultSet.getString("FeedBackComment");
                int rateStar = resultSet.getInt("rateStar");
                String supplierUserID = resultSet.getString("supplierUserID");
                String FeedBackTitle = resultSet.getString("FeedBackTitle");
                String CustomerUserID = resultSet.getString("CustomerUserID");
                String lastName = resultSet.getString("lastName");
                String firstName = resultSet.getString("firstName");
                
                feedbackList.add(new SupplierFeedback(FeedbackID, FeedbackDate, FeedBackComment, rateStar, supplierUserID, FeedBackTitle, CustomerUserID, lastName, firstName));
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("get feedback List error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        return feedbackList;
    }
    
    public static boolean submitProductFeedback (String productID, String CustomerID, String feedbackComment, String rateStar, String feedbackTitle) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean createSuccessful = false;

        int result = 0;

        try
        {
            // Create new user
            // Build the query
            StringBuilder sb = new StringBuilder();
            // Build the query
            String createdTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
            sb.append("INSERT INTO ProductFeedback (FeedBackDate, FeedBackComment, rateStar, productID, FeedBackTitle, CustomerUserID)");
            sb.append("VALUES (");
            sb.append("'" + createdTime+ "',");
            sb.append("'" + feedbackComment+ "',");
            sb.append(rateStar+ ",");
            sb.append(productID+ ",");
            sb.append("'" + feedbackTitle+ "',");
            sb.append("'" + CustomerID+ "') ");
            // Get a connection
            connection = getConnection();
            statement = connection.prepareStatement(sb.toString());
            // Execute the query
            result = statement.executeUpdate();
            if (result == 1) {
                createSuccessful = true;
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("Creat Product Feedback error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        
        return createSuccessful;
    }
    
    public static boolean submitSupplierFeedback (String supplierID, String CustomerID, String feedbackComment, String rateStar, String feedbackTitle) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean createSuccessful = false;
        int result = 0;
        
        try
        {
        // Create new user
        // Build the query
        StringBuilder sb = new StringBuilder();
        // Build the query
        String createdTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
        sb.append("INSERT INTO SupplierFeedback (FeedBackDate, FeedBackComment, rateStar, CustomerUserID, supplierUserID, FeedBackTitle)");
        sb.append("VALUES (");
        sb.append("'" + createdTime+ "',");
        sb.append("'" + feedbackComment+ "',");
        sb.append(rateStar+ ",");
        sb.append("'" + CustomerID+ "',");
        sb.append("'" + supplierID+ "',");
        sb.append("'" + feedbackTitle+ "') ");
        // Get a connection
        connection = getConnection();
        statement = connection.prepareStatement(sb.toString());
        // Execute the query
        result = statement.executeUpdate();
        if (result == 1) {
            createSuccessful = true;
        }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("Creat Supplier Feedback error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        
        return createSuccessful;
    }
    
    public static List<paymentMethod> getPaymentMethods(String ownerID){
        List<paymentMethod> paymentMethodList = new ArrayList();
        
        // Define database variables
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();

            // Build the query
            sb.append("SELECT *");
            sb.append("FROM PaymentMethod P, DebitPaymentMethod D ");
            sb.append("WHERE P.CardNumber = D.CardNumber AND P.ownerID = '" + ownerID + "' ");
            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb.toString());

            // Execute the query
            resultSet = statement.executeQuery();
            // Get the result
            while (resultSet.next())
            {
                String cardNumber = resultSet.getString("CardNumber");
                String accountType = resultSet.getString("accountType");
                paymentMethodList.add(new paymentMethod(cardNumber, ownerID, "debit", accountType, null));
            }
            
            // Create StringBuilder for the query
            StringBuilder sb2 = new StringBuilder();

            // Build the query
            sb2.append("SELECT *");
            sb2.append("FROM PaymentMethod P, CreditPaymentMethod C ");
            sb2.append("WHERE P.CardNumber = C.CardNumber AND P.ownerID = '" + ownerID + "' ");
            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb2.toString());

            // Execute the query
            resultSet = statement.executeQuery();
            // Get the result
            while (resultSet.next())
            {
                String cardNumber = resultSet.getString("CardNumber");
                String expireDate = resultSet.getString("expireDate");
                paymentMethodList.add(new paymentMethod(cardNumber, ownerID, "credit", null, expireDate));
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("Get payment method list error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        return paymentMethodList;
    }
    
    public static boolean addDebitPaymentMethod(String cardNumber, String customerID, String accType) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean addSuccessful = false;
        int result = 0;
        
        try
        {
            // Build the query
            StringBuilder sb = new StringBuilder();
            // Build the query
            sb.append("INSERT INTO PaymentMethod (CardNumber, ownerID)");
            sb.append("VALUES (");
            sb.append("'" + cardNumber+ "',");
            sb.append("'" + customerID+ "') ");
            // Get a connection
            connection = getConnection();
            statement = connection.prepareStatement(sb.toString());
            // Execute the query
            result = statement.executeUpdate();
            // Build the query
            StringBuilder sb2 = new StringBuilder();
            // Build the query
            sb2.append("INSERT INTO DebitPaymentMethod (CardNumber, accountType)");
            sb2.append("VALUES (");
            sb2.append("'" + cardNumber+ "',");
            sb2.append("'" + accType+ "') ");
            // Get a connection
            connection = getConnection();
            statement = connection.prepareStatement(sb2.toString());
            // Execute the query
            result = statement.executeUpdate();
            if (result == 1) {
                addSuccessful = true;
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("Add debit payment method error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        
        return addSuccessful;
    }
    
    public static boolean addCreditPaymentMethod(String cardNumber, String customerID, String expireDate) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean addSuccessful = false;
        int result = 0;
        
        try
        {
            // Build the query
            StringBuilder sb = new StringBuilder();
            // Build the query
            sb.append("INSERT INTO PaymentMethod (CardNumber, ownerID)");
            sb.append("VALUES (");
            sb.append("'" + cardNumber+ "',");
            sb.append("'" + customerID+ "') ");
            // Get a connection
            connection = getConnection();
            statement = connection.prepareStatement(sb.toString());
            // Execute the query
            result = statement.executeUpdate();
            // Build the query
            StringBuilder sb2 = new StringBuilder();
            // Build the query
            sb2.append("INSERT INTO CreditPaymentMethod (CardNumber, expireDate)");
            sb2.append("VALUES (");
            sb2.append("'" + cardNumber+ "',");
            sb2.append("'" + expireDate+ "') ");
            // Get a connection
            connection = getConnection();
            statement = connection.prepareStatement(sb2.toString());
            // Execute the query
            result = statement.executeUpdate();
            if (result == 1) {
                addSuccessful = true;
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("Add credit payment method error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        
        return addSuccessful;
    }
    
    public static boolean createOrder(String productID, String CustomerID, String shippingAddress, String cardNumber){
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean addSuccessful = false;
        int result = 0;
        
        try
        {
            // Build the query
            StringBuilder sb = new StringBuilder();
           String purchaseDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
            // Build the query
            sb.append("INSERT INTO Purchase (ShippingAddress, productID, CardNumber, purchaseDate, CustomerUserID)");
            sb.append("VALUES (");
            sb.append("'" + shippingAddress+ "',");
            sb.append(productID+ ",");
            sb.append("'" + cardNumber+ "',");
            sb.append("'" + purchaseDate+ "',");
            sb.append("'" + CustomerID+ "') ");
            // Get a connection
            connection = getConnection();
            statement = connection.prepareStatement(sb.toString());
            // Execute the query
            result = statement.executeUpdate();
            if (result == 1) {
                addSuccessful = true;
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("Create order error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        
        return addSuccessful;
    }
    
    public static List<Product> getProductsByTitle (String keywords) {
        List<Product> productList = new ArrayList();
        
        // Define database variables
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();

            // Build the query
            sb.append("SELECT title, description, price, type, supplierUserID, productID, lastName, firstName ");
            sb.append("FROM Product, User ");
            sb.append("WHERE title like '%" + keywords + "%' ");
            sb.append("AND userName = supplierUserID ");

            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb.toString());

            // Execute the query
            resultSet = statement.executeQuery();
            // Get the result
            while (resultSet.next())
            {
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                float price = resultSet.getFloat("price");
                String type = resultSet.getString("type");
                String supplierUserID = resultSet.getString("supplierUserID");
                int productNumber = resultSet.getInt("productID");
                String lastName = resultSet.getString("lastName");
                String firstName = resultSet.getString("firstName");
                
                productList.add(new Product(productNumber, description, title, price, type, supplierUserID, lastName, firstName, 0,0,0,0));
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("search product error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        return productList;
    }
    
    public static List<Product> getPopularProduct (String type) {
        List<Product> productList = new ArrayList();
        
        // Define database variables
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();

            // Build the query
            sb.append("SELECT COUNT(*) AS orderCount, Prod.title, Prod.productId, Prod.description, Prod.type, Prod.price, AVG(pf.rateStar) AS average, MAX(pf.rateStar) AS max, MIN(pf.rateStar) AS min ");
            sb.append("FROM Product Prod, ProductFeedback pf ");
            sb.append("WHERE pf.productId = Prod.productID AND Prod.productID in (select productID from Purchase) ");
            if (!type.equals("all")) {
                sb.append("AND Prod.type = '" + type + "' ");
            }
            sb.append("GROUP BY Prod.productID ");
            sb.append("ORDER BY orderCount DESC ");

            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb.toString());

            // Execute the query
            resultSet = statement.executeQuery();
            // Get the result
            while (resultSet.next())
            {
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                String prodType = resultSet.getString("type");
                int productNumber = resultSet.getInt("productId");
                int productAmount = resultSet.getInt("orderCount");
                float price = resultSet.getFloat("price");
                int maxRate = resultSet.getInt("max");
                int minRate = resultSet.getInt("min");
                float average = resultSet.getFloat("average");
                productList.add(new Product(productNumber, description, title, price, prodType, null, null, null, productAmount, maxRate, minRate, average));
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("Get most popular product error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        return productList;
    }
    
    public static List<Product> getProductsBoughtBySomeone() {
        List<Product> productList = new ArrayList();
        
        // Define database variables
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();

            // Build the query
            sb.append("SELECT pu.productID, p.description, p.title, p.type, p.price ");
            sb.append("from Purchase pu, Product p ");
            sb.append("WHERE p.productID = pu.productID ");
            sb.append("AND pu.productID ");
            sb.append("NOT IN (SELECT DISTINCT productID from Product WHERE productID NOT IN (SELECT ProductID From Purchase)) ");
            sb.append("GROUP BY p.productID ");
            
            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb.toString());

            // Execute the query
            resultSet = statement.executeQuery();
            // Get the result
            while (resultSet.next())
            {
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                String prodType = resultSet.getString("type");
                int productNumber = resultSet.getInt("productId");
                float price = resultSet.getFloat("price");
                productList.add(new Product(productNumber, description, title, price, prodType, null, null, null, 0, 0, 0, 0));
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("getProductsBoughtBySomeone error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        return productList;
    }
    
    
    public static List<Product> getProductByType (String type) {
        List<Product> productList = new ArrayList();
        
        // Define database variables
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();

            // Build the query
            sb.append("SELECT *  ");
            sb.append("FROM Product ");
            sb.append("WHERE type = '" + type + "' ");
            sb.append("ORDER BY productID ASC ");

            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb.toString());

            // Execute the query
            resultSet = statement.executeQuery();
            // Get the result
            while (resultSet.next())
            {
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                String prodType = resultSet.getString("type");
                int productNumber = resultSet.getInt("productId");
                float price = resultSet.getFloat("price");
                productList.add(new Product(productNumber, description, title, price, prodType, null, null, null, 0, 0, 0, 0));
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("Get product by type error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        return productList;
    }
    
    public static boolean deleteCard(String cardNumber) {
        // Define database variables
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean deleteStatus = false;
        int result = 0;
        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();

            // Build the query
            sb.append("DELETE FROM PaymentMethod ");
            sb.append("WHERE CardNumber = '" + cardNumber + "' ");

            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb.toString());

            result = statement.executeUpdate();
            if (result == 1) {
                deleteStatus = true;
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("Delete Card error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        return deleteStatus;
    }
    
    public static paymentMethod getCardInfo(String cardNumber, String cardType) {
        // Define database variables
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        paymentMethod payment = new paymentMethod();
        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();

            // Build the query
            sb.append("SELECT * ");
            if (cardType.equals("credit")) {
                sb.append("FROM PaymentMethod P , CreditPaymentMethod C ");
                sb.append("WHERE P.CardNumber = '" + cardNumber + "' AND P.CardNumber = C.CardNumber ");
            } else {
                sb.append("FROM PaymentMethod P, DebitPaymentMethod D ");
                sb.append("WHERE P.CardNumber = '" + cardNumber + "' AND P.CardNumber = D.CardNumber ");
            }

            // Get a connection
            connection = getConnection();

            // Prepare statement
            statement = connection.prepareStatement(sb.toString());

            // Execute the query
            resultSet = statement.executeQuery();
            // Get the result
            while (resultSet.next())
            {
                String cardNum = resultSet.getString("CardNumber");
                String ownerID = resultSet.getString("ownerID");
                if (cardType.equals("credit")) {
                    String expireDate = resultSet.getString("expireDate");
                    payment = new paymentMethod(cardNum, ownerID, cardType, null, expireDate);
                } else {
                    String accountType = resultSet.getString("accountType");
                    payment = new paymentMethod(cardNum, ownerID, cardType, accountType, null);
                }
            }
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("Get cardinfo error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        return payment;
    }
}
