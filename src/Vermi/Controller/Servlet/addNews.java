package Vermi.Controller.Servlet;

import Vermi.manager.MiscManager;
import Vermi.manager.PartnersManager;
import Vermi.manager.ProductsManager;
import Vermi.manager.dao.*;
import Vermi.model.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/addNews")
public class addNews extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nTitleG = request.getParameter("title-g");
        String nIntroG = request.getParameter("intro-g");
        String nContentG = request.getParameter("content-g");
        String nKeywordsG = request.getParameter("keywords-g");
        String nDescriptionG = request.getParameter("description-g");

        String nTitleR = request.getParameter("title-r");
        String nIntroR = request.getParameter("intro-r");
        String nContentR = request.getParameter("content-r");
        String nKeywordsR = request.getParameter("keywords-r");
        String nDescriptionR = request.getParameter("description-r");

        String nTitleE = request.getParameter("title-e");
        String nIntroE = request.getParameter("intro-e");
        String nContentE = request.getParameter("content-e");
        String nKeywordsE = request.getParameter("keywords-e");
        String nDescriptionE = request.getParameter("description-e");
        String form = request.getParameter("htmlFormName");

        int nWeight = 1;
        if (request.getParameter("weight") != null){
            nWeight = Integer.parseInt(request.getParameter("weight"));
        }

        String[] boxes = request.getParameterValues("isPublic");
        boolean isPublic = false;
        if (boxes != null)
            isPublic = true;

        Date d = new Date();
        String date = String.valueOf(d);
        if(form.equals("misc-form")){
            Integer type = Integer.parseInt(request.getParameter("dataType"));
            Item item = new Item(nWeight, isPublic, date,
                    nTitleG, nIntroG, nContentG, nKeywordsG, nDescriptionG,
                    nTitleR, nIntroR, nContentR, nKeywordsR, nDescriptionR,
                    nTitleE, nIntroE, nContentE, nKeywordsE, nDescriptionE, type);
            MiscManagerDAO miscManager = (MiscManagerDAO) getServletContext().getAttribute(MiscManagerDAO.ATTRIBUTE_NAME);
            miscManager.createMisc(item);
        } else {

            Item item = new Item(nWeight, isPublic, date,
                    nTitleG, nIntroG, nContentG, nKeywordsG, nDescriptionG,
                    nTitleR, nIntroR, nContentR, nKeywordsR, nDescriptionR,
                    nTitleE, nIntroE, nContentE, nKeywordsE, nDescriptionE);

            if(form.equals("news-form")){
                NewsManagerDAO newsManager = (NewsManagerDAO) getServletContext().getAttribute(NewsManagerDAO.ATTRIBUTE_NAME);
                newsManager.createNews(item);
            }
            if(form.equals("members-form")){
                MembersManagerDAO membersManager = (MembersManagerDAO) getServletContext().getAttribute(MembersManagerDAO.ATTRIBUTE_NAME);
                membersManager.createMember(item);
            }
            if(form.equals("product-form")){
                ProductsManagerDAO productsManager = (ProductsManagerDAO) getServletContext().getAttribute(ProductsManagerDAO.ATTRIBUTE_NAME);
                productsManager.createProduct(item);
            }
            if(form.equals("partner-form")){
                PartnersManagerDAO partnersManager = (PartnersManagerDAO) getServletContext().getAttribute(PartnersManagerDAO.ATTRIBUTE_NAME);
                partnersManager.createPartner(item);
            }
            response.sendRedirect("displayItems.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
