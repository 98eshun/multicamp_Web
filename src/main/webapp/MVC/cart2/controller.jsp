<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="bean" class="mvc.cart.CartBean" scope="session"/>

<%
	if(request.getMethod().equals("POST")){
		request.setCharacterEncoding("UTF-8");
	}

	String command = request.getParameter("command");
	String viewPath = "/WEB-INF/views/cart2/";
	
	if(session.getAttribute("id") == null){	// 로그인 상태가 아닐 때 
		if(request.getMethod().equals("GET")){
			pageContext.forward(viewPath + "login.jsp");
		}
		else if(request.getMethod().equals("POST")){
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
			if(bean.checkLogin(id, passwd)){
				session.setAttribute("id", id);
				pageContext.forward(viewPath + "selProduct.jsp");
			}
			else{
				response.sendRedirect("controller.jsp");	// "로그인 상태가 아닐 때" 로 이동
			}
		}
	}
	else if(command != null && command.equals("logout")){	//로그아웃 했을 때
		session.invalidate();
		response.sendRedirect("controller.jsp");
	}
	else if(command != null && command.equals("addCart")){	//
		String product = request.getParameter("product");
		bean.addProduct(product);	// 이 요청이 forward 된 대상에서도 requset 저장소 사용 가능
		request.setAttribute("script", "alert('" + product + "상품을 구매했습니다');");
		pageContext.forward(viewPath + "selProduct.jsp");
	}
	else if(command != null && command.equals("checkOut")){	//
		if(session.getAttribute("productList") == null){
		session.setAttribute("prductList", bean.getProductList());
		}
		else{
			pageContext.forward(viewPath + "checkOut.jsp");
		}
	}
	else if(command != null && command.equals("clearCart")){	//장바구니 초기화
		bean.clearProductList();
		pageContext.forward(viewPath + "selProduct.jsp");
	}
	
	else{	// 로그인 상태일 때
		pageContext.forward(viewPath + "selProduct.jsp");
	}
%>
