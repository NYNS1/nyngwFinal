<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<insert id="SI_insertSchedule" parameterType = "com.nyngw.dto.ScheduleVO">
	insert into Schedule 
	values ('sc'||sc_seq.nextVal, #{SC_TITLE},#{SC_CONTENT},#{SC_DATE}, #{SC_TIME},'',#{SC_MEM_NUMBER},#{SC_CODE_NUMBER});
</insert>
									제목  		내용			날짜(yyyy-MM-dd)형식	시간(string) 작성자		개인/부서/회사 뭔지 (code4,5,6)


<form>
	<label>&nbsp;&nbsp;월간일정&nbsp;&nbsp;</label><input type="radio" name="1" value="">
	<label>&nbsp;&nbsp;주간일정&nbsp;&nbsp;</label><input type="radio" name="1" value="">
	<label>&nbsp;&nbsp;일일일정&nbsp;&nbsp;</label><input type="radio" name="1" value="" checked="checked">
	
	<table class="table table-bordered">
		<tr>
		    <th>일정시간</th>
			<td style="text-align: center">시작
				<select name="startTime">
					<option value="9">09:00</option>
					<option value="10">10:00</option>
					<option value="11">11:00</option>
					<option value="12">12:00</option>
					<option value="13">13:00</option>
					<option value="14">14:00</option>
					<option value="15">15:00</option>
					<option value="16">16:00</option>
					<option value="17">17:00</option>
					<option value="18">18:00</option>
				</select>
			종료
				<select name="lastTime">
					<option value="10">10:00</option>
					<option value="11">11:00</option>
					<option value="12">12:00</option>
					<option value="13">13:00</option>
					<option value="14">14:00</option>
					<option value="15">15:00</option>
					<option value="16">16:00</option>
					<option value="17">17:00</option>
					<option value="18">18:00</option>
					<option value="19">19:00</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>일정명</th>
			<td style="text-align: center"><input type="text"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td style="text-align: center">
				<textarea rows="10" cols="60" style="resize: none;">
				
				</textarea>
			</td>
		</tr>
	</table>
	<button><a href="/sharingInformation/scheduleManagement/schedule">등록</a></button>
	<button><a href="/sharingInformation/scheduleManagement/schedule">취소</a></button>
</form>
