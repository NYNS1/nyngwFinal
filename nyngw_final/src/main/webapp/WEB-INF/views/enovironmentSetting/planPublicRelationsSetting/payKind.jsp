<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 환경설정관리 -> 기획홍보부 설정 -> 급여 정책 설정에 대한 화면 -->

<script>
	//급여종류 등록
	function insert_payKind_go(){
		
		if(!document.getElementById("pk_name").value){
			alert("급여 이름을 입력해야 합니다.");
			return;
		}
		
		document.payKindInsertForm.action= "<%=request.getContextPath()%>/enovironmentSetting/planPublicRelationsSetting/insertPayKind";
		document.payKindInsertForm.method = "post";
		document.payKindInsertForm.submit();
	}

	//급여정책 등록
	function insert_payPolicy_go(){
		
		if(!document.getElementById("pp_pay").value){
			alert("금액 또는 비율을 입력해야 합니다.");
			return;
		}
		
		document.payPolicyInsertForm.action= "<%=request.getContextPath()%>/enovironmentSetting/planPublicRelationsSetting/insertPayPolicy";
		document.payPolicyInsertForm.method = "post";
		document.payPolicyInsertForm.submit();
	}
	
	//급여종류 수정
	function update_payKind_go(){
		
		if(!document.getElementById("up_pk_number").value){
			alert("급여 이름을 입력해야 합니다.");
			return;
		}
		if(!document.getElementById("up_pk_name").value){
			alert("급여 이름을 입력해야 합니다.");
			return;
		}
		if(!document.getElementById("up_pk_tax").value){
			alert("급여 이름을 입력해야 합니다.");
			return;
		}
		
		document.payKindUpdateForm.action= "<%=request.getContextPath()%>/enovironmentSetting/planPublicRelationsSetting/updatePayKind";
		document.payKindUpdateForm.method = "post";
		document.payKindUpdateForm.submit();
	}
	
	//급여정책 삭제
	function deletePayPolicy_go(){
		
		var con_test = confirm("정말로 삭제하시겠습니까?");
	      if(con_test==true){
				document.deletePayPolicyForm.action= "<%=request.getContextPath()%>/enovironmentSetting/planPublicRelationsSetting/deletePayPolicy";
				document.deletePayPolicyForm.method = "post";
				document.deletePayPolicyForm.submit();
	      }
		
		
	}
	
	//급여종류 팝업창 열기(데이터넘기기)
	$(function(){
		
		//급여종류 수정 창 숨기기
		$('#updatePayKindBox').css('display', 'none');
		
		//부서 수정 보여주기
		$(".payKindPopupBtn").click(function(){
			var tmp = $(this).siblings('input').val();
			$.ajax({
				url:'/enovironmentSetting/planPublicRelationsSetting/checkPayKindOne',
				type:'get',
				data: {'tmp_pk_number' : tmp},
				success : function(res){
					$('#up_pk_number').val(res.pk_number);				
					$('#up_pk_name').val(res.pk_name);				
					$('#up_pk_tax').children().each(function(){
						if($(this).val()==res.pk_tax){
							$(this).prop('selected','selected');
						}
					});
				},
				dataType : 'json'
			})
			
			$('#updatePayKindBox').dialog({
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
		
		
		//시간당급여 금액 변경 클릭 / 기본급까지 변경됨!
		$('.UpdatePayPolicyHourBtn').click(function(){
			var pp_number = $(this).siblings('input#up_hour_pp_number').val();
			var pp_pay = $(this).siblings('input#up_hour_pp_pay').val();
			
			$.ajax({
				url:'/enovironmentSetting/planPublicRelationsSetting/updatePayPolicyHour',
				type:'get',
				data: {
					'pp_number' : pp_number,
					'pp_pay' : pp_pay
				},
				success : function(res){
					if(res.result>0){
						var check = confirm('시간당 급여 변경에 성공했습니다.');
						if(check==true){
							location.href="<%=request.getContextPath()%>/enovironmentSetting/planPublicRelationsSetting/salaryForm";
						}
						
					}else{
						alert('시간당 급여 변경에 실패했습니다.');
					}
				},
				dataType : 'json'
			})
		})
		
		//직책수당 금액 변경 클릭
		$('.UpdatePayPolicyPosBtn').click(function(){
			var pp_number = $(this).siblings('input#up_pos_pp_number').val();
			var pp_pay = $(this).siblings('input#up_pos_pp_pay').val();
			
			$.ajax({
				url:'/enovironmentSetting/planPublicRelationsSetting/updatePayPolicyPos',
				type:'get',
				data: {
					'pp_number' : pp_number,
					'pp_pay' : pp_pay
				},
				success : function(res){
					if(res.result>0){
						alert('직책수당 금액 변경에 성공했습니다.');
					}else{
						alert('직책수당 금액 변경에 실패했습니다.');
					}
				},
				dataType : 'json'
			})
		})
		
		//모든 직급에 적용되는 급여정책 금액 변경 클릭
		$('.UpdatePayPolicyAllposBtn').click(function(){
			var pp_number = $(this).parents().siblings().children('input#up_allpos_pp_number').val();
			var pp_pay = $(this).parents().siblings().children('input#up_allpos_pp_pay').val();
			
			$.ajax({
				url:'/enovironmentSetting/planPublicRelationsSetting/updatePayPolicyAllPos',
				type:'get',
				data: {
					'up_all_pp_number' : pp_number,
					'up_all_pp_pay' : pp_pay
				},
				success : function(res){
					if(res.result>0){
						alert('금액 변경에 성공했습니다.');
					}else{
						alert('금액 변경에 실패했습니다.');
					}
				},
				dataType : 'json'
			})
		})
		
	})
</script>

<!-- 급여종류 수정 팝업 -->
<div class="row" id="updatePayKindBox">
	<h4>급여 종류 수정하기</h4>
	<table class="table">
		<form class="form-inline" name="payKindUpdateForm">
			<tr>
				<th>급여 종류</th>
				<td>
					<input type="hidden" id="up_pk_number" name="up_pk_number" class="form-control"/>
					<input type="text" id="up_pk_name" name="up_pk_name" class="form-control"/>
				</td>
			</tr>
			<tr>
				<th>공제여부</th>
				<td>
					<select name="up_pk_tax" id="up_pk_tax" class="form-control">
						<option value="n">공제 X(급여인 경우)</option>
						<option value="y">공제 O(세금인 경우)</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" class="btn btn-default" onclick="update_payKind_go();" value="수정하기"/>
				</td>
			</tr>
		</form>
	</table>
</div>

<h2>급여정책 설정</h2>

<div class="row">
	<div class="col-md-6">
		
		<h4>급여 종류 설정</h4>
		<table class="table">
			<tr>
				<th>No</th>
				<th>종류</th>
				<th>공제여부</th>
				<th> </th>
			</tr>
			<c:forEach var="payKind" varStatus="status" items="${payKindList}" >
				<form>
					<tr>
						<td>${status.count}</td>
						<td>${payKind.pk_name}</td>
						<c:choose>
							<c:when test="${payKind.pk_tax=='n'}">
								<td>해당없음</td>
							</c:when>
							<c:otherwise>
								<td>공제됨</td>
							</c:otherwise>
						</c:choose>
						<td>
							<c:choose>
							<c:when test="${payKind.pk_number=='pk1'||payKind.pk_number=='pk2'||payKind.pk_number=='pk3'}">
								수정불가
							</c:when>
							<c:otherwise>
								<input type="hidden" name="pk_number" value="${payKind.pk_number}"/>
								<input type="button" value="수정" class="btn btn-default payKindPopupBtn">
								<a href="<%=request.getContextPath()%>/enovironmentSetting/planPublicRelationsSetting/deletePayKind?del_pk_number=${payKind.pk_number}" class="btn btn-default">삭제</a>
							</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</form>
			</c:forEach>
		</table>
	</div>
	
	
	<div class="col-md-6">
		<h5>급여 종류 추가하기</h5>
		<form class="form-inline" name="payKindInsertForm">
			<div class="form-group">
				<input type="text" name="pk_name" id="pk_name" class="form-control inlinePayText"/>
				<select name="pk_tax" class="form-control">
					<option value="n">공제 X(급여인 경우)</option>
					<option value="y">공제 O(세금인 경우)</option>
				</select>
				<input type="button" class="btn btn-default" onclick="insert_payKind_go();" value="등록"/>		
			</div>
		</form>
		
		<h5>급여 정책 추가하기</h5>
		<table class="table">
			<form class="form-inline" name="payPolicyInsertForm">
				<tr>
					<th>급여 종류 선택</th>
					<td>
						<select name="pp_pk_number" class="form-control">
							<c:forEach var="payKind" items="${payKindList}">
								<option value="${payKind.pk_number}">${payKind.pk_name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>직책 선택</th>
					<td>
						<select name="pp_position_number" class="form-control">
							<c:forEach var="position" items="${positionList}">
								<option value="${position.position_number}">${position.position_name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>근무시간 선택</th>
					<td>
						<select name="pp_wt_number" class="form-control">
							<c:forEach var="wt" items="${wtList}">
								<option value="${wt.wt_number}">${wt.wt_name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>
						금액 or 비율 입력<br/>
						금액 : ex)10000<br/>
						비율 : ex)0.5
					</th>
					<td>
						<input type="text" name="pp_pay" id="pp_pay" class="form-control"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" class="btn btn-default" onclick="insert_payPolicy_go();" value="등록"/>		
					</td>
				</tr>
			</form>
		</table>
		
		<h5>급여 정책 삭제하기</h5>
		<p>기본적으로 설정되어있는 급여정책(시간당시급,기본급,직책수당) 외의 급여정책을 삭제할 수 있습니다.</p>
		<form name="deletePayPolicyForm" class="inline-form">
			<select name="del_pp_number" class="form-control" style="display:inline-block; width:200px;">
				<c:forEach var="pp" items="${payViewList}" varStatus="status">
					<c:choose>
						<c:when test="${pp.pk_number =='pk1' || pp.pk_number=='pk2' || pp.pk_number=='pk3'}">
						</c:when>
						<c:otherwise>
							<option value="${pp.pp_number}">
								${pp.pk_name} / ${pp.position_name} / 
								<fmt:formatNumber value="${pp.pp_pay}" pattern="###########0.###" />
							</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
			<input type="button" class="btn btn-default" onclick="deletePayPolicy_go();" value="삭제"/>
		</form>
	</div>
</div>


<div class="row">
	<h4>직급별 급여정책 설정</h4>
	<p>직급별로 급여를 설정합니다</p>
	<div class="col-md-4">
		<table class="table">
			<tr>
				<th>No</th>
				<th>직급</th>
				<th>시간당 시급</th>
			</tr>
			<c:forEach var="payHourView" varStatus="status" items="${payViewHourList}">
				<tr>
					<form class="form-inline" name="payPolicyHourForm">
						<td>${status.count}</td>
						<td>${payHourView.position_name}</td>
						<td>
							<input type="hidden" id="up_hour_pp_number" name="up_basic_pp_number" value="${payHourView.pp_number}" class="form-control inlinePayText"/>
							<input type="text" id="up_hour_pp_pay" name="up_basic_pp_pay" value="<fmt:formatNumber value="${payHourView.pp_pay}" pattern="##########"/>" class="form-control inlinePayText"/>
							<input type="button" class="btn btn-default UpdatePayPolicyHourBtn" value="수정"/>
							
						</td>
					</form>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div class="col-md-4">
		<table class="table">
			<tr>
				<th>No</th>
				<th>직급</th>
				<th>기본급<br/>(시간당 시급*209시간)</th>
			</tr>
			<c:forEach var="payBasicView" varStatus="status" items="${payViewBasicList}">
				<tr>
					<form class="form-inline" name="payPolicyBasicPosForm" method="post">
						<td>${status.count}</td>
						<td>${payBasicView.position_name}</td>
						<td>
							<fmt:formatNumber value="${payBasicView.pp_pay}" type="currency" currencySymbol="￦"/>
						</td>
					</form>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div class="col-md-4">
		<table class="table">
			<tr>
				<th>No</th>
				<th>직급</th>
				<th>직책수당</th>
			</tr>
			<c:forEach var="payPosView" varStatus="status" items="${payViewPositionList}">
				<tr>
					<form class="form-inline" name="payPolicyPosForm">
						<td>${status.count}</td>
						<td>${payPosView.position_name}</td>
						<td>
							<input type="hidden" id="up_pos_pp_number" name="up_pos_pp_number" value="${payPosView.pp_number}" class="form-control inlinePayText"/>
							<input type="text" id="up_pos_pp_pay" name="up_pos_pp_pay" value="<fmt:formatNumber value="${payPosView.pp_pay}" pattern="##########"/>" class="form-control inlinePayText"/>
							<input type="button" class="btn btn-default UpdatePayPolicyPosBtn" value="수정"/>
						</td>

					</form>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<div class="row">
	<div class="col-md-6">
		<h4>전체 급여정책 설정</h4>
		<p>회사원 전체에게 동일하게 적용되는 급여를 설정합니다.</p>
		<table class="table">
			<tr>
				<th>No</th>
				<th>급여 정책 이름</th>
				<th colspan="2">금액</th>
			</tr>
			<c:forEach var="payView" varStatus="status" items="${payViewList}">
				<c:if test="${payView.pp_position_number=='position0' && payView.pk_tax=='n'}">
					<tr>
						<form name="payAllPosUpdateForm">
							<td>${status.index }</td>
							<td>${payView.pk_name }</td>
							<td>
								<input type="text" class="form-control" value="<fmt:formatNumber value="${payView.pp_pay}" pattern="##########"/>" name="up_allpos_pp_pay" id="up_allpos_pp_pay"/>
								<input type="hidden" class="form-control" value="${payView.pp_number}" name="up_allpos_pp_number" id="up_allpos_pp_number"/>
							</td>
							<td><input type="button" class="btn btn-default UpdatePayPolicyAllposBtn" value="금액 수정"/></td>
						</form>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
	<div class="col-md-6">
		<h4>4대 보험 설정</h4>
		<table class="table">
			<tr>
				<th>No</th>
				<th>이름</th>
				<th>비율</th>
			</tr>
			<c:forEach var="payView" varStatus="status" items="${payViewList}">
				<c:if test="${payView.pp_position_number=='position0' && payView.pk_tax=='y'}">
					<form name="payTaxUpdateForm">
						<tr>
							<td>${status.index }</td>
							<td>${payView.pk_name }</td>
							<td>
								<fmt:formatNumber value="${payView.pp_pay}" pattern="##0.000%" />
							</td>
						</tr>
					</form>
				</c:if>
			</c:forEach>
		</table>
	</div>
</div>


<h2>퇴직금정책 설정</h2>

<table class="table">
	<form class="form-inline" action="paySetting_go();" method="post">
		<tr>
			<th>적용되는 경우</th>
			<td>근속연수가 1년 이상(365일)인 경우에 퇴직금을 지급합니다.</td>
		</tr>
		<tr>
			<th>계산 방법</th>
			<td>(직전 3개월치의 급여 / 3개월치의 날짜) * 30일</td>
		</tr>
	</form>
</table>

