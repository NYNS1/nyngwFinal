<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.List"%>
<%@page import="com.nyngw.dto.VacationVO"%>
<%@page import="com.nyngw.mypage.myDalManagement.MyVacationListView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
���������� >> ���� ���� ���� >> �ް���Ȳ
<%
	Integer pageNumber = (Integer)request.getAttribute("pageNumber");
	MyVacationListView viewData = (MyVacationListView)request.getAttribute("viewData");
	%>
	<table class="table table-bordered">
		<tr>
			<th>��ȣ</th>
			<th>�ް� ��ȣ</th>
			<th>�ް� ������</th>
			<th>�ް� ������</th>
			<th>�ް� ���Ό����!</th>
			<th>��� ��ȣ</th>
		</tr>
		<% if(viewData.getBoardCountPerPage()>0){
			List<VacationVO> boardList=viewData.getVacationList();
			for(int i =0; i<boardList.size();i++){
			%>
				<tr>
					<td><%=viewData.getFirstRow()+i%></td>
					<td><%=boardList.get(i).getVacation_number()%></td>
					<td><fmt:formatDate value="<%=boardList.get(i).getVacation_start()%>" pattern="yyyy/MM/dd"/></td>
					<td><fmt:formatDate value="<%=boardList.get(i).getVacation_end()%>" pattern="yyyy/MM/dd"/></td>
					<td><fmt:formatDate value="<%=boardList.get(i).getVacation_end_duedate()%>" pattern="yyyy/MM/dd"/></td>
					<td><%=boardList.get(i).getVacation_mem_number()%></td>
				</tr>
			<%
			}
			%>		
					
			<%}else{ %>
				<tr>
					<td style="text-align: center;">������ �����ϴ�.</td>
				</tr>
			<%} %>
	</table>

	<div id="pageNum">
		<%for(int i=1;i<viewData.getPageTotalCount()+1;i++){ %>
			<a href="mypage/myDalManagement/vacation?page=<%=i%>">[<%=i%>]</a>
		<%} %>
	</div>


<div>
	<button><a href="/electronicApproval/draft/draft">�ް� ��û</a></button>
</div>

