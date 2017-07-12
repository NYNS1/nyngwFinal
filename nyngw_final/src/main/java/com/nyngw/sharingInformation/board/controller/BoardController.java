package com.nyngw.sharingInformation.board.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nyngw.dto.BoardListViewVO;
import com.nyngw.dto.BoardVO;
import com.nyngw.sharingInformation.board.service.BoardServiceImpl;

@Controller
@RequestMapping("/sharingInformation/board")
public class BoardController {
	@Autowired
	private BoardServiceImpl boardService;
	
	/**
	 * 게시판 리스트 화면을 보여주는 url을 반환하는 메서드
	 * @return 게시판 리스트화면 url 반환
	 */
//	@RequestMapping("/list")
//	public String boardList(Model model){
//		List<BoardVO> boardList = boardService.selectList();
//		model.addAttribute("boardList", boardList);
//		return "sharingInformation/board/boardList";
//	}
	
	@RequestMapping("/list")
	public String boardList1(@RequestParam(value="page",defaultValue="1")int pageNumber,
			Model model,String val, String index){
		BoardListViewVO viewData = (BoardListViewVO) boardService.selectBoardList(pageNumber,"","");
		
	
		model.addAttribute("viewData",viewData);
		model.addAttribute("pageNumber",pageNumber);
		return "sharingInformation/board/boardList";
	}
	/**
	 * 특정게시물을 검색할때 제목이나 내용 작성자 등의 값을 가지고 있는 값을 가지고 검색된 리스트를 보여줄 url을 반환하는 메서드
	 * @return 검색된 리스트 url을 반환
	 */
//	@RequestMapping("/select")
	public String boardSelect(@RequestParam(value="page",defaultValue="1")int pageNumber,String val, String index, Model model){
		System.out.println(val);
		System.out.println(index);
		
		BoardListViewVO viewData = (BoardListViewVO) boardService.selectBoardList(pageNumber,val,index);
		
		
		model.addAttribute("viewData",viewData);
		model.addAttribute("pageNumber",pageNumber);
		return "sharingInformation/board/boardList";
	}
	
	/**
	 * 게시물을 등록하는 버튼을 누르면 등록하는 폼을 보여주는 url을 반환하는 메서드
	 * @return 등록양식폼 url 반환
	 */
	@RequestMapping("/writeForm")
	public String boardWriteForm(String page,Model model){
		model.addAttribute("page",page);
		System.out.println(page);
		return "sharingInformation/board/boardWriteForm";
	}
	
	/**
	 * 게시물에 대한 정보를 다 적은뒤 등록 버튼을 눌러 화면전환하는 url을 반환하는 메서드
	 * @return 등록 url 반환
	 */
	@RequestMapping("/write")
	public String boardWrite(BoardVO board,String page){//,Principal principal
//		System.out.println(principal.getName());
		boardService.boardInsert(board);
		return "redirect:/sharingInformation/board/list";
	}
	
	/**
	 * 등록된 게시물을 수정 버튼을 누르면 수정하는 폼을 보여주는 url을 반환하는 메서드
	 * @return 수정양식 폼 url 반환
	 */
	@RequestMapping("/updateForm")
	public String boardUpdateForm(String board_number, Model model,String page){
		BoardVO board = boardService.selectBoard(board_number);
		model.addAttribute("board", board);
		model.addAttribute("page",page);
		return "sharingInformation/board/boardUpdateForm";
	}
	
	/**
	 * 게시물 수정내용을 다 적은 뒤 수정버튼을 눌러 화면전환 url을 반환하는 메서드
	 * @return 수정 url 반환
	 */
	@RequestMapping("/update")
	public String boardUpdate(BoardVO board){
		boardService.boardUpdate(board);
		return "redirect:/sharingInformation/board/list";
	}
	
	/**
	 * 등록된 게시물을 삭제하기 버튼을 누르면 삭제하는 페이지(등록된 게시물의 비밀번호 같은 걸적는 화면)를 보여주는 url을 반환하는 메서드
	 * @return 삭제폼 url 반환
	 */
	@RequestMapping("7")
	public String boardDeleteForm(){
		
		return null;
	}
	
	/**
	 * 게시물 삭제 버튼을 눌러 화면전환 url을 반환하는 메서드
	 * @return url 반환
	 */
	@RequestMapping("8")
	public String boardDelete(){
		
		return null;
	}
	
	/**
	 * 등록된 게시물을 선택하면 내용을 상세히 볼수 있는 페이지의 url을 반환하는 메서드
	 * @return 게시물 상세페이지 url 반환
	 */
	@RequestMapping("detail")
	public String boardDetail(String board_number, Model model,String page){
		BoardVO board = boardService.selectBoard(board_number);
		model.addAttribute("board", board);
		model.addAttribute("page",page);
		return "sharingInformation/board/boardDetail";
	}
	
	/**
	 * 상세보기에서 목록보기 버튼을 누르거나 등록, 수정, 삭제 화면에서 취소버튼을 누르면 보던 리스트 페이지로 가는 url을 반환하는 메서드
	 * @return 자신이 보던 리스트 화면으로 돌아가는 url 반환
	 */
	@RequestMapping("cancle")
	public String cancleAndList(){
		
		return "sharingInformation/board/boardList";
	}
	
	/**
	 * 등록된 게시물에 댓글을 다는 페이지를 보여주기위한 url을 반환하는 메서드 
	 * @return 댓글쓰기 url 반환
	 */
	@RequestMapping("11")
	public String answerWriteForm(){
		
		return null;
	}
	
	/**
	 * 댓글을 전부 쓴뒤 등록 버튼을 눌러 화면전환 url을 반환하는 메서드 
	 * @return 등록 url 반환
	 */
	@RequestMapping("12")
	public String answerWrite(){
		
		return null;
	}
	
	/**
	 * 등록된 댓글을 삭제하는 페이지를 보여주기 위한 url을 반환하는 메서드
	 * @return 댓글삭제 url 반환
	 */
	@RequestMapping("13")
	public String answerDeleteForm(){
		
		return null;
	}
	
	/**
	 * 삭제시 버튼을 눌러 화면을 전환하는 url을 반환하는 메서드
	 * @return 삭제 url 반환
	 */
	@RequestMapping("14")
	public String answerDelete(){
		
		return null;
	}
	
	/**
	 * 등록된 댓글을 수정하는 페이지를 보여주기 위한 url을 반환하는 메서드
	 * @return 댓글수정 url 반환
	 */
	@RequestMapping("15")
	public String answerUpdateForm(){
		
		return null;
	}
	
	/**
	 * 수정할 내용을 다 입력한뒤 수정 버튼을 눌러 화면을 전환하는 url을 반환하는 메서드
	 * @return 수정 url 반환
	 */
	@RequestMapping("16")
	public String answerUpdate(){
		
		return null;
	}
	
}
