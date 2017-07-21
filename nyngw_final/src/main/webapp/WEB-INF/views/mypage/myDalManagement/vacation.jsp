<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.List"%>
<%@page import="com.nyngw.dto.VacationVO"%>
<%@page import="com.nyngw.mypage.myDalManagement.MyVacationListView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
���������� >> ���� ���� ���� >> �ް���Ȳ
	<table class="table table-border">
				<tr>
					<th>�˻��Է�</th>
					<td colspan="4">
					<form action="/mypage/myDalManagement/vacation">
						<select name="index">
							<option value="vacation_vp_number">�ް� ��å</option>
						</select>
					<input type="hidden" value="${select.index}">
					<input type="text" name="val" value="${select.val}">
					<input type="submit" value="�˻�">
					</form> 
					</td>
				</tr>
			<tr>
			<th>��ȣ</th>
			<th>�ް� �з�</th>
			<th>�ް� ������</th>
			<th>�ް� ������</th>
			<th>�ް� ���Ό����</th>
		</tr>
			<c:choose>
				<c:when test="${viewData.boardCountPerPage > 0}">
				<c:forEach items="${viewData.vacationList}" var="board" >
				<tr>
					<td>${board.vacation_number}</td>
					<td>${board.vp_kind }</td>
					<td><fmt:formatDate value="${board.vacation_start}" pattern="yy'��'MM'��'dd'��'"/></td>
					<td><fmt:formatDate value="${board.vacation_end}" pattern="yy'��'MM'��'dd'��'"/></td>
					<td><fmt:formatDate value="${board.vacation_end_duedate}" pattern="yy'��'MM'��'dd'��'"/></td>
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
		<c:if test="${beginPage > perPage}">
			<a href="<c:url value="/mypage/myDalManagement/vacation?page=${beginPage-1}"/>">����</a>
		</c:if>
		<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
			<a href="<c:url value="/mypage/myDalManagement/vacation?page=${pno}" />">[${pno}]</a>
		</c:forEach>
		<c:if test="${endPage < viewData.getPageTotalCount()}">
			<a href="<c:url value="/mypage/myDalManagement/vacation?page=${endPage + 1}"/>">����</a>
		</c:if>
		</div>
	
<div>
	<button><a href="/electronicApproval/draft/draft">�ް� ��û</a></button>
</div>

