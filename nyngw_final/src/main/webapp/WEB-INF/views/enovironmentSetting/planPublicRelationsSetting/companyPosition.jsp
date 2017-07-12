<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!-- 환경설정관리 -> 기획홍보부 설정 ->회사 직급 설정
에 대한 화면 -->

<h2>회사 직급 설정</h2>
<p>
	회사의 직급을 등록하거나 수정하실 수 있으며, 위 아래 버튼을 눌러 위치를 변경하실 수 있습니다.
	ex) 부장, 과장, 대리, 사원 등
</p>
<div class="row">
	<h4>직급 만들기</h4>
	<div class="col-md-12">
		<table class="table">
			<form class="inline-form">
				<tr>
					<th>직급명</th>
					<td>
						<input type="text" id="position_name" name="position_name">
						<input type="submit" value="직급 등록" action="insertPosition_go();"/>
					</td>
				</tr>
			</form>
		</table>
	</div>
</div>

<div class="row">
	<h4>직급 만들기</h4>
	<div class="col-md-12">
		<table class="table">
			<form class="inline-form">
				<tr>
					<th>No</th>
					<th>직급</th>
					<th>위치변경</th>
					<th>관리</th>
				</tr>
				
				<tr>
					<td>1</td>
					<td>사장</td>
					<td>
						<input type="submit" value="▲위로" class="btn btn-default" action="upPoNum_go();"/> 
						<input type="submit" value="▲아래로" class="btn btn-default" action="downPoNum_go();"/> 
					</td>
					<td>
						<input type="submit" value="직급 수정" onclick="updatePosition_go();"/>
						<input type="submit" value="직급 삭제" onclick="deletePosition_go();"/>
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td>부사장</td>
					<td>
						<input type="submit" value="▲위로" class="btn btn-default" action="upPoNum_go();"/> 
						<input type="submit" value="▲아래로" class="btn btn-default" action="downPoNum_go();"/> 
					</td>
					<td>
						<input type="submit" value="직급 수정" onclick="updatePosition_go();"/>
						<input type="submit" value="직급 삭제" onclick="deletePosition_go();"/>
					</td>
				</tr>
			</form>
		</table>
	</div>
</div>

<script>
	function updatePosition_go(){
		alert("직급수정!!");

		var url = "/enovironmentSetting/positionPopupForm";
	    
	    cw=screen.availWidth;     //화면 넓이
	    ch=screen.availHeight;    //화면 높이
	
	    sw=600;    //띄울 창의 넓이
	    sh=650;    //띄울 창의 높이
	
	    ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
	    mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
	
	    window.open(
	       url,
	       "_blank_1",
	       "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width="
	       +sw+",height="+sh+",top="+mt+",left="+ml
	    );
	}
	function deletePosition_go(){
		alert("직급삭제!!");
	}
</script>