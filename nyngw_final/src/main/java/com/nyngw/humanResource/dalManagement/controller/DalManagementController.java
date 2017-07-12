package com.nyngw.humanResource.dalManagement.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nyngw.dto.FN_GETDALCNT;
import com.nyngw.dto.Member_ViewVO;
import com.nyngw.humanResource.dalManagement.service.DalManagementServiceImpl;

@Controller
@RequestMapping("/humanResource/dalManagement")
public class DalManagementController {

	@Autowired
	DalManagementServiceImpl dalManagementService;
	
	private List<Member_ViewVO> excelMemberList;
	private List<FN_GETDALCNT> excelCountTotal;
	
	@RequestMapping("/hrm")
	public String hrm(@DateTimeFormat(pattern="yyyy-MM-dd")String startdal_date,@DateTimeFormat(pattern="yyyy-MM-dd")String enddal_date,
			String mem_name, Model model){
		Member_ViewVO dil = new Member_ViewVO();
		FN_GETDALCNT fncnt = new FN_GETDALCNT();
		
		if(startdal_date==null){
			Date date = new Date();
			startdal_date=date.getYear()+1900+"-"+(date.getMonth()+1)+"-"+date.getDate();
			enddal_date= startdal_date;
		}
		
		dil.setMem_name(mem_name);
		dil.setStartdal_date(startdal_date);
		dil.setEnddal_date(enddal_date);
		fncnt.setDept_startdate(startdal_date);
		fncnt.setDept_enddate(enddal_date);
		
		List<Member_ViewVO> memdalList = dalManagementService.searchContent(dil);
		List<FN_GETDALCNT> countTotal = dalManagementService.positionAllCount(fncnt);
		
		excelMemberList = memdalList;
		excelCountTotal = countTotal;
		
		model.addAttribute("startdal_date", startdal_date);
		model.addAttribute("enddal_date", enddal_date);
		model.addAttribute("memdalList", memdalList);
		model.addAttribute("countTotal", countTotal);
		
		return "humanResource/dalManagement/hrm";
	}
	
	@RequestMapping("/excelMemberRank")
	public String pageRank(Model model){
		
		model.addAttribute("memberList", excelMemberList);
		
		return "memberExcelViewHR";
	}
	
	@RequestMapping("/excelCountRank")
	public String pageCountRank(Model model){
		
		model.addAttribute("memberList", excelCountTotal);
		
		return "countExcelViewHR";
	}
	
}
