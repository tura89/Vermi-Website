<%@ page import="Vermi.model.Item" %>
<%@ page import="Vermi.manager.dao.*" %><%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 10/26/2017
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page pageEncoding="UTF-8" %>

<html>

<head>
    <title>Edit Item</title>
    <script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Candal|Alegreya+Sans">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/imagehover.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }

        li {
            float: left;
        }

        li a {
            display: inline-block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover {
            background-color: #111;
        }

        .tabcontent1 {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }

        .tabcontent2 {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }

        .tabcontent3 {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }

        .tabcontent4 {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }

        .tabcontent5 {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }
    </style>
</head>

<script type="text/javascript">
    <!--
    function openNews(evt, newsName) {
        // Declare all variables
        var i, tabcontent, tablinks;

        // Get all elements with class="tabcontent" and hide them
        tabcontent = document.getElementsByClassName("tabcontent1");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }

        // Get all elements with class="tablinks" and remove the class "active"
        tablinks = document.getElementsByClassName("tablinks1");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }

        // Show the current tab, and add an "active" class to the button that opened the tab
        document.getElementById(newsName).style.display = "block";
        evt.currentTarget.className += " active";
    }

    function displayNews() {
        openNews(event, 'news-geo');
    }

    //-->
</script>

<body onload="displayNews()">
<<!-->

