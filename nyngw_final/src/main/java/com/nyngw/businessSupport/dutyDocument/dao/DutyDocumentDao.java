package com.nyngw.businessSupport.dutyDocument.dao;

import java.util.List;

import com.nyngw.dto.Board_SelectVO;
import com.nyngw.dto.Common_CodeVO;
import com.nyngw.dto.Duty_DocumentVO;

public interface DutyDocumentDao {
	public int selectDocumentCount_DD();
	public List<Duty_DocumentVO> selectDocumentList_DD(int firstRow, int endRow, Board_SelectVO select);
	public int documentSelectCount_DD(Board_SelectVO select);
	public Common_CodeVO documentSelectCodeName_DD(String reportType);
}
