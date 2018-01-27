<%@ page import="Vermi.model.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="Vermi.manager.PartnersManager" %>
<%@ page import="Vermi.manager.dao.*" %><%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 8/18/2017
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.

  Main Page that users see
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Mentor Education Bootstrap Theme</title>
  <meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
  <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Candal|Alegreya+Sans">
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/imagehover.min.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>

<%
  String lang = request.getParameter("lang");
  if(lang == null || lang.isEmpty() || ( !lang.equals("geo") && !lang.equals("rus") && !lang.equals("eng"))){
    String redirectURL = "index.jsp?lang=geo";
    response.sendRedirect(redirectURL);
    return;
  }

  ProductsManagerDAO ProductsManager = (ProductsManagerDAO) session.getServletContext().getAttribute(ProductsManagerDAO.ATTRIBUTE_NAME);
  List<Item> products = ProductsManager.getAllPublicProducts();

  NewsManagerDAO newsManager = (NewsManagerDAO) session.getServletContext().getAttribute(NewsManagerDAO.ATTRIBUTE_NAME);
  List<Item> newss = newsManager.getAllPublicNews();

  MembersManagerDAO membersManager = (MembersManagerDAO) session.getServletContext().getAttribute(MembersManagerDAO.ATTRIBUTE_NAME);
  List<Item> members = membersManager.getAllPublicMembers();

  PartnersManagerDAO partnersManager = (PartnersManagerDAO) session.getServletContext().getAttribute(PartnersManagerDAO.ATTRIBUTE_NAME);
  List<Item> partners = partnersManager.getAllPublicPartners();

  MiscManagerDAO miscManager = (MiscManagerDAO) session.getServletContext().getAttribute(MiscManagerDAO.ATTRIBUTE_NAME);
  List<Item> misc = miscManager.getAllMisc();

  //misc
  //String misc1 = misc.get(0).getContent_ge();
  String misc1 = "bla";

  //other Strings
  String navBar_news = "სიახლეები";
  String navBar_products = "პროდუქცია";
  String navBar_members = "გუნდის წევრები";
  String navBar_partners = "პარტნიორები";
  String navBar_contact = "კონტაქტი";
  String seeAll = "ყველას ნახვა";

  String news_header = "სიახლეები";
  String news_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

  String products_header = "ჩვენი პროდუქცია";
  String products_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

  String members_header = "ჩვენი გუნდის წევრები";
  String members_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

  String partners_header = "ჩვენი პარტნიორები";
  String partners_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

  String contact_header = "დაგვეკონტაქტეთ";
  String contact_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";


  if(lang.equals("rus")){

//      misc1 = misc.get(0).getContent_rus();
      misc1 = "bla";

      navBar_news = "სიახლეები (რუს)";
      navBar_products = "პროდუქცია (რუს)";
      navBar_members = "გუნდის წევრები (რუს)";
      navBar_partners = "პარტნიორები (რუს)";
      navBar_contact = "კონტაქტი (რუს)";
      seeAll = "ყველას ნახვა (რუს)";

      news_header = "სიახლეები (რუს)";
      news_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

      products_header = "ჩვენი პროდუქცია (რუს)";
      products_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

      members_header = "ჩვენი გუნდის წევრები (რუს)";
      members_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

      partners_header = "ჩვენი პარტნიორები (რუს)";
      partners_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

      contact_header = "დაგვეკონტაქტეთ (რუს)";
      contact_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

  } else if(lang.equals("eng")){

//      misc1 = misc.get(0).getContent_eng();
      misc1 = "bla";

      navBar_news = "News";
      navBar_products = "Products";
      navBar_members = "Team Members";
      navBar_partners = "Partners";
      navBar_contact = "Contact";
      seeAll = "See All";

      news_header = "News";
      news_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

      products_header = "Our Products";
      products_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

      members_header = "Our Team Members";
      members_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

      partners_header = "Our Partners";
      partners_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

      contact_header = "Contact Us";
      contact_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

  }
