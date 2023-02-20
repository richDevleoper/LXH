package kr.freedi.dev.user.service;

import java.util.List;

import javax.annotation.Resource;

import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.menu.service.MenuUseService;
import kr.freedi.dev.user.domain.UserAuthSearchVO;
import kr.freedi.dev.user.domain.UserAuthVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: UserAuthService.java
 * @date	: 2017. 4. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service("userAuthService")
public class UserAuthService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	@Resource(name = "menuUseService")
	private MenuUseService menuUseService;
	
	@Resource(name = "mngrUserService")
	private MngrUserService mngrUserService;
	
	@Resource(name = "genrUserService")
	private GenrUserService genrUserService;
	
	@Resource(name = "corpUserService")
	private CorpUserService corpUserService;
	
	

	public int selectListCount(UserAuthSearchVO userAuthSearchVO) {
		return (Integer) dao.selectOne("UserAuth.selectListCount", userAuthSearchVO);
	}
	
	public List<EgovMap> selectList(UserAuthSearchVO userAuthSearchVO) {
		return dao.selectList("UserAuth.selectList", userAuthSearchVO);
	}
	
	/**
	 * @method	: selectFullList
	 * @date	: 2017. 2. 20.
	 * @author	: pdh
	 * @comment	: set condition [userGrp, actFlg]
	 * @history	: 
	 * @param	: 
	 * @return	: List<EgovMap>
	 */
	public List<EgovMap> selectFullList(UserAuthVO userAuthVO) {
		return dao.selectList("UserAuth.selectFullList", userAuthVO);
	}

	public UserAuthVO select(UserAuthVO userAuthVO) {
		return (UserAuthVO) dao.selectOne("UserAuth.select", userAuthVO);
	}
	
	public void insert(UserAuthVO userAuthVO) {
		userAuthVO.setAuthId(userAuthVO.getAuthId().toUpperCase());
		
		dao.insert("UserAuth.insert", userAuthVO);
	}
	
	public void update(UserAuthVO userAuthVO) {
		dao.update("UserAuth.update", userAuthVO);
	}
	
	public void delete(UserAuthVO userAuthVO) {		
		
		//해당 authId로 설정된 회원권한정보 초기화
		mngrUserService.updateSetNullAuthId(userAuthVO.getAuthId());
		genrUserService.updateSetNullAuthId(userAuthVO.getAuthId());
		corpUserService.updateSetNullAuthId(userAuthVO.getAuthId());
		
		//해당 authId로 설정된 메뉴권한정보 삭제
		menuUseService.deleteByAuthId(userAuthVO.getAuthId());
		
		//해당 authId 삭제
		dao.delete("UserAuth.delete", userAuthVO);
	}
}
