<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">        
        <title>BookStore MNA</title>
    </head>
    <body>
         <header>
            <div id="companyName"><a href="${pageContext.request.contextPath}/HomePage.jsp">
                <h1>BookStore Maria Naranjo Almeida</h1>
            </a></div>
                <div class="iconContainer">
                <p><a href="${pageContext.request.contextPath}/CartPage.jsp">
                    <img src="${pageContext.request.contextPath}/media/shopping-cart2.svg" class="icon"  alt="shopping cart icon">
                </a></p>
                <p><a href="${pageContext.request.contextPath}/WishListPage.jsp">
                    <img src="${pageContext.request.contextPath}/media/wish_list_icon.svg" class="icon"  alt="wishlist icon">
                </a></p>
            </div>    
        </header>  
    </body>
</html>
