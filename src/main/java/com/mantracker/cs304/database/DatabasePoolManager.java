/*
 * DatabasePoolManager.java
 *
 *
 */
package com.mantracker.cs304.database;

import com.jolbox.bonecp.BoneCP;
import com.jolbox.bonecp.BoneCPConfig;
import java.util.concurrent.TimeUnit;
import org.apache.logging.log4j.LogManager;

/**
 * @author Martin Liu
 * @version $Revision$ on $Date$ by $Author$
 */
public class DatabasePoolManager
{
    //Variable declarations
    private static DatabasePoolManager _instance = new DatabasePoolManager();
    private static BoneCP _pool;

    /**
     * Constructor
     */
    private DatabasePoolManager()
    {
    }

    /**
     * Initialized the database pool manager
     *
     * @param configuration configuration file
     */
    public static void init()
    {
        try
        {
            // The newInstance() call is a work around for some broken Java implementations
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            // Create a new configuration object
            BoneCPConfig config = new BoneCPConfig();

            // Setup the configuration
            config.setJdbcUrl("jdbc:mysql://cs304.c0mk5mvcjljr.us-west-2.rds.amazonaws.com/cs304"); // jdbc url specific to your database, eg jdbc:mysql://127.0.0.1/yourdb
            config.setUsername("cs304");
            config.setPassword("ubccs304");
            config.setConnectionTestStatement("SELECT 1");
            config.setConnectionTimeout(10, TimeUnit.SECONDS);
            config.setMinConnectionsPerPartition(5);
            config.setMaxConnectionsPerPartition(10);
            config.setPartitionCount(1);

            // Setup the connection pool
            _pool = new BoneCP(config);

            // Log
            LogManager.getLogger(DatabasePoolManager.class).info("Database configuration initialized");
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DatabasePoolManager.class).fatal("Could not initialize Database configuration", ex);
        }

    }

    /**
     * Destroys the pool
     */
    public static void destroy()
    {
        try
        {
            // Shutdown the pool
            _pool.shutdown();

            // Nullify
            _pool = null;
        }
        catch (Exception ex)
        {
            // Log
            LogManager.getLogger(DatabasePoolManager.class).fatal("Could not destroy the connection pool", ex);
        }
    }

    /**
     * Returns the connection pool
     *
     * @return connection pool
     * @throws Exception The connection pool was not initialized
     */
    public static BoneCP getPool() throws Exception
    {
        if (_pool == null)
        {
            throw new Exception("The connection pool was not initialized!");
        }

        return _pool;
    }
}
