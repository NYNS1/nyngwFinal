<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.List"%>
<%@page import="com.nyngw.dto.DalViewVO"%>
<%@page import="com.nyngw.mypage.myDalManagement.MyAttendedListView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

���������� >> ���� ���� ���� >> ������

	<div>
		<button>��� üũ</button>
		<button>��� üũ</button>
	</div>

	<%
	Integer pageNumber = (Integer)request.getAttribute("pageNumber");
	MyAttendedListView viewData = (MyAttendedListView)request.getAttribute("viewData");
	%>
	<table class="table table-bordered">
		<tr>
			<th>��ȣ</th>
			<th>��¥</th>
			<th>��� �ð�</th>
			<th>��� �ð�</th>
			<th>��� ����</th>
			<th>��� ����</th>
		</tr>
		<% if(viewData.getBoardCountPerPage()>0){
			List<DalViewVO> boardList=viewData.getAttendedList();
			for(int i =0; i<boardList.size();i++){
			%>
				<tr>
					<td><%=viewData.getFirstRow()+i%></td>
					<td><%=boardList.get(i).getDalview_date()%></td>
					<td><%=boardList.get(i).getDalview_attend_time()%></td>
					<td><%=boardList.get(i).getDalview_off_time()%></td>
					<td><%=boardList.get(i).getDalview_content()%></td>
					<td><%=boardList.get(i).getDalview_sf_number()%></td>
					
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
			<a href="mypage/myDalManagement/attended?page=<%=i%>">[<%=i%>]</a>
		<%} %>
	</div>