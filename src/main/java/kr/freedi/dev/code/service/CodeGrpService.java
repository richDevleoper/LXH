package kr.freedi.dev.code.service;

import java.util.List;

import javax.annotation.Resource;

import kr.freedi.dev.code.domain.CodeGrpSearchVO;
import kr.freedi.dev.code.domain.CodeGrpVO;
import kr.freedi.dev.code.domain.CodeVO;
import kr.freedi.dev.common.dao.DefaultDAO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : cms_10_oracle
 * @file 	: CodeGrpService.java
 * @author	: ParkDongHee
 * @date	: 2014. 9. 3. 오후 9:03:54
 * @history	:
 * 
 * @comment : 
 * 
 * 
 * 
 */
@Service
public class CodeGrpService {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	@Resource(name="codeService")
	private CodeService codeService;
	
	
	public List<EgovMap> selectList(CodeGrpSearchVO searchVO) {
		return dao.selectList("CodeGrp.selectList", searchVO);
	}
	
	public int selectListCount(CodeGrpSearchVO searchVO) {
		return (Integer) dao.selectOne("CodeGrp.selectListCount", searchVO);
	}
	
	/**
	 * @method	: selectFullList
	 * @date	: 2017. 2. 20.
	 * @author	: pdh
	 * @comment	: set condition [actFlg, attr]
	 * @history	: 
	 * @param	: 
	 * @return	: List<EgovMap>
	 */
	public List<EgovMap> selectFullList(CodeGrpVO codeGrpVO) {
		return dao.selectList("CodeGrp.selectFullList", codeGrpVO);
	}
	
	public CodeGrpVO select(CodeGrpVO codeGrpVO) {
		return (CodeGrpVO) dao.selectOne("CodeGrp.select", codeGrpVO);
	}
	
	public void insert(CodeGrpVO codeGrpVO) {
		dao.insert("CodeGrp.insert", codeGrpVO);
	}

	public void update(CodeGrpVO codeGrpVO) {
		dao.update("CodeGrp.update", codeGrpVO);
	}

	public void delete(CodeGrpVO codeGrpVO) {
		
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGrpId(codeGrpVO.getCodeGrpId());
		
		if(codeService.deleteByCodeGrpId(codeVO) != -1){//코드 삭제
			dao.delete("CodeGrp.delete", codeGrpVO);//코드그룹 삭제
		}
	}
}
