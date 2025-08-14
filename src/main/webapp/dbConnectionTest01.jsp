<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jdbc 연결 테스트</title>
</head>
<body>
	<%
		
		String driverName = "com.mysql.jdbc.Driver";   // MYSQL JDBC 드라이버 이름 - mysql사용시 fix값 고정
		String url = "jdbc:mysql://localhost:3306/jspdb";   // MYSQL이 설치된 서버의 주소(ip)와 연결할 db(스키마) 이름
		String userName = "root";
		String password = "12345";
	
		
		Connection conn = null;  //커넥션 인터페이스로 선언 후 null로 초기값 설정 , 인터페이스라 new~ 사용 x
		
		try {
			Class.forName(driverName);  // MYSQL 드라이버 클래스 불러오기
			
			conn = DriverManager.getConnection(url, userName, password);  // conn(커넥션)이 메모리에 생성 = DB와 연결 커넥션 conn 생성
		
		
			out.println(conn);  // 커넥션이 에러없이 생성된 경우 커넥션 이름이 웹에 출력된다 
		
		} catch (Exception e) {
			out.println("커넥션 생성 실패"); 
			e.printStackTrace();  //에러 내용 출력
			
		} finally {  // finally : 에러 유무와 상관없이 무조건 실행할 내용 입력 -> 여기선 에러와 상관없이 커넥션 닫기
			try {
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