%>

<!--Navigation bar-->
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp">Men<span>tor</span></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#news"><%=navBar_news%></a></li>
        <li><a href="#products"><%=navBar_products%></a></li>
        <li><a href="#faculity-member"><%=navBar_members%></a></li>
        <li><a href="#pricing"><%=navBar_partners%></a></li>
        <li><a href="#contact"><%=navBar_contact%></a></li>
          <%
              String langSwitch = "<li><a href=\"index.jsp?lang=rus\">RUS</a></li>\n" +
                      "        <li><a href=\"index.jsp?lang=eng\">ENG</a></li>";
              if (lang.equals("rus")){
                  langSwitch = "<li><a href=\"index.jsp?lang=geo\">GEO</a></li>\n" +
                          "        <li><a href=\"index.jsp?lang=eng\">ENG</a></li>";
              } else if (lang.equals("eng")){
                  langSwitch = "<li><a href=\"index.jsp?lang=geo\">GEO</a></li>\n" +
                          "        <li><a href=\"index.jsp?lang=eng\">RUS</a></li>";
              }
          %>

          <%=langSwitch%>
      </ul>
    </div>
  </div>
</nav>
<!--/ Navigation bar-->
<!--Banner-->
<div class="banner">
  <div class="bg-color">
    <div class="container">
      <div class="row">
        <div class="banner-text text-center">
          <div class="text-border">
            <h2 class="text-dec">Trust & Quality</h2>
          </div>
          <div class="intro-para text-center quote">
            <p class="big-text">Learning Today . . . Leading Tomorrow.</p>
            <p class="small-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium enim repellat sapiente quos architecto<br>Laudantium enim repellat sapiente quos architecto</p>
            <a href="#footer" class="btn get-quote">GET A QUOTE</a>
          </div>
          <a href="#feature" class="mouse-hover"><div class="mouse"></div></a>
        </div>
      </div>
    </div>
  </div>
</div>
<!--/ Banner-->
<%
    String onclickNews = "allItems.jsp?lang=" + lang + "&type=news";
    String onclickProducts = "allItems.jsp?lang=" + lang + "&type=products";
    String onclickPartners = "allItems.jsp?lang=" + lang + "&type=partners";
    String onclickMembers = "allItems.jsp?lang=" + lang + "&type=members";
%>

