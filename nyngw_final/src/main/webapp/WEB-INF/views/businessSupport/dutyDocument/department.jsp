<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
�������� >> �������� >> �μ�������ȸ
	<div>
		<form action="/businessSupport/dutyDocument/department">
			<table class="table table-border">
				<tr>
					<th>�˻��Ⱓ</th>
					<td>
						<select name="searchDate" id="searchDate">
							<option value="today">����</option>
							<option value="week">1����</option>
							<option value="month">1����</option>
							<option value="trimester">3����</option>
						</select>
					</td>
					<th>��������</th>
					<td>
						<select name="reportType" id="reportType">
							<option value="">��ü</option>
							<option value="code1">��������</option>
							<option value="code2">�ְ�����</option>
							<option value="code3">��������</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>�˻��Է�</th>
					<td colspan="3">
						<select name="titleType">
							<option value="">��ü</option>
							<option value="dd_title">����</option>
							<option value="mem_name">�ۼ���</option>
						</select>
						<input type="text" name="val" value="">
					</td>
				</tr>
			</table>
				<input type="submit" value="�˻�">
		</form>
		<br>
		<br>
		<table class="table table-border">
			<tr>
				<th>��ȣ</th>
				<th>������</th>
				<th>����</th>
				<th>��������</th>
				<th>�ۼ���</th>
				<th>�����</th>
			</tr>
			<tr>
				<td>1</td>
				<td>2017.07.12</td>
				<td><a href="/businessSupport/dutyDocument/departmentDetail">���߳��׷����ַ�ǻ��⹰</a></td>
				<td>��������</td>
				<td>�躴��</td>
				<td>2017.07.12</td>
			</tr>
		</table>
	</div>
</body>
</html>