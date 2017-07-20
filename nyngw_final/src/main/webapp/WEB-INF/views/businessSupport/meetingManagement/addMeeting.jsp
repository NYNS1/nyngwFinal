<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.userdetails.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
   function file_change(file){
   var str=file.lastIndexOf("\\")+1;   //파일 마지막 "\" 루트의 길이 이후부터 글자를 잘라 파일명만 가져온다.
   file = file.substring(str, file.length);
   document.getElementsByName('board_file_name')[0].value=file;
}
</script>
<div>
		<form name="tx_editor_form" style="width: 750px;" id="tx_editor_form" action="meetingInsert" method="POST" accept-charset="utf-8">
			<table class="table table-border">
			<tr>
				<th>회의제목</th>
				<td>
					<input type="text" name="mt_title">
				</td>
			</tr>
			<tr>
				<th>회의장소</th>
					<td>
						<select name="mt_mr_number">
						<c:forEach items="${meetingroom }" var="meetingroom">
							<option value="${meetingroom.mr_number }">${meetingroom.mr_name }</option>
						</c:forEach>
						</select>
					</td>
				<th>회의일</th>
				<td>
					<input type="date" name="mt_date">
				</td>
			</tr>
			<tr>
				<th>회의주최자</th>
				<td><input type="text" name="mt_reader" value="${meetingList2.mem_name }" readonly="readonly"></td>
				<th>회의참여자</th>
				<td></td>
			</tr>
		</table>
			<jsp:include page="/WEB-INF/views/common/daumOpenEditor/meetingeditor.jsp" flush="false"/>
			<input type="hidden" value="${page}">
			<div><button onclick='saveContent()'>등록</button></div>
			<input type="reset" value="초기화" />	
			<div style="text-align: center;">
				<button type="button"><a href="/businessSupport/meetingManagement/meetingCalendar?page=${page }">취소</a></button>
			</div>
		</form>
	</div>
<%-- <form action="<%=request.getContextPath() %>/businessSupport/meetingManagement/meetingInsert" method="post"> --%>
<!-- 		<table class="table table-border"> -->
<!-- 			<tr> -->
<!-- 				<th>회의제목</th> -->
<!-- 				<td> -->
<!-- 					<input type="text" name="mt_title"> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>회의장소</th> -->
<!-- 					<td> -->
<!-- 						<select name="rv_mr_number"> -->
<%-- 						<c:forEach items="${meetingroom }" var="meetingroom"> --%>
<%-- 							<option value="${meetingroom.mr_number }">${meetingroom.mr_name }</option> --%>
<%-- 						</c:forEach> --%>
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 				<th>회의일</th> -->
<!-- 				<td> -->
<!-- 					<input type="date" name="mt_date"> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>회의주최자</th> -->
<%-- 				<td><input type="text" name="mt_reader" value="${meetingList2.mem_name }" readonly="readonly"></td> --%>
<!-- 			</tr> -->
			
<!-- 		</table> -->
<!-- 		<textarea rows="20" cols="100" style="resize: none;" name="mt_content"></textarea> -->
<!-- 			<input type="submit" value="작성 완료"/> -->
		
<!-- 			<button><a href="/businessSupport/meetingManagement/meetingCalendar">취소</a></button> -->
<!-- 	</form> -->
			
		