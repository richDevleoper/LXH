package kr.freedi.dev.code.service;

import java.util.List;

import javax.annotation.Resource;

import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.common.dao.DefaultDAO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : cms_10_oracle
 * @file 	: CodeService.java
 * @author	: ParkDongHee
 * @date	: 2014. 9. 3. 오후 9:03:40
 * @history	:
 * 
 * @comment : 
 * 
 * 
 * 
 */
@Service
public class CodeService {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	
	/**
	 * @method	: selectFullList
	 * @date	: 2017. 2. 20.
	 * @author	: pdh
	 * @comment	: set condition [codeGrpId, actFlg]
	 * @history	: 
	 * @param	: 
	 * @return	: List<EgovMap>
	 */
	public List<EgovMap> selectFullList(CodeVO codeVO) {
		return dao.selectList("Code.selectFullList", codeVO);
	}
	
	public CodeVO select(CodeVO codeVO) {
		return (CodeVO) dao.selectOne("Code.select", codeVO);
	}
	
	public String selectRule(String comNo) {
		return (String) dao.selectOne("Code.selectRuleNo", comNo);
	}
	
	public Integer insert(CodeVO codeVO) {
		return (Integer)dao.insert("Code.insert", codeVO);
	}

	public Integer update(CodeVO codeVO) {
		return (Integer)dao.update("Code.update", codeVO);
	}

	public Integer delete(CodeVO codeVO) {
		return (Integer)dao.delete("Code.delete", codeVO);
	}
	
	public Integer deleteByCodeGrpId(CodeVO codeVO) {
		return (Integer)dao.delete("Code.deleteByCodeGrpId", codeVO);
	}
}
