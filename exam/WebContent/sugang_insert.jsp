<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>과목추가</title>
</head>
<body>
<h1>추과된 과목</h1>

<% 
 	request.setCharacterEncoding("utf-8");  //텍스트 오류 잡는 법 
	String id = request.getParameter("id"); 
	String name = request.getParameter("name");
	int credit =Integer.parseInt(request.getParameter("credit")); //int형으로 치환하는 방법!! Integer.parseInt()
	String lecturer = request.getParameter("lecturer");
	int week = Integer.parseInt(request.getParameter("week"));
	String start_hour = request.getParameter("start_hour");
	String end_end = request.getParameter("end_end");
	
	Connection conn = null;
	Statement stmt = null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?characterEncoding=utf8","root","0425"); //텍스트 오류 잡는 법
		stmt = conn.createStatement();	
		String command = String.format("insert into sub values ('%s','%s','%s','%s','%s','%s','%s');",id, name, credit, lecturer, week, start_hour, end_end ); //외우기!! 

		int rowNum = stmt.executeUpdate(command); 

}finally{
	try{
		stmt.close();
	}	catch(Exception ignored) {
		System.out.println(ignored);
	}
	try{
		conn.close();
	}catch (Exception ignored) {
		System.out.println(ignored);
	}
}


	response.sendRedirect("sugang_select.jsp");
	
   	
%>
</body>
</html>