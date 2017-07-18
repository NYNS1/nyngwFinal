<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	글쓰기페이지
	<form action="/businessSupport/dutyDocument/personalWrite">
		<table class="table table-bordered">
			<tr>
				<th>보고유형</th>
				<td>
					<select name="dd_code_number">
						<option value="code1">일일일지</option>
						<option value="code2">주간일지</option>
						<option value="code3">월간일지</option>
					</select>
				</td>
				<th>업무일</th>
				<td>${writeDate}</td>
				<th>공개여부</th>
				<td>
					&nbsp;&nbsp;<input type="checkbox" name="dd_public" value="y">&nbsp;&nbsp;내용공개
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="5"><input type="text" name="dd_title"></td>
			</tr>
			<tr>
				<td colspan="6">
					<textarea rows="10" cols="99"  style="resize: none;" name="dd_content"></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="등록">
		<button><a href="/businessSupport/dutyDocument/personal">취소</a></button>
	</form>
</body>
</html>