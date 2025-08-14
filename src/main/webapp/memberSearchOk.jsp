<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 조회</title>
</head>
<body>
	<h2>회원 정보 조회</h2>
	<hr>

<% 
			request.setCharacterEncoding("utf-8");
		
			String sid = request.getParameter("sid");
			
			// DB 커넥션 준비
			String driverName = "com.mysql.jdbc.Driver";   // MYSQL JDBC 드라이버 이름 - mysql사용시 fix값 고정
			String url = "jdbc:mysql://localhost:3306/jspdb";   // MYSQL이 설치된 서버의 주소(ip)와 연결할 db(스키마) 이름
			String userName = "root";
			String password = "12345";
			
			//sql문 만들기
			String sql = "SELECT * FROM members WHERE memberid = '" + sid + "'";  // 한명씩 조회할때 
			// String sql = "SELECT * FROM members" ;    //여러명 조회할때 
		
			Connection conn = null;
			Statement stmt = null ;  // sql문을 관리해주는 객체를 선언해주는 인터페이스로 stmt선언 , jqva.sql소속(Statement)
			ResultSet rs = null;  // select문 실행시 db에서 반환해주는 레코드 결과를 받아주는 자료타입 rs선언
			
			
			try {
				Class.forName(driverName);  // MYSQL 드라이버 클래스 불러오기
				
				conn = DriverManager.getConnection(url, userName, password);  // conn(커넥션)이 메모리에 생성 = DB와 연결 커넥션 conn 생성
			
				stmt = conn.createStatement();  // stmt 객체 생성
				
				// int sqlResult = stmt.executeUpdate(sql);
				rs = stmt.executeQuery(sql);
				// select문 실행 - 결과가 db로부터 반환 -> 그 결과(레코드(행))을 받아주는 ResultSet 타입 객체로 받아야한다
				
				
				// String gid  = null;
			
				//  한명씩 조회할 때
				if(rs.next()){  // 참이면 레코드가 1개 이상 존재 - id가 존재
					// while(rs.next()) {  //rs에서 레코드 추출하는 방법
						String gid = rs.getString("memberid");   // String,char - getstring, int - getint, double - getdouble, date - getdate 로 빼주면된다
						String gpw = rs.getString("memberpw");
						String gname = rs.getString("membername");
						String gemail = rs.getString("memberemail");
						String gdate = rs.getString("memberdate");   // 화면 출력용 - string으로 해도 된다, 만약 계산해야한다면 getdate();
						
					out.println("****** 조회된 회원 정보 ******* <br>");
					out.println(gid + "/" + gpw + "/"  + gname + "/" + gemail + "/" + gdate);
					// } 
				} else {
					out.println(" ** 존재하지 않는 회원 입니다 **");
				}
				  
				  
				 /* 여러명 조회할때
				if (rs.next()) {   // 첫 번째 레코드가 있는지 확인
				    out.println("****** 조회된 회원 정보 ******* <br>");
				    do {
				        String gid    = rs.getString("memberid");  
				        String gpw    = rs.getString("memberpw");
				        String gname  = rs.getString("membername");
				        String gemail = rs.getString("memberemail");
				        String gdate = rs.getString("memberdate"); 

				        out.println(gid + " / " + gpw + " / " + gname + " / " + gemail + " / " + gdate + "<br>");
				    } while (rs.next()); 
				} else {
				    out.println("** 존재하지 않는 회원 입니다 **");
				}
			*/
			
				
			//	if(gid==null){
				//	out.println(" ** 존재하지 않는 회원 입니다 **");
			//	}
				
			} catch (Exception e) {
				out.println("db 에러 발생@@@ 조회 실패"); 
				e.printStackTrace();  //에러 내용 출력
				
			} finally {  // finally : 에러 유무와 상관없이 무조건 실행할 내용 입력 -> 여기선 에러와 상관없이 커넥션 닫기
				try {
					if(rs != null){
						rs.close();
					}
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