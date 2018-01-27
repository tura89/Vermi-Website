package Vermi.Controller.Servlet;

import Vermi.manager.dao.AdminManagerDAO;
import Vermi.model.Admin;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static Vermi.SHAHasher.hashText;

@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String hashedPassword = hashText(password);

        AdminManagerDAO adminManager = (AdminManagerDAO) getServletContext().getAttribute(AdminManagerDAO.ATTRIBUTE_NAME);
        HttpSession session = request.getSession(true);

        Admin admin;
        if(adminManager.adminUsernameExists(username)){
            admin = adminManager.getAdmin(username);
        } else {
            //redirect back to login page
            session.setAttribute("message", "No Such Username Exists");
            RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp");
            rd.forward(request, response);
            return;
        }

        if(adminManager.isCorrectPassword(admin, hashedPassword)){
            //redirect to admin control panel
            session.setAttribute("logged", "true");
            session.removeAttribute("message");
            RequestDispatcher rd = request.getRequestDispatcher("displayItems.jsp");
            rd.forward(request, response);
        } else {
            //redirect back to login page
            session.setAttribute("message", "Incorrect Password");
            RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp");
            rd.forward(request, response);
        }


    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}