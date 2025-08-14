<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.kmii.member.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 

				String driverName = "com.mysql.jdbc.Driver";  
				String url = "jdbc:mysql://localhost:3306/jspdb";   
				String userName = "root";
				String password = "12345";
				
				String sql = "SELECT * FROM board";
									

				Connection conn = null;
				Statement stmt = null ;  
				ResultSet rs = null;
				List<BoardDto> boardList = new ArrayList<BoardDto>(); 




 while(rs.next()){
				 BoardDto boardDto = new BoardDto();
				 boardDto.setBtitle(rs.getString("btitle"));
				 boardDto.setBcontent(rs.getString("bcontent"));
				 boardDto.setMemberid(rs.getString("memberid"));
				 boardDto.setBdate(rs.getString("bdate"));
				 
				 boardList.add(boardDto);
			 }
			 
			 for(BoardDto board : boardList){
				 out.println(board.getBtitle() + "/");
				 out.println(board.getBcontent() + "/");
				 out.println(board.getMemberid() + "/");
				 out.println(board.getBdate());
			 }
			 
			 %>
</body>
</html>