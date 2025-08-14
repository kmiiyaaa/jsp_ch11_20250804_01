<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 처리</title>
</head>
<body>

		<% 
			request.setCharacterEncoding("utf-8");
		
			String mid = request.getParameter("mid");
			String mpw = request.getParameter("mpw");
			String mname = request.getParameter("mname");
			String memail = request.getParameter("memail");
			// DB에 삽입할 데이터 준비 완료
			
			
			
			// DB 커넥션 준비
			String driverName = "com.mysql.jdbc.Driver";   // MYSQL JDBC 드라이버 이름 - mysql사용시 fix값 고정
			String url = "jdbc:mysql://localhost:3306/jspdb";   // MYSQL이 설치된 서버의 주소(ip)와 연결할 db(스키마) 이름
			String userName = "root";
			String password = "12345";
			
			//sql문 만들기
			String sql = "INSERT INTO members(memberid, memberpw, membername, memberemail) VALUES('"+ mid +"','" +  mpw + "','" + mname + "','" + memail + "')" ;  //예약어 관례적으로 대문자로 써야 좋다
		
			Connection conn = null;
			Statement stmt = null ;  // sql문을 관리해주는 객체를 선언해주는 인터페이스로 stmt선언 , jqva.sql소속(Statement)
		
			
			try {
				Class.forName(driverName);  // MYSQL 드라이버 클래스 불러오기
				
				conn = DriverManager.getConnection(url, userName, password);  // conn(커넥션)이 메모리에 생성 = DB와 연결 커넥션 conn 생성
			
				stmt = conn.createStatement();  // stmt 객체 생성
				
				// stmt.executeLargeUpdate(sql);   // sql문을 db에서 실행
				
			 int sqlResult = stmt.executeUpdate(sql); // SQL문을 DB에서 실행 - 성공하면 1반환, 실패하면 1아닌값 반환 , select는 .executeupdate에 넣으면 안된다
				
			 System.out.println(sqlResult);
			 
			 
				
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