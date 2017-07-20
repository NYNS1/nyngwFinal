<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
   function file_change(file){
   var str=file.lastIndexOf("\\")+1;   //파일 마지막 "\" 루트의 길이 이후부터 글자를 잘라 파일명만 가져온다.
   file = file.substring(str, file.length);
   document.getElementsByName('board_file_name')[0].value=file;
}
</script>
	<h1>공지사항 등록폼</h1>
	<div>
		<form enctype="multipart/form-data" name="tx_editor_form" style="width: 750px;" id="tx_editor_form" action="nmWrite" method="POST" accept-charset="utf-8">
			<table class="table table-bordered">
				<tr>
					<th>게시판종류</th>
					<td>공지사항</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="board_title"></td>
				</tr>
				<tr>
					<th colspan="2">내용</th>
				</tr>
			</table>
			<jsp:include page="/WEB-INF/views/common/daumOpenEditor/editor.jsp" flush="false"/>
			<table class="table table-bordered">
				<tr>
					<th>첨부파일</th>
					<td colspan="3">
						<input type="file" name="board_file_name" onchange="javascript:file_change(this.value);">
					</td>
				</tr>
			</table>
			<input type="hidden" name = "page" value="${page}">
			<div><button onclick='saveContent()'>등록</button></div>
			<input type="reset" value="초기화" />	
			<div style="text-align: center;">
				<button type="button"><a href="/sharingInformation/noticeMatter/nmList?page=${page }">취소</a></button>
			</div>
		</form>
	</div>