<!--News-->
<section id ="news" class="section-padding">
  <div class="container">
    <div class="row">
      <div class="header-section text-center">
        <h2><%=news_header%></h2>
        <p><%=news_subheader%></p>
        <hr class="bottom-line">
    </div>
        <%
            if(newss.size() == 0){
        %>
            სიახლეები არ არის
        <%
            }
            if(newss.size() > 0){
                String n1_name = newss.get(0).getTitle_ge();
                String n1_intro = newss.get(0).getIntro_ge();
                String n1_content = newss.get(0).getContent_ge();
                if(lang.equals("rus")){
                    n1_name = newss.get(0).getTitle_rus();
                    n1_intro = newss.get(0).getIntro_rus();
                    n1_content = newss.get(0).getContent_eng();
                } else if(lang.equals("eng")){
                    n1_name = newss.get(0).getTitle_eng();
                    n1_intro = newss.get(0).getIntro_rus();
                    n1_content = newss.get(0).getContent_eng();
                }
        %>
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="pm-staff-profile-container" >
                        <div class="pm-staff-profile-details text-center">
                            <p class="pm-staff-profile-name"><%=n1_name%></p>
                            <p class="pm-staff-profile-title"><%=n1_intro%></p>
                            <p class="pm-staff-profile-bio"><%=n1_content%> </p>
                        </div>
                    </div>
                </div>
        <%
            }
            if(newss.size() > 1) {
                String n2_name = newss.get(1).getTitle_ge();
                String n2_intro = newss.get(1).getIntro_ge();
                String n2_content = newss.get(1).getContent_ge();
                if (lang.equals("rus")) {
                    n2_name = newss.get(1).getTitle_rus();
                    n2_intro = newss.get(1).getIntro_rus();
                    n2_content = newss.get(1).getContent_eng();
                } else if (lang.equals("eng")) {
                    n2_name = newss.get(1).getTitle_eng();
                    n2_intro = newss.get(1).getIntro_rus();
                    n2_content = newss.get(1).getContent_eng();
                }
        %>
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="pm-staff-profile-container" >
                        <div class="pm-staff-profile-details text-center">
                            <p class="pm-staff-profile-name"><%=n2_name%></p>
                            <p class="pm-staff-profile-title"><%=n2_intro%></p>

                            <p class="pm-staff-profile-bio"><%=n2_content%> </p>
                        </div>
                    </div>
                </div>
        <%
            }
            if(newss.size() > 2) {
                String n3_name = newss.get(2).getTitle_ge();
                String n3_intro = newss.get(2).getIntro_ge();
                String n3_content = newss.get(2).getContent_ge();
                if (lang.equals("rus")) {
                    n3_name = newss.get(2).getTitle_rus();
                    n3_intro = newss.get(2).getIntro_rus();
                    n3_content = newss.get(2).getContent_eng();
                } else if (lang.equals("eng")) {
                    n3_name = newss.get(2).getTitle_eng();
                    n3_intro = newss.get(2).getIntro_rus();
                    n3_content = newss.get(2).getContent_eng();
                }
        %>
            <div class="col-lg-4 col-md-4 col-sm-4">
                <div class="pm-staff-profile-container" >
                    <div class="pm-staff-profile-details text-center">
                        <p class="pm-staff-profile-name"><%=n3_name%></p>
                        <p class="pm-staff-profile-title"><%=n3_intro%></p>
                        <p class="pm-staff-profile-bio"><%=n3_content%></p>
                    </div>
                </div>
            </div>
        <%
            }
        %>
    </div>
      <div class="header-section text-center">
        <a href=<%=onclickNews%>> <%=seeAll%> </a>
      </div>
  </div>
</section>
<!--/ News-->
<!--products-->
<section id="products" class="section-padding" style="background-color: rgb(247, 247, 247);">
  <div class="container">
    <div class="row">
      <div class="header-section text-center">
        <h2><%=products_header%></h2>
        <p><%=products_subheader%></p>
        <hr class="bottom-line">
      </div>

        <%
            if(products.size() == 0){
        %>
        პროდუქტები არ არის
        <%
            }
            if(products.size() > 0){
                String n1_name = products.get(0).getTitle_ge();
                String n1_intro = products.get(0).getIntro_ge();
                String n1_content = products.get(0).getContent_ge();
                if(lang.equals("rus")){
                    n1_name = products.get(0).getTitle_rus();
                    n1_intro = products.get(0).getIntro_rus();
                    n1_content = products.get(0).getContent_eng();
                } else if(lang.equals("eng")){
                    n1_name = products.get(0).getTitle_eng();
                    n1_intro = products.get(0).getIntro_rus();
                    n1_content = products.get(0).getContent_eng();
                }
        %>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="pm-staff-profile-container" >
                <div class="pm-staff-profile-details text-center">
                    <p class="pm-staff-profile-name"><%=n1_name%></p>
                    <p class="pm-staff-profile-title"><%=n1_intro%></p>
                    <p class="pm-staff-profile-bio"><%=n1_content%> </p>
                </div>
            </div>
        </div>
        <%
            }
            if(products.size() > 1) {
                String n2_name = products.get(1).getTitle_ge();
                String n2_intro = products.get(1).getIntro_ge();
                String n2_content = products.get(1).getContent_ge();
                if (lang.equals("rus")) {
                    n2_name = products.get(1).getTitle_rus();
                    n2_intro = products.get(1).getIntro_rus();
                    n2_content = products.get(1).getContent_eng();
                } else if (lang.equals("eng")) {
                    n2_name = products.get(1).getTitle_eng();
                    n2_intro = products.get(1).getIntro_rus();
                    n2_content = products.get(1).getContent_eng();
                }
        %>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="pm-staff-profile-container" >
                <div class="pm-staff-profile-details text-center">
                    <p class="pm-staff-profile-name"><%=n2_name%></p>
                    <p class="pm-staff-profile-title"><%=n2_intro%></p>

                    <p class="pm-staff-profile-bio"><%=n2_content%> </p>
                </div>
            </div>
        </div>
        <%
            }
            if(products.size() > 2) {
                String n3_name = products.get(2).getTitle_ge();
                String n3_intro = products.get(2).getIntro_ge();
                String n3_content = products.get(2).getContent_ge();
                if (lang.equals("rus")) {
                    n3_name = products.get(2).getTitle_rus();
                    n3_intro = products.get(2).getIntro_rus();
                    n3_content = products.get(2).getContent_eng();
                } else if (lang.equals("eng")) {
                    n3_name = products.get(2).getTitle_eng();
                    n3_intro = products.get(2).getIntro_rus();
                    n3_content = products.get(2).getContent_eng();
                }
        %>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="pm-staff-profile-container" >
                <div class="pm-staff-profile-details text-center">
                    <p class="pm-staff-profile-name"><%=n3_name%></p>
                    <p class="pm-staff-profile-title"><%=n3_intro%></p>
                    <p class="pm-staff-profile-bio"><%=n3_content%></p>
                </div>
            </div>
        </div>
        <%
            }
        %>

     </div>
    </div>
   <div class="header-section text-center">
      <a href=<%=onclickProducts%>> <%=seeAll%> </a>
   </div>
  </div>
