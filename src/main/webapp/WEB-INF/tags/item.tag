<%@ tag body-content="scriptless" pageEncoding="UTF-8" %> <!-- 태그 지시자 (태그의 시작은 무조건 태그 지시자로 시작) -->
<%@ attribute name="title" %> <!-- 속성 -->
<%@ attribute name="colName" %>

<jsp:useBean id="product" class="chap10.Product"/>

<h2><jsp:doBody/></h2> <!-- 시작태그와 종료태그 사이의 내용 작성 -->
<hr>

<h4>${title}</h4>

<table>
	<tr><th>${colName }</th></tr>
	
	<%
		for(String prod: product.getProductList()){
			out.println("<tr><td>" + prod + "</td></tr>");
		}
	%>
	
</table>