<%
    String itemType = request.getParameter("itemType");
    Integer itemId = Integer.valueOf( request.getParameter("itemId").substring(0, request.getParameter("itemId").length()-1));
    Item item = null;

    if(itemType.equals("news")){
        NewsManagerDAO newsManager = (NewsManagerDAO) session.getServletContext().getAttribute(NewsManagerDAO.ATTRIBUTE_NAME);
        item = newsManager.getNews(itemId);
    } else if(itemType.equals("product")){
        ProductsManagerDAO productsManager = (ProductsManagerDAO) session.getServletContext().getAttribute(ProductsManagerDAO.ATTRIBUTE_NAME);
        item = productsManager.getProduct(itemId);
    } else if(itemType.equals("member")){
        MembersManagerDAO membersManager = (MembersManagerDAO) session.getServletContext().getAttribute(MembersManagerDAO.ATTRIBUTE_NAME);
        item = membersManager.getMember(itemId);
    } else if(itemType.equals("partner")){
        PartnersManagerDAO partnersManager = (PartnersManagerDAO) session.getServletContext().getAttribute(PartnersManagerDAO.ATTRIBUTE_NAME);
        item = partnersManager.getPartner(itemId);
    } else if(itemType.equals("misc")){
        MiscManagerDAO miscManager = (MiscManagerDAO) session.getServletContext().getAttribute(MiscManagerDAO.ATTRIBUTE_NAME);
        item =miscManager.getMisc(itemId);
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
            <a class="navbar-brand" href="index.jsp">Admin<span> panel</span></a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="displayItems.jsp"> Display Items </a></li>
            </ul>
        </div>
    </div>
</nav>
<!--/ Navigation bar-->

<!-- NEWS -->
<div id="news-div" style="margin: 30px">
    <form id="news-form" action="${pageContext.request.contextPath}/ChangeItem" method="post" accept-charset="UTF-8">

        <ul>
            <li><a class="tablinks1" onclick="openNews(event, 'news-geo')"> Geo </a></li>
            <li><a class="tablinks1" onclick="openNews(event, 'news-rus')"> Rus </a></li>
            <li><a class="tablinks1" onclick="openNews(event, 'news-eng')"> Eng </a></li>
        </ul>
        <input type="hidden" name="htmlFormName" value="<%=itemType + "-form"%>"/>
        <input type="hidden" name="itemType" value="<%=itemType%>"/>
        <input type="hidden" name="itemId" value="<%=itemId%>"/>
        <div id="news-geo" class="tabcontent1">
            <input name="title-g" class = "textInput" placeholder="News Title GEO" value="<%=item.getTitle_ge()%>" id = "nTitleG" /> </br>
            <input name="intro-g" class = "textInput" placeholder="News Intro GEO" value="<%=item.getIntro_ge()%>" id = "nIntroG" /> </br>
            <textarea name="content-g" form="news-form" class = "textInput htmlClass" id = "nContentG" placeholder="Content Geo">  <%=item.getContent_ge()%> </textarea> </br>
            <input name="keywords-g" class = "textInput" placeholder="News Keywords GEO" id = "nKeywordsG" value="<%=item.getKeywords_ge()%>"/> </br>
            <input name="description-g" class = "textInput" placeholder="News Description GEO" id = "nDescriptionG" value="<%=item.getDescription_ge()%>"/> </br>
            <script>
                CKEDITOR.replace( 'content-g' );
            </script>
        </div>
        <div id="news-rus" class="tabcontent1">
            <input name="title-r" class = "textInput" placeholder="News Title RUS" id = "nTitleR" value="<%=item.getTitle_rus()%>"/> </br>
            <input name="intro-r" class = "textInput" placeholder="News Intro RUS" id = "nIntroR" value="<%=item.getIntro_rus()%>"/> </br>
            <textarea name="content-r" form="news-form" class = "textInput htmlClass" id = "nContentR"> <%=item.getContent_rus()%> </textarea></br>
            <input name="keywords-r" class = "textInput" placeholder="News Keywords RUS" id = "nKeywordsR" value="<%=item.getKeywords_rus()%>"/> </br>
            <input name="description-r" class = "textInput" placeholder="News Description RUS" id = "nDescriptionR" value="<%=item.getDescription_rus()%>"/> </br>
            <script>
                CKEDITOR.replace( 'content-r' );
            </script>
        </div>
        <div id="news-eng" class="tabcontent1">
            <input name="title-e" class = "textInput" placeholder="News Title ENG" id = "nTitleE" value="<%=item.getTitle_eng()%>"/> </br>
            <input name="intro-e" class = "textInput" placeholder="News Intro ENG" id = "nIntroE" value="<%=item.getIntro_eng()%>"/> </br>
            <textarea name="content-e" form="news-form" class = "textInput htmlClass" id = "nContentE" > <%=item.getContent_eng()%> </textarea></br>
            <input name="keywords-e" class = "textInput" placeholder="News Keywords ENG" id = "nKeywordsE" value="<%=item.getKeywords_eng()%>"/> </br>
            <input name="description-e" class = "textInput" placeholder="News Description ENG" id = "nDescriptionE" value="<%=item.getDescription_eng()%>"/> </br>
            <script>
                CKEDITOR.replace( 'content-e' );
            </script>
        </div>

        <p>Created at: <%=item.getCreatedDate()%></p>

        Input an integer: </br>
        <input name="weight" placeholder="News weight" id = "Weight"  value="<%=item.getWeight()%>"/> </br>

        <input type="checkbox" name="isPublic" value="IsPublic"> make public </br>

        <button onclick="document.getElementById('news-form').submit();"> Submit </button>
    </form>
    <form id="news-delete" action="${pageContext.request.contextPath}/deleteItem" method="post" accept-charset="UTF-8">
        <input type="hidden" name="htmlFormName" value="<%=itemType + "-form"%>"/>
        <input type="hidden" name="itemType" value="<%=itemType%>"/>
        <input type="hidden" name="itemId" value="<%=itemId%>"/>
        <button onclick="document.getElementById('news-delete').submit();"> Delete </button>
    </form>

    <form id="news-remove" action="${pageContext.request.contextPath}/removeItem" method="post" accept-charset="UTF-8">
        <input type="hidden" name="htmlFormName" value="<%=itemType + "-form"%>"/>
        <input type="hidden" name="itemType" value="<%=itemType%>"/>
        <input type="hidden" name="itemId" value="<%=itemId%>"/>
        <button onclick="document.getElementById('news-remove').submit();"> Remove </button>
    </form>

</div>
<!--/ NEWS -->

</body>

</html>