</section>
<!--/ products-->

<!--members-->
<section id="faculity-member" class="section-padding">
  <div class="container">
    <div class="row">
      <div class="header-section text-center">
        <h2><%=members_header%></h2>
        <p><%=members_subheader%></p>
        <hr class="bottom-line">
      </div>

        <%
            if(members.size() == 0){
        %>
        გუნდის წევრები არ არის
        <%
            }
            if(members.size() > 0){
                String n1_name = members.get(0).getTitle_ge();
                String n1_intro = members.get(0).getIntro_ge();
                String n1_content = members.get(0).getContent_ge();
                if(lang.equals("rus")){
                    n1_name = members.get(0).getTitle_rus();
                    n1_intro = members.get(0).getIntro_rus();
                    n1_content = members.get(0).getContent_eng();
                } else if(lang.equals("eng")){
                    n1_name = members.get(0).getTitle_eng();
                    n1_intro = members.get(0).getIntro_rus();
                    n1_content = members.get(0).getContent_eng();
                }
        %>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="pm-staff-profile-container" >
                <div class="pm-staff-profile-details text-center">
                    <p class="pm-staff-profile-name"><%=n1_name%></p>
                    <p class="pm-staff-profile-title"><%=n1_intro%></p>
                    <p class="pm-staff-profile-bio"><%=n1_content%> </p>
                </div>
            </div>
        </div>
        <%
            }
            if(members.size() > 1) {
                String n2_name = members.get(1).getTitle_ge();
                String n2_intro = members.get(1).getIntro_ge();
                String n2_content = members.get(1).getContent_ge();
                if (lang.equals("rus")) {
                    n2_name = members.get(1).getTitle_rus();
                    n2_intro = members.get(1).getIntro_rus();
                    n2_content = members.get(1).getContent_eng();
                } else if (lang.equals("eng")) {
                    n2_name = members.get(1).getTitle_eng();
                    n2_intro = members.get(1).getIntro_rus();
                    n2_content = members.get(1).getContent_eng();
                }
        %>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="pm-staff-profile-container" >
                <div class="pm-staff-profile-details text-center">
                    <p class="pm-staff-profile-name"><%=n2_name%></p>
                    <p class="pm-staff-profile-title"><%=n2_intro%></p>

                    <p class="pm-staff-profile-bio"><%=n2_content%> </p>
                </div>
            </div>
        </div>
        <%
            }
            if(members.size() > 2) {
                String n3_name = members.get(2).getTitle_ge();
                String n3_intro = members.get(2).getIntro_ge();
                String n3_content = members.get(2).getContent_ge();
                if (lang.equals("rus")) {
                    n3_name = members.get(2).getTitle_rus();
                    n3_intro = members.get(2).getIntro_rus();
                    n3_content = members.get(2).getContent_eng();
                } else if (lang.equals("eng")) {
                    n3_name = members.get(2).getTitle_eng();
                    n3_intro = members.get(2).getIntro_rus();
                    n3_content = members.get(2).getContent_eng();
                }
        %>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="pm-staff-profile-container" >
                <div class="pm-staff-profile-details text-center">
                    <p class="pm-staff-profile-name"><%=n3_name%></p>
                    <p class="pm-staff-profile-title"><%=n3_intro%></p>
                    <p class="pm-staff-profile-bio"><%=n3_content%></p>
                </div>
            </div>
        </div>
        <%
            }
        %>

      </div>
    </div>
  <div class="header-section text-center">
      <a href=<%=onclickMembers%>> <%=seeAll%> </a>
  </div>
  </div>
