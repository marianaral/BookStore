<%@page import="Model.Cart"%>
<%@page import="Model.Book"%>
<%@page import="Model.Catalogue"%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">        
        <title>BookStore MNA</title>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>      
        <div class="bookContainer">
            <% for (Book book : Catalogue.getInstance().getCatalogue()) { %>
            <div class="book">
                <h3><%= book.getTitle() %></h3>
                <p><%= book.getPrice() %>€</p>
                <div class="buttonContainer">
                    <form action="FrontServlet" method="GET">
                       <input type="hidden" value="<%= book.getIsbn() %>" name="productIsbn" />
                       <input type="hidden" value="AddToCart" name="command"/>
                       <input class="submitButton" type="submit" value="Add book to Cart"/>
                   </form>
                   <form action="FrontServlet" method="GET">
                       <input type="hidden" value="<%= book.getIsbn() %>" name="productIsbn" />
                       <input type="hidden" value="AddToWishList" name="command"/>
                       <input class="submitButton" type="submit" value="Add book to Wishlist"/>
                   </form>   
                </div>
                
            </div>
            <% } %>
        </div>


    </body>
</html>

    
   
            

