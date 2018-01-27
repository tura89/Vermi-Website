package Vermi.Controller.Listener;

import Vermi.manager.*;
import Vermi.manager.dao.*;
import Vermi.manager.dao.db.DBInfo;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.sql.DataSource;

@WebListener()
public class ContextListener implements ServletContextListener,
        HttpSessionListener, HttpSessionAttributeListener {

    // Public constructor is required by servlet spec
    public ContextListener() {
    }

    // -------------------------------------------------------
    // ServletContextListener implementation
    // -------------------------------------------------------
    public void contextInitialized(ServletContextEvent sce) {
      /* This method is called when the servlet context is
         initialized(when the Web application is deployed).
         You can initialize servlet context related data here.
      */
        try {
            // Initializing JDBC connection (with connection pool)
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            DataSource dataSource = (DataSource) envContext.lookup("jdbc/"
                    + DBInfo.DB_NAME);

            // Creating DAO layers
            AdminManager adminManager = new AdminManagerDAO(dataSource);

            NewsManager newsManager = new NewsManagerDAO(dataSource);
            MembersManager membersManager = new MembersManagerDAO(dataSource);
            ProductsManager productsManager = new ProductsManagerDAO(dataSource);
            PartnersManager partnersManager = new PartnersManagerDAO(dataSource);
            MiscManager miscManager = new MiscManagerDAO(dataSource);

            // Saving DAO layers to context for further use
            sce.getServletContext().setAttribute(AdminManagerDAO.ATTRIBUTE_NAME, adminManager);
            sce.getServletContext().setAttribute(NewsManagerDAO.ATTRIBUTE_NAME, newsManager);
            sce.getServletContext().setAttribute(MembersManagerDAO.ATTRIBUTE_NAME, membersManager);
            sce.getServletContext().setAttribute(ProductsManagerDAO.ATTRIBUTE_NAME, productsManager);
            sce.getServletContext().setAttribute(PartnersManagerDAO.ATTRIBUTE_NAME, partnersManager);
            sce.getServletContext().setAttribute(MiscManagerDAO.ATTRIBUTE_NAME, miscManager);
        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {
      /* This method is invoked when the Servlet Context
         (the Web application) is undeployed or
         Application Server shuts down.
      */

    }

    // -------------------------------------------------------
    // HttpSessionListener implementation
    // -------------------------------------------------------
    public void sessionCreated(HttpSessionEvent se) {
      /* Session is created. */
    }

    public void sessionDestroyed(HttpSessionEvent se) {
      /* Session is destroyed. */
    }

    // -------------------------------------------------------
    // HttpSessionAttributeListener implementation
    // -------------------------------------------------------

    public void attributeAdded(HttpSessionBindingEvent sbe) {
      /* This method is called when an attribute
         is added to a session.
      */
    }

    public void attributeRemoved(HttpSessionBindingEvent sbe) {
      /* This method is called when an attribute
         is removed from a session.
      */
    }

    public void attributeReplaced(HttpSessionBindingEvent sbe) {
      /* This method is invoked when an attibute
         is replaced in a session.
      */
    }

}
