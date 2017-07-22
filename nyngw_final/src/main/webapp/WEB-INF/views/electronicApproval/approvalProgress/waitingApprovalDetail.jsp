<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<style>
	.tableTd{
 		width: 17%;
 		height: 50px;
	}
	.tableSign{
 		height: 80px;
	}
	.memSign {
		display : block;
		width : 80px;
		height : 60px;
		margin :0 auto;
		background-size: contain;
		background-repeat: no-repeat;
		background-position : top center;
	}
</style>
<script type="text/javascript">
$(function(){
	 $('#approvalDialog').css('display', 'none');
	 
	/////////////////////////////////////////////////
	 $("#approve_go").click(function(){
		 $('#approvalDialog').dialog({
				width: 700,
				height: 500,
				modal: true,
				buttons:[{
					text: "등록",
					icon: "ui-icon-heart",
					click: function() {
						submitCall();
						$( this ).dialog( "close" );
					}
				},{
					text: "취소",
					icon: "ui-icon-heart",
					click: function() {
						$( this ).dialog( "close" );
					}
				}],
				close: function() {
					$('#textArea').val('');
					$('#pwd').val('');
				}
	     });
     })
     
     var submitCall = null;
	//결재하기//
	function submitLine(){
		$.ajax({
 			url:"/electronicApproval/approvalProgress/conformApproval",	// 결재처리 하는 컨트롤러 url
 			type:"post",
 			data: $("#submitForm").serialize(),
 			success: function(result){ // success
 				if(result.check=='y'){
 					if(result.al_number=='A'){
		 				var code="background-image:url('/resources/memsign/"+result.mem_sign+"')";
		 				$("#approvalStatus"+result.priority).attr('style', code);
		 				$("#approve_go").attr("disabled",true);
		 				alert("결재가 완료되었습니다.");
 					}else if(result.al_number=='B'){
		 				var code="background-image:url('/resources/memsign/"+result.mem_sign+"')";
		 				$("#agreementStatus"+result.priority).attr('style', code);
		 				$("#approve_go").attr("disabled",true);
		 				alert("합의가 완료되었습니다.");
 					}
 				}else{
 					alert("잘못된 비밀번호입니다.");
 				}
 			},
 			dataType:"json"				// dataType
 		});
	}	
	submitCall=submitLine;
	
	///////////////////////////////////////////////
})
</script>

결재진행>미결재문서함상세
<!-- 선택한 결재문서의 정보들을 가지고 들어와야하고 이 때 필요한 정보를 hidden에 담아 주자 -->
<%-- <input type="hidden" name="ea_number" value="${ea_number}"> --%>
<form name="hiddenForm">
	<input type="hidden" id="ea_number" value="${ea_number }">
	<button type="button" id="approve_go">결재</button>
	<button type="button" id="insteadApprove_go">전결</button>
	<button type="button" id="refuse_go">반려</button>
	<button type="button" id="postpone_go">보류</button>
	<button type="button" id="approvalHistory_go">결재이력</button>
</form>

<div id="approvalDialog">
	결재하기
	<form id="submitForm">
		<%User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();%>
		<%=user.getUsername() %>님 결재하시겠습니까?<br>
		비밀번호 <input type="password" id="pwd" name="mem_pwd"><br>
		결재사유
		<input type="hidden" name="ah_ea_number" value="${eaVO.ea_number }">
		<input type="hidden" name="ah_code_number" value="code14">
		<input type="hidden" name="ah_ast_number" value="${ast_number}">
		<textarea id="textArea" name="ah_comment"></textarea>
	</form>   
</div>

