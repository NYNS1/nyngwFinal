<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.List"%>
<%@page import="com.nyngw.dto.DalViewVO"%>
<%@page import="com.nyngw.mypage.myDalManagement.MyAttendedListView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

���������� >> ���� ���� ���� >> ������

	<div>
		<button>��� üũ</button>
		<button>��� üũ</button>
	</div>

	
	<table class="table table-bordered">
	<tr>
			<th>��ȣ</th>
			<th>��¥</th>
			<th>��� �ð�</th>
			<th>��� �ð�</th>
			<th>��� ����</th>
			<th>��� ����</th>
		</tr>
			<c:choose>
				<c:when test="${viewData.boardCountPerPage > 0}">
				<c:forEach items="${viewData.attendedList}" var="board" >
				<tr>
					<td>${fn:substring(board.dalview_number,3,10077777)}</td>
					<td>${board.dalview_date}</td>
					<td>${board.dalview_attend_time}</td>
					<td>${board.dalview_off_time}</td>
					<td>${board.dalview_content}</td>
					<td>${board.dalview_sf_number}</td>
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td style="text-align: center;">������ �����ϴ�.</td>
					</tr>
				</c:otherwise>
			</c:choose>
</table>
	<div id="pageNum">
		<c:forEach begin="1" end="${viewData.getPageTotalCount()}" step="1" var="i">
			<a href="/mypage/myDalManagement/attended?page=${i}">[${i}]</a>
		</c:forEach>
	</div>
	
	