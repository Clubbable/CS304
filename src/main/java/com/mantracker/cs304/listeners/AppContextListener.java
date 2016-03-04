/*
 * AppContextListener.java
 *
 *
 */
package com.mantracker.cs304.listeners;

import com.mantracker.cs304.database.DatabasePoolManager;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * @author Martin Liu <martinliu1993@hotmail.com>
 * @version $Revision$ on $Date$ by $Author$
 */
@WebListener
public class AppContextListener implements ServletContextListener
{
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent)
    {
        DatabasePoolManager.init();
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent)
    {
        // Clear the database pool and stop task
        DatabasePoolManager.destroy();
    }

}
