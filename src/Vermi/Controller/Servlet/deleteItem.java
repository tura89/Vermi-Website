package Vermi.Controller.Servlet;

import Vermi.manager.dao.*;
import Vermi.model.Item;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/deleteItem")
public class deleteItem extends HttpServlet{
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String itemType = request.getParameter("itemType");
            Integer itemId = Integer.valueOf( request.getParameter("itemId"));
            Item item = null;

            if(itemType.equals("news")){
                NewsManagerDAO newsManager = (NewsManagerDAO) getServletContext().getAttribute(NewsManagerDAO.ATTRIBUTE_NAME);
                newsManager.deleteNews(itemId);
            } else if(itemType.equals("product")){
                ProductsManagerDAO productsManager = (ProductsManagerDAO) getServletContext().getAttribute(ProductsManagerDAO.ATTRIBUTE_NAME);
                productsManager.deleteProduct(itemId);
            } else if(itemType.equals("member")){
                MembersManagerDAO membersManager = (MembersManagerDAO) getServletContext().getAttribute(MembersManagerDAO.ATTRIBUTE_NAME);
                membersManager.deleteMember(itemId);
            } else if(itemType.equals("partner")){
                PartnersManagerDAO partnersManager = (PartnersManagerDAO) getServletContext().getAttribute(PartnersManagerDAO.ATTRIBUTE_NAME);
                partnersManager.deletePartner(itemId);
            } else if(itemType.equals("misc")){
                MiscManagerDAO miscManager = (MiscManagerDAO) getServletContext().getAttribute(MiscManagerDAO.ATTRIBUTE_NAME);
                miscManager.deleteMisc(itemId);
            }

            RequestDispatcher rd = request.getRequestDispatcher("displayItems.jsp");
            rd.forward(request, response);
        }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        }

    }
