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

@WebServlet("/ChangeItem")
public class changeItem extends HttpServlet {
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
        String Modifieddate = String.valueOf(d);

        String itemType = request.getParameter("itemType");
        Integer itemId = Integer.valueOf( request.getParameter("itemId"));
        Item item = null;

        if(itemType.equals("news")){
            NewsManagerDAO newsManager = (NewsManagerDAO) getServletContext().getAttribute(NewsManagerDAO.ATTRIBUTE_NAME);
            item = newsManager.getNews(itemId);
        } else if(itemType.equals("product")){
            ProductsManagerDAO productsManager = (ProductsManagerDAO) getServletContext().getAttribute(ProductsManagerDAO.ATTRIBUTE_NAME);
            item = productsManager.getProduct(itemId);
        } else if(itemType.equals("member")){
            MembersManagerDAO membersManager = (MembersManagerDAO) getServletContext().getAttribute(MembersManagerDAO.ATTRIBUTE_NAME);
            item = membersManager.getMember(itemId);
        } else if(itemType.equals("partner")){
            PartnersManagerDAO partnersManager = (PartnersManagerDAO) getServletContext().getAttribute(PartnersManagerDAO.ATTRIBUTE_NAME);
            item = partnersManager.getPartner(itemId);
        } else if(itemType.equals("misc")){
            MiscManagerDAO miscManager = (MiscManagerDAO) getServletContext().getAttribute(MiscManagerDAO.ATTRIBUTE_NAME);
            item = miscManager.getMisc(itemId);
        }

        item.setID(itemId);

        item.setTitle_ge(nTitleG);
        item.setIntro_ge(nIntroG);
        item.setContent_ge(nContentG);
        item.setKeywords_ge(nKeywordsG);
        item.setDescription_ge(nDescriptionG);

        item.setTitle_rus(nTitleR);
        item.setIntro_rus(nIntroR);
        item.setContent_rus(nContentR);
        item.setKeywords_rus(nKeywordsR);
        item.setDescription_rus(nDescriptionR);

        item.setTitle_eng(nTitleE);
        item.setIntro_eng(nIntroE);
        item.setContent_eng(nContentE);
        item.setKeywords_eng(nKeywordsE);
        item.setDescription_eng(nDescriptionE);

        item.setModifiedDate(Modifieddate);
        item.setDisplayWeight(nWeight);
        item.setPublic(isPublic);

        if(form.equals("news-form")){
            NewsManagerDAO newsManager = (NewsManagerDAO) getServletContext().getAttribute(NewsManagerDAO.ATTRIBUTE_NAME);
            newsManager.deleteNews(itemId);
            newsManager.createNews(item);
        }
        if(form.equals("member-form")){
            MembersManagerDAO membersManager = (MembersManagerDAO) getServletContext().getAttribute(MembersManagerDAO.ATTRIBUTE_NAME);
            membersManager.deleteMember(itemId);
            membersManager.createMember(item);
        }
        if(form.equals("product-form")){
            ProductsManagerDAO productsManager = (ProductsManagerDAO) getServletContext().getAttribute(ProductsManagerDAO.ATTRIBUTE_NAME);
            productsManager.deleteProduct(itemId);
            productsManager.createProduct(item);
        }
        if(form.equals("partner-form")){
            PartnersManagerDAO partnersManager = (PartnersManagerDAO) getServletContext().getAttribute(PartnersManagerDAO.ATTRIBUTE_NAME);
            partnersManager.deletePartner(itemId);
            partnersManager.createPartner(item);
        }
        if(form.equals("misc-form")){
            MiscManagerDAO miscManager = (MiscManagerDAO) getServletContext().getAttribute(MiscManagerDAO.ATTRIBUTE_NAME);
            miscManager.deleteMisc(itemId);
            miscManager.createMisc(item);
        }

        RequestDispatcher rd = request.getRequestDispatcher("displayItems.jsp");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}