<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    Object total = request.getAttribute("total"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thank you</title>

    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>   
        <div class="contentContainer">
            <h2>Thank you for your purchase</h2>
            <p>To explore more book, go to our <a href="${pageContext.request.contextPath}/HomePage.jsp">catalogue</a></p>
            <p>Total: <%= total %></p>
        </div>
        
        
    </body>
</html>