<div>
	<input type="hidden" name="ea_doc_number" value="${eaVO.ea_doc_number }">
	<table class="table table-bordered">
		<tr>
			<th class="tableTh">품의번호</th>
			<td colspan="5">${eaVO.ea_number }</td>
			<input type="hidden" name="ea_number" value="${eaVO.ea_number }">
		</tr>
		<tr>
			<th class="tableTh">작성일자</th>
			<td colspan="5">${eaVO.ea_writedate }</td>
		</tr>
		<tr>
			<th class="tableTh">기안자</th>
			<td colspan="5">${mem_name }</td>
		</tr>
		<!-- 결재자 이름-->   
		<tr id="approvalMember">
			<th rowspan="2">결재</th>
			<c:forEach items="${approvalMember}" var="member">
				<th class="tableTd">${member.mem_name }</th>
			</c:forEach>
			<c:forEach var="i" begin="1" end="${lastAstPriorityOfA }" step="1">
				<th class="tableTd"></th>
			</c:forEach>
		</tr>   
		<!-- 결재자 서명 -->                              
		<tr id="approvalStatus">                                 
			<c:forEach items="${approvalMem_sign}" var="sign" varStatus="index">
				<td id="approvalStatus${index.count}"><div class="tableTd tableSign memSign" style="background-image:url('/resources/memsign/${sign }')"></div></td>
			</c:forEach>
			<c:forEach var="i" begin="${indexB }" end="${CountIndexB }" step="1">
				<td id="approvalStatus${i}" class="tableTd tableSign">as</td>
			</c:forEach>
			<!--
				indexA = 결재 이력의 수 + 1 = 결재스탭에 있는 것 중 결재 된 것의 다음 수를 알 수 있다 
				indexB = 결재 이력의 수 + 1 = 결재스탭에 있는 것 중 결재 된 것의 다음 수를 알 수 있다
				countA = 전체 결재선의 A의 갯수+1 = 빈칸이 몇 번부터 시작해야 하는지
				countB = 전체 결재선의 B의 갯수+1 = 빈칸이 몇 번부터 시작해야 하는지 
				lastAstPriorityOfA = 5에서 A의 전체 결재선을 뺀 수 = 빈칸의 수
				lastAstPriorityOfB = 5에서 B의 전체 결재선을 뺀 수 = 빈칸의 수
			-->
			<c:forEach var="i" begin="${countA }" end="${lastAstPriorityOfA }" step="1">
				<td id="approvalStatus${i}" class="tableTd tableSign">as</td>
			</c:forEach>
		</tr>      
		<!-- 합의자 이름 -->                          
		<tr id="agreementMember">                                 
			<th rowspan="2">합의</th>        
			<c:forEach items="${agreementMember}" var="member">
				<th class="tableTd">${member.mem_name }</th>
			</c:forEach>
			<c:forEach var="i" begin="1" end="${lastAstPriorityOfB}" step="1">
				<th class="tableTd"></th>
			</c:forEach>
		</tr>   
		<!-- 합의자 서명 -->                               
		<tr id="agreementStatus"> 
			<c:forEach items="${agreementMem_sign}" var="sign" varStatus="index">  
				<td id="agreementStatus${index.count}"><div class="memSign tableTd tableSign" style="background-image:url('/resources/memsign/${sign }')"></div></td>                            
			</c:forEach>
			<c:forEach var="i" begin="${countB }" end="${lastAstPriorityOfB}" step="1">
				<td id="agreementStatus${i}"  class="tableTd tableSign">as</td>
			</c:forEach>
		</tr>
		<tr>
			<th class="tableTh">시행자</th>
			<td colspan="5">${implementMemberName}</td>
		</tr>
		<tr>
			<th class="tableTh">수신 및 참조</th>
			<td colspan="5">${referenceMemberName}</td>
		</tr>
		<tr>
			<th class="tableTh">시행일자</th>
			<td colspan="5">${eaVO.ea_startdate } ~ ${eaVO.ea_enddate}</td>
		</tr>
		<tr>
			<th class="tableTh">제목</th>
			<td colspan="5">${eaVO.ea_title }</td>
		</tr>
		<tr>
			<th colspan="6">내용</th>
		</tr>
		<tr>
			<td colspan="6">
				${eaVO.ea_content }
			</td>	
		</tr>
	</table>
</div>