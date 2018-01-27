<%@ page import="Vermi.model.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="Vermi.manager.dao.*" %>
<%--
  Created by IntelliJ IDEA.
  User: alex
  Date: 18/09/17
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page pageEncoding="UTF-8" %>

<html>

<head>
    <title>Admin Panel</title>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Candal|Alegreya+Sans">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/imagehover.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <style>
        #itemBar{
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
    </style>
</head>

<body onload="listNews()">
    <%
        String logged = (String) session.getAttribute("logged");
        if (logged == null || !logged.equals("true")){
            session.setAttribute("message", "Please Log In");
            response.sendRedirect("adminLogin.jsp");
        }

        NewsManagerDAO newsManager = (NewsManagerDAO) session.getServletContext().getAttribute(NewsManagerDAO.ATTRIBUTE_NAME);
        ProductsManagerDAO productsManager = (ProductsManagerDAO) session.getServletContext().getAttribute(ProductsManagerDAO.ATTRIBUTE_NAME);
        MembersManagerDAO membersManager = (MembersManagerDAO) session.getServletContext().getAttribute(MembersManagerDAO.ATTRIBUTE_NAME);
        PartnersManagerDAO partnersManager = (PartnersManagerDAO) session.getServletContext().getAttribute(PartnersManagerDAO.ATTRIBUTE_NAME);
        MiscManagerDAO miscManager = (MiscManagerDAO) session.getServletContext().getAttribute(MiscManagerDAO.ATTRIBUTE_NAME);
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
                <a class="navbar-brand">Admin<span> panel</span></a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.jsp">Visit Site</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!--/ Navigation bar-->

    <ul style="margin-top: 60px" class="itemBar">
        <li><a onclick="listNews()">News</a></li>
        <li><a onclick="listProducts()">Products</a></li>
        <li><a onclick="listMembers()">Members</a></li>
        <li><a onclick="listPartners()">Partners</a></li>
        <li><a onclick="listMisc()">Misc</a></li>
    </ul>

    <div id="list-space" style="margin: 30px">

    </div>

    <!-- news -->
    <div id="news-list" style="visibility: hidden">
        <p class="tb" style="text-align:center; position:relative; top:15px; margin-bottom: 30px;"> Your News  -  <a href="additem.jsp?itemType=news">add New</a></p>
        <%List<Item> newss = newsManager.getAllNews();
            for (Item news : newss) { %>
                <form id=<%="n" + news.getID() %>  action="${pageContext.request.contextPath}/editItem" method="post" accept-charset="UTF-8" style="margin: 50px">
                    News Description: </br> <%=news.toString()%>  </br>
                    <input type="hidden" name="itemType" value="news"/>
                    <input type="hidden" name="itemId" value=<%=news.getID()%>/>
                    <button onclick="document.getElementById(<%="n" + news.getID() %>).submit();"> Edit </button>
                </form>
            <%}%>
    </div>

    <!-- products -->
    <div id="product-list" style="visibility: hidden">
        <p class="tb" style="text-align:center; position:relative; top:15px; margin-bottom: 30px;"> Your Products  -  <a href="additem.jsp?itemType=product">add New</a> </p>
        <%List<Item> products = productsManager.getAllProducts();
            for (Item product : products) { %>
                <form id=<%="n" + product.getID() %>  action="${pageContext.request.contextPath}/editItem" method="post" accept-charset="UTF-8" style="margin: 50px">
                    Product Description: </br> <%=product.toString()%>  </br>
                    <input type="hidden" name="itemType" value="product"/>
                    <input type="hidden" name="itemId" value=<%=product.getID()%>/>
                    <button onclick="document.getElementById(<%="n" + product.getID() %>).submit();"> Edit </button>
                </form>
        <%}%>
    </div>

    <!-- members -->
    <div id="member-list" style="visibility: hidden">
        <p class="tb" style="text-align:center; position:relative; top:15px; margin-bottom: 30px;"> Your Members  -  <a href="additem.jsp?itemType=members">add New</a> </p>
        <%List<Item> members = membersManager.getAllMembers();
            for (Item member : members) { %>
                <form id=<%="n" + member.getID() %>  action="${pageContext.request.contextPath}/editItem" method="post" accept-charset="UTF-8" style="margin: 50px">
                    Member Description: </br> <%=member.toString()%>  </br>
                    <input type="hidden" name="itemType" value="member"/>
                    <input type="hidden" name="itemId" value=<%=member.getID()%>/>
                    <button onclick="document.getElementById(<%="n" + member.getID() %>).submit();"> Edit </button>
                </form>
        <%}%>
    </div>

    <!-- partners -->
    <div id="partner-list" style="visibility: hidden">
        <p class="tb" style="text-align:center; position:relative; top:15px; margin-bottom: 30px;"> Your Partners  -  <a href="additem.jsp?itemType=partner">add New</a> </p>
        <%List<Item> partners = partnersManager.getAllPartners();
            for (Item partner : partners) { %>
                <form id=<%="n" + partner.getID() %>  action="${pageContext.request.contextPath}/editItem" method="post" accept-charset="UTF-8" style="margin: 50px">
                    News Description: </br> <%=partner.toString()%>  </br>
                    <input type="hidden" name="itemType" value="partner"/>
                    <input type="hidden" name="itemId" value=<%=partner.getID()%>/>
                    <button onclick="document.getElementById(<%="n" + partner.getID() %>).submit();"> Edit </button>
                </form>
        <%}%>
    </div>

    <!-- misc -->
    <div id="misc-list" style="visibility: hidden">
        <p class="tb" style="text-align:center; position:relative; top:15px; margin-bottom: 30px;"> Your Misc Items  -  <a href="additem.jsp?itemType=misc">add New</a> </p>
        <%List<Item> miscs = miscManager.getAllMisc();
            for (Item misc : miscs) { %>
                <form id=<%="n" + misc.getID() %>  action="${pageContext.request.contextPath}/editItem" method="post" accept-charset="UTF-8" style="margin: 50px">
                    News Description: </br> <%=misc.toString()%>  </br>
                    <input type="hidden" name="itemType" value="misc"/>
                    <input type="hidden" name="itemId" value=<%=misc.getID()%>/>
                    <button onclick="document.getElementById(<%="n" + misc.getID() %>).submit();"> Edit </button>
                </form>
        <%}%>
    </div>

    <script type="text/javascript">
        function listNews(){
            //a comment
            document.getElementById("list-space").innerHTML = document.getElementById("news-list").innerHTML;
        }
        function listProducts(){
            document.getElementById("list-space").innerHTML = document.getElementById("product-list").innerHTML;
        }
        function listMembers(){
            document.getElementById("list-space").innerHTML = document.getElementById("member-list").innerHTML;
        }
        function listPartners(){
            document.getElementById("list-space").innerHTML = document.getElementById("partner-list").innerHTML;
        }
        function listMisc(){
            document.getElementById("list-space").innerHTML = document.getElementById("misc-list").innerHTML;
        }
    </script>

</body>
</html>