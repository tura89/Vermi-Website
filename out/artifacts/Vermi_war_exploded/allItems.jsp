<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 11/28/2017
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="Vermi.manager.dao.*" %>
<%@ page import="Vermi.model.Item" %>
<%@ page import="java.util.List" %>
<%--
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
    String type = request.getParameter("type");
    if(lang == null || lang.isEmpty() || ( !lang.equals("geo") && !lang.equals("rus") && !lang.equals("eng"))){
        String redirectURL = "allItems.jsp?lang=geo&type=" + type;
        response.sendRedirect(redirectURL);
        return;
    }

    if(type == null || type.isEmpty() || (!type.equals("news") && !type.equals("products") && !type.equals("partners") && !type.equals("members"))){
        String redirectURL = "allItems.jsp?lang=" + lang + "&type=news";
        response.sendRedirect(redirectURL);
        return;
    }


    ProductsManagerDAO ProductsManager = (ProductsManagerDAO) session.getServletContext().getAttribute(ProductsManagerDAO.ATTRIBUTE_NAME);

    NewsManagerDAO newsManager = (NewsManagerDAO) session.getServletContext().getAttribute(NewsManagerDAO.ATTRIBUTE_NAME);

    MembersManagerDAO membersManager = (MembersManagerDAO) session.getServletContext().getAttribute(MembersManagerDAO.ATTRIBUTE_NAME);

    PartnersManagerDAO partnersManager = (PartnersManagerDAO) session.getServletContext().getAttribute(PartnersManagerDAO.ATTRIBUTE_NAME);

    MiscManagerDAO miscManager = (MiscManagerDAO) session.getServletContext().getAttribute(MiscManagerDAO.ATTRIBUTE_NAME);
    List<Item> items = newsManager.getAllNews();

    //misc
    //String misc1 = misc.get(0).getContent_ge();
    String misc1 = "bla";

    //other Strings
    String goBack = "უკან";

    String navBar_news = "სიახლეები";
    String navBar_contact = "კონტაქტი";

    String news_header = "სიახლეები";
    String news_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

    String contact_header = "დაგვეკონტაქტეთ";
    String contact_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

    if(lang.equals("rus")){
        navBar_news = "სიახლეები (რუს)";
        navBar_contact = "კონტაქტი (რუს)";

        news_header = "სიახლეები (რუს)";
        news_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

        contact_header = "Contact Us";
        contact_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

        goBack = "უკან (რუს)";

    } else if(lang.equals("eng")){
        navBar_news = "News";
        navBar_contact = "Contact";

        news_header = "News";
        news_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

        contact_header = "Contact Us";
        contact_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";

        goBack = "back";
    }

    if (type.equals("products")){
        items = ProductsManager.getAllProducts();

        navBar_news = "პროდუქტები";
        news_header = "პროდუქტები";
        news_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";
        if(lang.equals("rus")){
            navBar_news = "პროდუქტები (რუს)";
            news_header = "პროდუქტები (რუს)";
            news_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";
        } else if(lang.equals("eng")){
            navBar_news = "Products";
            news_header = "Products";
            news_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";
        }
    } else if (type.equals("partners")){
        items = partnersManager.getAllPartners();

        navBar_news = "პარტნიორები";
        news_header = "პარტნიორები";
        news_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";
        if(lang.equals("rus")){
            navBar_news = "პარტნიორები (რუს)";
            news_header = "პარტნიორები (რუს)";
            news_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";
        } else if(lang.equals("eng")){
            navBar_news = "Partners";
            news_header = "Partners";
            news_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";
        }
    } else if (type.equals("members")){
        items = membersManager.getAllMembers();

        navBar_news = "გუნდის წევრები";
        news_header = "გუნდის წევრები";
        news_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";
        if(lang.equals("rus")){
            navBar_news = "გუნდის წევრები (რუს)";
            news_header = "გუნდის წევრები (რუს)";
            news_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";
        } else if(lang.equals("eng")){
            navBar_news = "Team Members";
            news_header = "Team Members";
            news_subheader = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.";
        }
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
                <li><a href="#contact"><%=navBar_contact%></a></li>
                <%
                    String langSwitch = "<li><a href=\"allItems.jsp?lang=rus&type=" + type + "\">RUS</a></li>\n" +
                            "        <li><a href=\"allItems.jsp?lang=eng&type=" + type + "\">ENG</a></li>";
                    if (lang.equals("rus")){
                        langSwitch = "<li><a href=\"allItems.jsp?lang=geo&type=" + type + "\">GEO</a></li>\n" +
                                "        <li><a href=\"allItems.jsp?lang=eng&type=" + type + "\">ENG</a></li>";
                    } else if (lang.equals("eng")){
                        langSwitch = "<li><a href=\"allItems.jsp?lang=geo&type=" + type + "\">GEO</a></li>\n" +
                                "        <li><a href=\"allItems.jsp?lang=eng&type=" + type + "\">RUS</a></li>";
                    }

                    String homePage = "#index.jsp?lang=?" + lang;
                %>

                <%=langSwitch%>
                <li><a href=<%=homePage%>><%=goBack%></a></li>
            </ul>
        </div>
    </div>
</nav>
<!--/ Navigation bar-->

<!--News-->
<section id ="news" class="section-padding">
    <div class="container">

        <div class="header-section text-center">
            <h2><%=news_header%></h2>
            <p><%=news_subheader%></p>
            <hr class="bottom-line">
        </div>

        <%
            for(int i=0; i<items.size(); i+=3){
        %>
            <div class="row">

                <%
                    for(int j=i; j<i+3;j++){
                        if (j >= items.size())
                            break;

                        String title = items.get(j).getTitle_ge();
                        String intro = items.get(j).getIntro_ge();
                        String content = items.get(j).getContent_ge();
                        if(lang.equals("rus")){
                            title = items.get(j).getTitle_rus();
                            intro = items.get(j).getIntro_rus();
                            content = items.get(j).getContent_rus();
                        } else if(lang.equals("eng")){
                            title = items.get(j).getTitle_eng();
                            intro = items.get(j).getIntro_eng();
                            content = items.get(j).getContent_eng();
                        }
                %>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="pm-staff-profile-container" >
                            <div class="pm-staff-profile-details text-center">
                                <p class="pm-staff-profile-name"> <%=title%> </p>
                                <p class="pm-staff-profile-title"> <%=intro%> </p>
                                <p class="pm-staff-profile-bio"> <%=content%> </p>
                            </div>
                        </div>
                    </div>
                <%
                    }
                %>
            </div>

        <%
            }
        %>

    </div>
</section>
<!--/ News-->

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
