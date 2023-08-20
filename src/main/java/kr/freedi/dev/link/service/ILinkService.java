package kr.freedi.dev.link.service;

import java.util.List;

import kr.freedi.dev.link.domain.LinkSearchVO;
import kr.freedi.dev.link.domain.LinkVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: ILinkService.java
 * @date	: 2017. 2. 8.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public interface ILinkService {

	
	/**
	 * @method	: selectList
	 * @date	: 2017. 2. 8.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: List<EgovMap>
	 */
	public abstract List<EgovMap> selectList(LinkSearchVO searchVO);

	
	/**
	 * @method	: selectListCount
	 * @date	: 2017. 2. 8.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: int
	 */
	public abstract int selectListCount(LinkSearchVO searchVO);

	
	/**
	 * @method	: selectActiveList
	 * @date	: 2017. 2. 8.
	 * @author	: pdh
	 * @comment	: set condition [loacteTyp, actFlg]
	 * @history	: 
	 * @param	: 
	 * @return	: List<EgovMap>
	 */
	public abstract List<EgovMap> selectFullList(LinkVO linkVO);

	
	/**
	 * @method	: insert
	 * @date	: 2017. 2. 8.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: void
	 */
	public abstract void insert(LinkVO linkVO) throws Exception;

	
	/**
	 * @method	: select
	 * @date	: 2017. 2. 8.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: LinkVO
	 */
	public abstract LinkVO select(LinkVO linkVO);

	
	/**
	 * @method	: update
	 * @date	: 2017. 2. 8.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: void
	 */
	public abstract void update(LinkVO linkVO) throws Exception;

	
	/**
	 * @method	: delete
	 * @date	: 2017. 2. 8.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: void
	 */
	public abstract void delete(LinkVO linkVO);

	public abstract void refreshEcache();
}