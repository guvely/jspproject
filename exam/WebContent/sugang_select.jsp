<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>과목조회</title>
</head>
<style>
header{
margin:0;
margin-left: 300px;
padding:15px;
}
#box1{ width: 1200px;
height: 150px;
background-color: gray;
}
h1{ position:relative;
left: 400px;
top: 50px;
}
#box2{ width: 1200px;
height: 100px;
background-color: gray;
}
li{ display: inline;
padding: 20px;
position:relative;
top: 40px;
} 
a{ text-decoration:none;
}
a:visited{ color:black;
}
table{ width:1200px;
height: 300px;
text-align: center;
}
p{ float: right;
position:relative;
left:300px;}
section{
margin-left: 300px;
padding: 15px;
}
#buttns{ margin-left:500px;
			padding:20px;
}
footer{
margin-left: 300px;
padding: 15px;
}
#foot{ width:1200px;
height:100px;
border: solid 1px blue;
}
#copyright{ padding:10px;
	margin-left:450px;
}
</style>
<body>
<header>
<div id = "box1">
	<h1>수강 신청 도우미 사이트</h1>
</div>
<div id = "box2">
	<ul>
	<a href = "sugang_select.jsp"><li>과목조회</li></a>
	<a href = "sugang_add.html"><li>과목추가</li></a>
	<a href = "sugang_edit.html"><li>과목수정</li></a>
	<a href = "sugang_select.jsp"><li>홈으로</li></a>
	</ul>
</div>
</header>
<section>
<% 
		Connection conn = null;
		Statement stmt = null;
		try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","0425");
		stmt = conn.createStatement();
		ResultSet rs= stmt.executeQuery("select * from sub;");
		out.println("<table border=1> <tr><td>과목코드</td><td>과목명</td></td>학점</td><td>담당강사</td><td>요일</td><td>시작시간</td><td>종료시간</td><td>관리</td></tr> ");
		while(rs.next()){
		String id = rs.getString("id");
		String name = rs.getString("name");
		int credit = rs.getInt("credit");
		String lecturer =rs.getString("lecturer");
		int week =rs.getInt("week");
		String start_hour = rs.getString("start_hour");
		String end_end = rs.getString("end_end");
	
		out.println("<tr><td>");
		out.println(id+"</td>)");
		out.println("<td>"+name+"</td>");
		out.println("<td>"+credit+"</td>");
		out.println("<td>"+lecturer+"</td>");
		out.println("<td>"+week+"</td>");
		out.println("<td>"+start_hour+"</td>");
		out.println("<td>"+end_end+"</td>");
		out.println("<td> 수정/삭제 </td>");
		out.println("</tr>"); //띄어쓰기 출력법
	}
	
	}finally{
		try{
			stmt.close();
		}	catch(Exception ignored) {
		}
		try{
			conn.close();
		}catch (Exception ignored) {
		}
	}
	%>
</section>


 	<footer>
<div id = "foot">
	<h2 id = "copyright">copyright 2021 UI 테스트</h2>
</div>
</footer>
 	</body>
 	</html>
 	