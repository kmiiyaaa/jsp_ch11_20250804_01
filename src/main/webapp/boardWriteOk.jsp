<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
			request.setCharacterEncoding("utf-8");
		
			String bnum = request.getParameter("bnum");
			String btitle = request.getParameter("btitle");
			String bcontent = request.getParameter("bcontent");
			String memberid = request.getParameter("memberid");
			String bdate = request.getParameter("bdate");
			
			
			String driverName = "com.mysql.jdbc.Driver";  
			String url = "jdbc:mysql://localhost:3306/jspdb";   
			String userName = "root";
			String password = "12345";
			
			//sql문 만들기
			String sql = "INSERT INTO board(btitle, bcontent, memberid) VALUES('"+ btitle +"','" +  bcontent + "','" + memberid + "')" ;
			
			
			Connection conn = null;
			Statement stmt = null ;  

		
			
			try {
				Class.forName(driverName);  // MYSQL 드라이버 클래스 불러오기
				
				conn = DriverManager.getConnection(url, userName, password);  // conn(커넥션)이 메모리에 생성 = DB와 연결 커넥션 conn 생성
			
				stmt = conn.createStatement();  // stmt 객체 생성
			
				
			 int sqlResult = stmt.executeUpdate(sql);
				
		

			 
				
			} catch (Exception e) {
				out.println("db 에러 발생@@@ 회원가입 실패"); 
				e.printStackTrace();  //에러 내용 출력
				
			} finally {  // finally : 에러 유무와 상관없이 무조건 실행할 내용 입력 -> 여기선 에러와 상관없이 커넥션 닫기
				try {
					
					if(stmt != null){  // stmt가 null이 아니면 닫기 --- conn보다 먼저 닫아야한다
							stmt.close();
					}
					
					if(conn != null) {  // 커넥션이 null값이 아닐때만 닫기
						conn.close();
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			
				%>
			
			</body>
			</html>
