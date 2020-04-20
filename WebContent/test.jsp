<%@ page import="ecommerce.Test" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"                                                    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
<%Test t = new Test(1,2,"resources/image/Capture.PNG"); %>
<img src="<%= t.getImg() %>" width="113" height="223"/>
</html> 