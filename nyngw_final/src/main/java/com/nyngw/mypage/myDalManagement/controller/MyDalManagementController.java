package com.nyngw.mypage.myDalManagement.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nyngw.dto.Board_SelectVO;
import com.nyngw.dto.DalListViewVO;
import com.nyngw.mypage.myDalManagement.MyAttendedListView;
import com.nyngw.mypage.myDalManagement.MyVacationListView;
import com.nyngw.mypage.myDalManagement.service.MyDalManagementServiceImpl;

@Controller
@RequestMapping("/mypage/myDalManagement")
public class MyDalManagementController {
	
	@Autowired
	private MyDalManagementServiceImpl myDalManagementService;
	
	private static final int PAGE_NUMBER_COUNT_PER_PAGE = 5;
	
	/**
	 * 출결보기 버튼을 누를시 화면전환 url을 보내주는 메서드
	 * @return	출결보기url 반환
	 */
	
	
	@RequestMapping("/attended")
	public String boardList1(@RequestParam(value="page",defaultValue="1")int pageNumber,
			Model model,String val, String index){
		Board_SelectVO select = new Board_SelectVO();
		if(val!=null && !val.equals("")){
			select.setIndex(index);
			select.setVal(val);
		}
		MyAttendedListView viewData = (MyAttendedListView) myDalManagementService.selectAttendList(pageNumber, select);
	
		model.addAttribute("viewData",viewData);
		model.addAttribute("pageNumber",pageNumber);
		if(val!=null && !val.equals("")){
			model.addAttribute("select",select);
		}
		
		if(viewData.getPageTotalCount()>0){
			int beginPageNumber = (viewData.getCurrentPageNumber()-1)/PAGE_NUMBER_COUNT_PER_PAGE*PAGE_NUMBER_COUNT_PER_PAGE+1;
			int endPageNumber = beginPageNumber+ PAGE_NUMBER_COUNT_PER_PAGE-1;
			if(endPageNumber > viewData.getPageTotalCount()){
				endPageNumber = viewData.getPageTotalCount();
			}
			model.addAttribute("perPage", PAGE_NUMBER_COUNT_PER_PAGE);	//페이지 번호의 갯수
			model.addAttribute("end", viewData.getAttendedList().size()-1);//마지막 페이지
			model.addAttribute("beginPage", beginPageNumber);	//보여줄 페이지 번호의 시작
			model.addAttribute("endPage", endPageNumber);		//보여줄 페이지 번호의 끝
		}
		return "mypage/myDalManagement/attended";
	}
	
	
	
	/**
	 * 휴가현황보기 버튼을 누를시 화면전환 url을 보내주는 메서드
	 * @return 휴가보기 url반환
	 */
	@RequestMapping("vacation")
	public String vacationCheck(@RequestParam(value="page",defaultValue="1")int pageNumber,
			Model model){
		MyVacationListView viewData = (MyVacationListView) myDalManagementService.selectVacationList(pageNumber); 
		
		model.addAttribute("viewData", viewData);
		model.addAttribute("pageNumber", pageNumber);
		return "mypage/myDalManagement/vacation";
	}
	
	
	
}