</section>
<!--/ Members -->

<!--Partners-->
<section id ="pricing" class="section-padding">
  <div class="container">
    <div class="row">
      <div class="header-section text-center">
        <h2><%=partners_header%></h2>
        <p><%=partners_subheader%></p>
        <hr class="bottom-line">
      </div>

        <%
            if(partners.size() == 0){
        %>
        პარტნიორები არ არის
        <%
            }
            if(partners.size() > 0){
                String n1_name = partners.get(0).getTitle_ge();
                String n1_intro = partners.get(0).getIntro_ge();
                String n1_content = partners.get(0).getContent_ge();
                if(lang.equals("rus")){
                    n1_name = partners.get(0).getTitle_rus();
                    n1_intro = partners.get(0).getIntro_rus();
                    n1_content = partners.get(0).getContent_eng();
                } else if(lang.equals("eng")){
                    n1_name = partners.get(0).getTitle_eng();
                    n1_intro = partners.get(0).getIntro_rus();
                    n1_content = partners.get(0).getContent_eng();
                }
        %>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="pm-staff-profile-container" >
                <div class="pm-staff-profile-details text-center">
                    <p class="pm-staff-profile-name"><%=n1_name%></p>
                    <p class="pm-staff-profile-title"><%=n1_intro%></p>
                    <p class="pm-staff-profile-bio"><%=n1_content%> </p>
                </div>
            </div>
        </div>
        <%
            }
            if(partners.size() > 1) {
                String n2_name = partners.get(1).getTitle_ge();
                String n2_intro = partners.get(1).getIntro_ge();
                String n2_content = partners.get(1).getContent_ge();
                if (lang.equals("rus")) {
                    n2_name = partners.get(1).getTitle_rus();
                    n2_intro = partners.get(1).getIntro_rus();
                    n2_content = partners.get(1).getContent_eng();
                } else if (lang.equals("eng")) {
                    n2_name = partners.get(1).getTitle_eng();
                    n2_intro = partners.get(1).getIntro_rus();
                    n2_content = partners.get(1).getContent_eng();
                }
        %>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="pm-staff-profile-container" >
                <div class="pm-staff-profile-details text-center">
                    <p class="pm-staff-profile-name"><%=n2_name%></p>
                    <p class="pm-staff-profile-title"><%=n2_intro%></p>

                    <p class="pm-staff-profile-bio"><%=n2_content%> </p>
                </div>
            </div>
        </div>
        <%
            }
            if(partners.size() > 2) {
                String n3_name = partners.get(2).getTitle_ge();
                String n3_intro = partners.get(2).getIntro_ge();
                String n3_content = partners.get(2).getContent_ge();
                if (lang.equals("rus")) {
                    n3_name = partners.get(2).getTitle_rus();
                    n3_intro = partners.get(2).getIntro_rus();
                    n3_content = partners.get(2).getContent_eng();
                } else if (lang.equals("eng")) {
                    n3_name = partners.get(2).getTitle_eng();
                    n3_intro = partners.get(2).getIntro_rus();
                    n3_content = partners.get(2).getContent_eng();
                }
        %>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="pm-staff-profile-container" >
                <div class="pm-staff-profile-details text-center">
                    <p class="pm-staff-profile-name"><%=n3_name%></p>
                    <p class="pm-staff-profile-title"><%=n3_intro%></p>
                    <p class="pm-staff-profile-bio"><%=n3_content%></p>
                </div>
            </div>
        </div>
        <%
            }
        %>

    </div>
      <div class="header-section text-center">
          <a href=<%=onclickPartners%>> <%=seeAll%> </a>
      </div>
  </div>
