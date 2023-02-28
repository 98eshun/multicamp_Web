<%@ page contentType="text/html; charset=UTF-8"
		import = "java.util.*"
%>

<%
// 로그인 한 사용자만 이용할 수 있다.
// 로그인하지 않은 사용자의 접근은 로그인 페이지로 리다이렉팅한다
// 장바구니 비우기 기능
// 상품 구매 페이지로의 이동
boolean isLogin = (boolean)session.getAttribute("Login");
		String products = "";
	if(isLogin == true){
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("productList");
		if(list == null){
			products = "<h4>구매하신 상품이 없습니다.</h4>";
		}
		else{
			for(String product : list) {
				products += "<h5>" + product + "</h5>";
			}
			session.removeAttribute("productList");
		}
	}
	else{
		response.sendRedirect("login.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>checkOut.jsp</title>
</head>

<body>
	<h1>장바구니 확인</h1>
	<hr>
	
	<%= products %>
	
</body>
</html>