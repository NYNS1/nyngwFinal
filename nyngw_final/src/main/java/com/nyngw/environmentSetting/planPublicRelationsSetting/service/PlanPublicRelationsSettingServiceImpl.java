package com.nyngw.environmentSetting.planPublicRelationsSetting.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.nyngw.dto.CompanyVO;
import com.nyngw.dto.DepartmentViewVO;
import com.nyngw.environmentSetting.planPublicRelationsSetting.dao.PlanPublicRelationsSettingDaoImpl;

@Service
public class PlanPublicRelationsSettingServiceImpl implements
		PlanPublicRelationsSettingService {
	
	@Autowired
	PlanPublicRelationsSettingDaoImpl planPublicRelationsSettingDao;
	
	/**
	 * 회사 정보를 입력하는 메서드
	 * @return CompanyVO
	 * @throws SQLException
	 */
	@Override
	public int joinCompanyInfo(CompanyVO vo) throws SQLException {
		int result = planPublicRelationsSettingDao.insertCompanyInfo(vo);
		return result;
	}
	
	/**
	 * 회사 정보를 수정하는 메서드
	 * @return CompanyVO
	 * @throws SQLException
	 */
	@Override
	public int modifyCompanyInfo(CompanyVO vo) throws SQLException {
		int result = planPublicRelationsSettingDao.updateCompanyInfo(vo);
		return result;
	}
	
	/**
	 * 회사 로고를 입력하는 메서드
	 * @param String(업로드된 로고의 패스)
	 * @return int
	 * @throws SQLException
	 */
	public int joinCompanyLogo(String company_logo) throws SQLException {
		int result = planPublicRelationsSettingDao.insertCompanyLogo(company_logo);
		return result;
	}
	
	/**
	 * 회사 로고를 업데이트하는 메서드
	 * @param String(업로드된 로고의 패스),String(회사번호)
	 * @return int
	 * @throws SQLException
	 */
	public int modifyCompanyLogo(String company_logo, String company_number) throws SQLException {
		int result = planPublicRelationsSettingDao.updateCompanyLogo(company_logo, company_number);
		return result;
	}

	@Override
	public void viewDeptInfo(Model model) throws SQLException {
		
		//회사 직급정보 
		ArrayList<DepartmentViewVO> dvList = planPublicRelationsSettingDao.selectDepartmentView();
		System.out.println("리스트 사이즈 : "+dvList.size());
		ArrayList<DepartmentViewVO> upperMemList = planPublicRelationsSettingDao.selectDepartmentView();
		System.out.println("리스트 사이즈 : "+upperMemList.size());
		
		model.addAttribute("dvList",dvList);
		model.addAttribute("upperMemList",upperMemList);
	}

}
