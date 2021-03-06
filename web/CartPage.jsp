<%@page import="Model.Catalogue"%>
<%@page import="Model.Book"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
    if(session.getAttribute("shoppingCart") == null){ 
               session.setAttribute("shoppingCart", new Cart());
   }
</jsp:scriptlet>
<% Cart cart = (Cart) session.getAttribute("shoppingCart");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your cart</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">        
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>  
        <div class="contentContainer">
            <h2>Your cart</h2>
            <% if (cart.getCartList().size() == 0) { %>
            <p>Your cart is empty. Got to our <a href="${pageContext.request.contextPath}/HomePage.jsp">catalogue</a> to explore our books</p>
            <% } else { %>
                <div class="bookContainer">
                    <% for (String isbn : cart.getCartList().keySet()) { %>
                        <% Book book = Catalogue.getInstance().find(isbn); %>
                        <div class="book">
                            <h3><%= book.getTitle() %></h3>
                            <div class="modifyQuantity">
                                <form action="FrontServlet" method="GET">
                                    <input type="hidden" value="<%= isbn %>" name="productIsbn" />
                                    <input type="hidden" value="IncreaseQuantity" name="command"/>
                                    <input class="submitButton" type="submit" value="+"/>
                                </form>
                                <p><%= cart.getCartList().get(isbn) %></p>
                                <form action="FrontServlet" method="GET">
                                    <input type="hidden" value="<%= isbn %>" name="productIsbn" />
                                    <input type="hidden" value="DecreaseQuantity" name="command"/>
                                    <input class="submitButton" type="submit" value="-"/>
                                </form>
                            </div>
                            <div class="bottomBookContainer">
                                <p><%= book.getPrice() %>???</p>
                                <form action="FrontServlet" method="GET">
                                    <input type="hidden" value="<%= isbn %>" name="productIsbn" />
                                    <input type="hidden" value="DeleteFromCart" name="command"/>
                                    <input class="submitButton" type="submit" value="X"/>
                                </form>  
                            </div>
                        </div>
                    <% } %>
                </div>
                <p><a href="${pageContext.request.contextPath}/HomePage.jsp"><button  class="submitButton">Go back to catalog</button></a></p>
                <form action="FrontServlet" method="GET">
                    <input type="hidden" value="FinishPurchase" name="command"/>
                    <input class="submitButton" type="submit" value="Finish purchase"/>
                </form>   
            <% } %> 
        </div>
        
    </body>
</html>
