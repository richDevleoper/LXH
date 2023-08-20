package kr.freedi.dev.content.service;

import java.util.List;

import kr.freedi.dev.content.domain.ContentSearchVO;
import kr.freedi.dev.content.domain.ContentVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: IContentService.java
 * @date	: 2017. 2. 13.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public interface IContentService {

	/**
	 * @method	: selectList
	 * @date	: 2017. 2. 13.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: List<EgovMap>
	 */
	public abstract List<EgovMap> selectList(ContentSearchVO searchVO);

	/**
	 * @method	: selectListCount
	 * @date	: 2017. 2. 13.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: int
	 */
	public abstract int selectListCount(ContentSearchVO searchVO);

	/**
	 * @method	: selectFullList
	 * @date	: 2017. 2. 13.
	 * @author	: pdh
	 * @comment	: set condition [actFlg]
	 * @history	: 
	 * @param	: 
	 * @return	: List<EgovMap>
	 */
	public abstract List<EgovMap> selectFullList(ContentVO contentVO);
	
	/**
	 * @method	: insert
	 * @date	: 2017. 2. 13.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: void
	 */
	public abstract Integer insert(ContentVO contentVO) throws Exception;

	/**
	 * @method	: select
	 * @date	: 2017. 2. 13.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: ContentVO
	 */
	public abstract ContentVO select(ContentVO contentVO);

	/**
	 * @method	: update
	 * @date	: 2017. 2. 13.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: void
	 */
	public abstract Integer update(ContentVO contentVO) throws Exception;

	/**
	 * @method	: delete
	 * @date	: 2017. 2. 13.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: void
	 */
	public abstract void delete(ContentVO contentVO);
	
	public abstract void refreshEcache();

}