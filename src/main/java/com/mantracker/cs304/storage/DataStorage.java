/*
 * ScrollDataStorage.java
 *
 *
 */
package com.mantracker.cs304.storage;

import com.mantracker.cs304.database.DatabaseStorage;
import com.mantracker.cs304.models.PurchaseCount;
import com.mantracker.cs304.models.loginInfo;
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
            sb.append("WHERE User.userID = Purchase.CustomerUserID ");
            sb.append("AND Product.productID = Purchase.productID ");
            sb.append("GROUP BY title, userName ");

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
        
        // Check if the user exists
        try
        {
            // Create StringBuilder for the query
            StringBuilder sb = new StringBuilder();

            // Build the query
            sb.append("SELECT userName ");
            sb.append("FROM User ");
            sb.append("WHERE userName = '" + username + "' ");

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
            try
            {
                // Get the total count of the amount of user, and set it as the new ID of the newly created user
                // Create StringBuilder for the query
                StringBuilder sb = new StringBuilder();
                // Build the query
                sb.append("SELECT COUNT(*) AS count");
                sb.append("FROM User ");
                connection = getConnection();
                statement = connection.prepareStatement(sb.toString());
                resultSet = statement.executeQuery();
                int id = 0;
                if (resultSet.next()) {
                    id = resultSet.getInt("count");
                }
                
                // Create new user
                // Create StringBuilder for the query
                sb = new StringBuilder();

                // Build the query
                sb.append("INSERT INTO User ");
                sb.append("(userID, userName, password, firstName, lastName) ");
                sb.append("VALUES ");
                sb.append(Integer.toString(id) + ",‘" + username + "','" + password + "','" + firstName + "','" + lastName + "' ");

                // Get a connection
                connection = getConnection();

                // Prepare statement
                statement = connection.prepareStatement(sb.toString());

                // Execute the query
                resultSet = statement.executeQuery();
                if (resultSet.next()) {
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
}
