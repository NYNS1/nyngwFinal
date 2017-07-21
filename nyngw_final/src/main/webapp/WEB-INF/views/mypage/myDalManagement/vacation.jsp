<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.List"%>
<%@page import="com.nyngw.dto.VacationVO"%>
<%@page import="com.nyngw.mypage.myDalManagement.MyVacationListView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
마이페이지 >> 나의 근태 관리 >> 휴가현황
	<table class="table table-border">
				<tr>
					<th>검색입력</th>
					<td colspan="4">
					<form action="/mypage/myDalManagement/vacation">
						<select name="index">
							<option value="vacation_vp_number">휴가 정책</option>
						</select>
					<input type="hidden" value="${select.index}">
					<input type="text" name="val" value="${select.val}">
					<input type="submit" value="검색">
					</form> 
					</td>
				</tr>
			<tr>
			<th>번호</th>
			<th>휴가 분류</th>
			<th>휴가 시작일</th>
			<th>휴가 종료일</th>
			<th>휴가 종료예정일</th>
		</tr>
			<c:choose>
				<c:when test="${viewData.boardCountPerPage > 0}">
				<c:forEach items="${viewData.vacationList}" var="board" >
				<tr>
					<td>${board.vacation_number}</td>
					<td>${board.vp_kind }</td>
					<td><fmt:formatDate value="${board.vacation_start}" pattern="yy'년'MM'월'dd'일'"/></td>
					<td><fmt:formatDate value="${board.vacation_end}" pattern="yy'년'MM'월'dd'일'"/></td>
					<td><fmt:formatDate value="${board.vacation_end_duedate}" pattern="yy'년'MM'월'dd'일'"/></td>
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td style="text-align: center;">내용이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</table>

	<div id="pageNum">
		<c:if test="${beginPage > perPage}">
			<a href="<c:url value="/mypage/myDalManagement/vacation?page=${beginPage-1}"/>">이전</a>
		</c:if>
		<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
			<a href="<c:url value="/mypage/myDalManagement/vacation?page=${pno}" />">[${pno}]</a>
		</c:forEach>
		<c:if test="${endPage < viewData.getPageTotalCount()}">
			<a href="<c:url value="/mypage/myDalManagement/vacation?page=${endPage + 1}"/>">다음</a>
		</c:if>
		</div>
	
<div>
	<button><a href="/electronicApproval/draft/draft">휴가 신청</a></button>
</div>

