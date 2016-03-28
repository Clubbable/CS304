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
        int id = 1;
        int result = 0;
        
        try
        {
            // Get the total count of the amount of user, and set it as the new ID of the newly created user
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();
            // Build the query
            sb.append("SELECT COUNT(*) AS countNum ");
            sb.append("FROM Product ");
            sb.append("WHERE productID >= 0 ;");
            connection = getConnection();
            statement = connection.prepareStatement(sb.toString());
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                id = resultSet.getInt("countNum") + 1;
            }
        }
       catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DataStorage.class).fatal("Get product count error", ex);
        }
        finally
        {
            safeClose(resultSet);
            safeClose(statement);
            safeClose(connection);
        }
        
        try
        {
        // Create new user
        // Build the query
        StringBuilder sb = new StringBuilder();
        // Build the query
        sb.append("INSERT INTO Product (productID, description, title, price, supplierUserID, type)");
        sb.append("VALUES (");
        sb.append(Integer.toString(id) + ",");
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
                
                productList.add(new Product(productID, description, title, price, type, supplierUserID, null, null));
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
                product = new Product(productNumber, description, title, price, type, supplierUserID, lastName, firstName);
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
}
