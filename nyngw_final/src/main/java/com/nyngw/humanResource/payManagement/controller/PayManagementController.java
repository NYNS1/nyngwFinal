package com.nyngw.humanResource.payManagement.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nyngw.dto.BoardListViewVO;
import com.nyngw.dto.BoardVO;
import com.nyngw.dto.Board_SelectVO;
import com.nyngw.dto.DepartmentVO;
import com.nyngw.dto.DepartmentViewVO;
import com.nyngw.dto.MemberVO;
import com.nyngw.dto.Member_payVO;
import com.nyngw.dto.Member_pay_PageViewVO;
import com.nyngw.environmentSetting.planPublicRelationsSetting.service.PlanPublicRelationsSettingServiceImpl;
import com.nyngw.humanResource.payManagement.service.PayManagementServiceImpl;

@Controller
@RequestMapping("/humanResource/payManagement")
public class PayManagementController {
	
	private static final int PAGE_NUMBER_COUNT_PER_PAGE = 5;
	
	@Autowired
	private PayManagementServiceImpl payManagementService;
	
	/**
	 * 처음 급여리스트 검색 버튼을 눌러 들어오면 빈 리스트 화면 url을 반환하는 메서드
	 * 처음 급여리스트 검색에 들어가면 빈 리스트와 검색 할 수 있는 search 만있고 검색하면
	 * 해당 이름을 가진 회원이 리스트에 뿌려지는것 
	 * @return 빈 리스트 url 반환
	 */
	@RequestMapping("/pmm")
	public String pmm(
			Model model, 
			@RequestParam(value="page",defaultValue="1") int pageNumber,
			String mem_name,
			String dept_name,
			String mp_pay_date
			){
		try {
			if(mem_name==null){
				mem_name="";
			}
			if(dept_name==null){
				dept_name="";
			}
			if(mp_pay_date==null){
				mp_pay_date ="";
			}
			if(mp_pay_date.length()==7){
				mp_pay_date = mp_pay_date.substring(2,4)+"/"+mp_pay_date.substring(5);
			}
			payManagementService.viewPmmList(pageNumber,model,mem_name,dept_name,mp_pay_date);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "humanResource/payManagement/pmm";
	}
	
	//급여 수정
	@RequestMapping("/updateMPajax")
	public @ResponseBody Map<String,Object> updateMPajax(Model model,
			String mp_number, String mp_bonus, String position_number){
		
		Map<String, Object> map = new HashMap<String, Object>();
		int result = -1;
		
		try {
			result = payManagementService.modifyPayMember(model,mp_number,mp_bonus,position_number);
			Member_payVO vo = payManagementService.getMemberPayOne(model,mp_number);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		map.put("result", result);
//		map.put("bonus", );
//		map.put("result", result);
		return map;
	}
	
	//급여 등록 전-부서리스트 가져오기
	@RequestMapping("/viewMPDeptjax")
	public @ResponseBody List<Map<String,String>> viewDeptjax(Model model){
		
		List<Map<String,String>> mapList = null;
		try {
			mapList = payManagementService.viewDeptJsonList(model);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mapList;
	}
	
}
