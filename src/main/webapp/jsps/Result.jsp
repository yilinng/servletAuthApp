<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Servlet-JSP Integration</title>
</head>
<body>
    <h2>Dynamic Content from Servlet</h2>
    <p>
        <% 
            // Access attribute set by the servlet
            String message = (String) request.getAttribute("message");
            out.println(message);
        %>
    </p>
</body>
</html>