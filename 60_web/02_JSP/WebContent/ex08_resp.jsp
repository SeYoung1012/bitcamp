<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%-- 주문한 내역에 따라 계산하고 결과를 표시 --%> 
<%
	//주문한 내역에따라 계산하고 결과를 표시
	
	//1. 파라미터 값 추출
	String coffee = request.getParameter("coffee");
	int su = Integer.parseInt(request.getParameter("su"));
	int money = Integer.parseInt(request.getParameter("money"));
		
	//2. 계산처리 (구입금액, 잔액)
	String menu = ""; //선택 메뉴
	int danga = 0; //메뉴 단가
	
	//2-1 선택 메뉴에 따른 메뉴명, 단가 확인
/*	
	if("1".equals(coffee)) {
		//System.out.println(coffee + " : 아메리카노, 3000원");
		menu = "아메리카노";
		danga = 3000;
	}else if("2".equals(coffee)){
		menu = "카페모카";
		danga = 3500;
		
	}else if("3".equals(coffee)){
		menu = "에스프레소";
		danga = 2500;
		
	}else if("4".equals(coffee)){
		menu = "카페라테";
		danga = 4000;
		
	}
*/	

	switch (coffee) {
	case "1" : menu = "아메리카노"; danga = 3000; break;
	case "2" : menu = "카페모카"; danga = 3500; break;
	case "3" : menu = "에스프레소"; danga = 2500; break;
	case "4" : menu = "카페라테"; danga = 4000; break;
	
	}
	
	//계산처리 (구입금액, 잔액)
	int  total = danga * su;
	int change = money - total;
	
	//3. 계산 결과 화면 출력




%>




   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문결과</title>
</head>
<body>
	<h2> 주문계산 결과(응답)</h2>

<%--
	커피종류 : 아메리카노
	단가 : 3000원
	수량 : 3
	구입금액 : 9000원(단가 * 수량)
	--------------------------
	입금액: 10000원
	잔액 : 1000원(입금액 - 구입금액)

 --%>

	<ul>
		<li> 커피 종류 : <%=menu %></li>
		<li> 단가 : <%=danga %></li>
		<li> 수량 : <%=su %></li>
		<li> 구입금액 : <%=total %></li>
		<li> 입금액 : <%=money %></li>
		<li> 잔액 : <%=change %></li>
	
	</ul>



</body>
</html>