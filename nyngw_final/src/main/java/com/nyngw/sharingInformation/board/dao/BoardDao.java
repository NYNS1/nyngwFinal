package com.nyngw.sharingInformation.board.dao;

import java.util.List;

import com.nyngw.dto.BoardVO;

public interface BoardDao {
	public List<BoardVO> selectList();
	public List<BoardVO> selectBoardList(int firstRow, int endRow);
	public List<BoardVO> selectTitleList(int firstRow, int endRow, String val);
	public List<BoardVO> selectWriteList(int firstRow, int endRow, String val);
	public int selectBoardCount();
	public BoardVO selectBoard(String board_number);
	public String selectMax();
	public void boardUpdate(BoardVO board);
	public void boardInsert(BoardVO board);
}
