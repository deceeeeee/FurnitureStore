<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log OUT</title>
</head>
<body>
	<%
	
		Cookie cookie = null;
	    Cookie[] cookies = null;
	    	
		session.invalidate();
		
	    cookies = request.getCookies();
	    
	    if( cookies != null ) {
	    	
	    	for (int i = 0; i < cookies.length; i++) {
	    		
	    		cookie = cookies[i];
		        cookie.setMaxAge(0);
	    		
	    	}
	   	     
	    }

	    response.sendRedirect("index.jsp");
	%>
	
</body>
</html>