</section>
<!--/ Partners-->
<!--Contact-->
<section id ="contact" class="section-padding">
  <div class="container">
    <div class="row">
      <div class="header-section text-center">
         <h2><%=contact_header%></h2>
         <p><%=contact_subheader%></p>
         <hr class="bottom-line">
      </div>
      <div id="sendmessage">Your message has been sent. Thank you!</div>
      <div id="errormessage"></div>
      <form action="" method="post" role="form" class="contactForm">
        <div class="col-md-6 col-sm-6 col-xs-12 left">
          <div class="form-group">
            <input type="text" name="name" class="form-control form" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
            <div class="validation"></div>
          </div>
          <div class="form-group">
            <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
            <div class="validation"></div>
          </div>
          <div class="form-group">
            <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
            <div class="validation"></div>
          </div>
        </div>

        <div class="col-md-6 col-sm-6 col-xs-12 right">
          <div class="form-group">
            <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
            <div class="validation"></div>
          </div>
        </div>

        <div class="col-xs-12">
          <!-- Button -->
          <button type="submit" id="submit" name="submit" class="form contact-form-button light-form-button oswald light">SEND EMAIL</button>
        </div>
      </form>

    </div>
  </div>
</section>
<!--/ Contact-->
<!--Footer-->
<footer id="footer" class="footer">
  <div class="container text-center">

    <h3>Start Your Free Trial Now!</h3>

    <form class="mc-trial row">
      <div class="form-group col-md-3 col-md-offset-2 col-sm-4">
        <div class=" controls">
          <input name="name" placeholder="Enter Your Name" class="form-control" type="text">
        </div>
      </div><!-- End email input -->
      <div class="form-group col-md-3 col-sm-4">
        <div class=" controls">
          <input name="EMAIL" placeholder="Enter Your email" class="form-control" type="email">
        </div>
      </div><!-- End email input -->
      <div class="col-md-2 col-sm-4">
        <p>
          <button name="submit" type="submit" class="btn btn-block btn-submit">
            Submit <i class="fa fa-arrow-right"></i></button>
        </p>
      </div>
    </form><!-- End newsletter-form -->
    <ul class="social-links">
      <li><a href="#link"><i class="fa fa-twitter fa-fw"></i></a></li>
      <li><a href="#link"><i class="fa fa-facebook fa-fw"></i></a></li>
      <li><a href="#link"><i class="fa fa-google-plus fa-fw"></i></a></li>
      <li><a href="#link"><i class="fa fa-dribbble fa-fw"></i></a></li>
      <li><a href="#link"><i class="fa fa-linkedin fa-fw"></i></a></li>
    </ul>
    ©2016 Mentor Theme. All rights reserved
    <div class="credits">
      <!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Mentor
      -->
      Designed by <a href="https://bootstrapmade.com/">Free Bootstrap Themes</a>
    </div>
  </div>
</footer>
<!--/ Footer-->

<script src="js/jquery.min.js"></script>
<script src="js/jquery.easing.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/custom.js"></script>
<script src="contactform/contactform.js"></script>

</body>
</html>
