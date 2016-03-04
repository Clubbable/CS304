/*
 * DatabaseStorage.java
 *
 *
 */
package com.mantracker.cs304.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.apache.logging.log4j.LogManager;

/**
 * @author Martin Liu
 * @version $Revision$ on $Date$ by $Author$
 */
public abstract class DatabaseStorage
{
    /**
     * Returns a connection from the pool
     *
     * @return connection from the pool
     * @throws Exception
     */
    protected static Connection getConnection() throws Exception
    {
        // Get a connection from the pool
        Connection connection = DatabasePoolManager.getPool().getConnection();

        // Return the connection
        return connection;
    }

    /**
     * Safely closes a given connection and returns it to the database pool
     *
     * @param connection connection
     */
    protected static void safeClose(Connection connection)
    {
        if (connection != null)
        {
            try
            {
                // Close the connection
                connection.close();
            }
            catch (SQLException ex)
            {
                // Log
                LogManager.getLogger(DatabaseStorage.class).error("Failed to close the database connection", ex);
            }
        }
    }

    /**
     * Safely closes the given result set
     *
     * @param resultSet result set
     */
    protected static void safeClose(ResultSet resultSet)
    {
        if (resultSet != null)
        {
            try
            {
                // Close the result set
                resultSet.close();
            }
            catch (SQLException ex)
            {
                // Log
                LogManager.getLogger(DatabaseStorage.class).error("Failed to close database result set", ex);
            }
        }
    }

    /**
     * Closes and releases the given statement
     *
     * @param statement statement
     */
    protected static void safeClose(Statement statement)
    {
        if (statement != null)
        {
            try
            {
                // Close the statement
                statement.close();
            }
            catch (SQLException ex)
            {
                // Log
                LogManager.getLogger(DatabaseStorage.class).error("Failed to close database statement", ex);
            }
        }
    }
}
