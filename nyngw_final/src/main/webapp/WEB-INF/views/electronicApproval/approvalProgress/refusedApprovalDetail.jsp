<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

결재진행>완료문서상세
<form name="hiddenForm">
	<input type="hidden" id="ea_number" value="${ea_number }">
	<button type="button" id="rewriteApproval_go">재작성</button>
	<button type="button" id="approvalHistory_go">결재이력</button>
</form>

<script type="text/javascript">
$(function(){
	 $('#approvalHistoryDialog').css('display', 'none');
	 
	/////////////////////////////////////////////////
	 $("#approvalHistory_go").click(function(){
		 $('#approvalHistoryDialog').dialog({
				width: 700,
				height: 500,
				modal: true,
				buttons: {
			       "취소": function() {
						$(this).dialog("close");
					}
				},
				close: function() {
				}
	     });
     })
     
	$("#rewriteApproval_go").click(function(){
		location.href="/electronicApproval/approvalProgress/editDraftForm";
	});
})
</script>

<div id="approvalHistoryDialog">
	결재상태 이력보기
	<table class="table">
		<tr>
			<th>회사</th>
			<th>부서</th>
			<th>직급</th>
			<th>직책</th>
			<th>이름</th>
			<th>결재종류</th>
			<th>결재종시간</th>
		</tr>
		<tr>
			<td>심플렉스인터넷(주)</td>
			<td>TFT 기획</td>
			<td>사원</td>
			<td>사원</td>
			<td>이주빈</td>
			<td>가결</td>
			<td>2008-03-25 11:53:07</td>
		</tr>
	</table>
</div>

<hr>
<div>
	결재한 문서
</div>