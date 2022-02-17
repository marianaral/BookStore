<%@page import="Model.Wishlist"%>
<%@page import="Model.Catalogue"%>
<%@page import="Model.Book"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
    if(session.getAttribute("shoppingCart") == null){ 
               session.setAttribute("shoppingCart", new Cart());
   }
   if(session.getAttribute("wishList") == null){ 
               session.setAttribute("wishList", new Wishlist());
   }
</jsp:scriptlet>
<% Cart cart = (Cart) session.getAttribute("shoppingCart");%>
<% Wishlist wishList = (Wishlist) session.getAttribute("wishList");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your wish list</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">        

    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>  
        <div class="contentContainer">
            <h2>Your wish list</h2>
            <% if (wishList.getWishList().size() == 0) { %>
            <p>Your wish list is empty. Got to our <a href="${pageContext.request.contextPath}/HomePage.jsp">catalogue</a> to explore our books</p>
            <% } else { %>
                <div class="bookContainer">
                    <% for (String isbn : wishList.getWishList().keySet()) { %>
                        <% Book book = Catalogue.getInstance().find(isbn); %>
                        <div class="book">
                            <h3><%= book.getTitle() %></h3>
                            <div class="modifyQuantity">
                                
                                <p><%= wishList.getWishList().get(isbn) %></p>
                                
                            </div>
                            <div class="bottomBookContainer">
                                <p><%= book.getPrice() %>€</p>
                                 <form action="FrontServlet" method="GET">
                                    <input type="hidden" value="<%= isbn %>" name="productIsbn" />
                                    <input type="hidden" value="AddFromWishListToCart" name="command"/>
                                    <input class="submitButton" type="submit" value="Add item to Cart"/>
                                </form>  
                                <form action="FrontServlet" method="GET">
                                    <input type="hidden" value="<%= isbn %>" name="productIsbn" />
                                    <input type="hidden" value="DeleteFromWishList" name="command"/>
                                    <input class="submitButton" type="submit" value="X"/>
                                </form>  
                            </div>
                        </div>
                    <% } %>
                </div>
                <p><a href="${pageContext.request.contextPath}/HomePage.jsp"><button  class="submitButton">Go back to catalog</button></a></p>  
            <% } %> 
        </div>
    </body>
</html>
