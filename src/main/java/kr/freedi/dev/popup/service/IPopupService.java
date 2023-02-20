package kr.freedi.dev.popup.service;

import java.util.List;

import kr.freedi.dev.popup.domain.PopupSearchVO;
import kr.freedi.dev.popup.domain.PopupVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;


/**
 * @project : dev_default
 * @file 	: IPopupService.java
 * @date	: 2017. 2. 10.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public interface IPopupService {

	/**
	 * @method	: selectList
	 * @date	: 2017. 2. 10.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: List<EgovMap>
	 */
	public abstract List<EgovMap> selectList(PopupSearchVO searchVO);

	/**
	 * @method	: selectListCount
	 * @date	: 2017. 2. 10.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: int
	 */
	public abstract int selectListCount(PopupSearchVO searchVO);

	/**
	 * @method	: insert
	 * @date	: 2017. 2. 10.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: void
	 */
	public abstract void insert(PopupVO popupVO) throws Exception;
	
	/**
	 * @method	: select
	 * @date	: 2017. 2. 10.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: PopupVO
	 */
	public abstract PopupVO select(PopupVO popupVO);

	/**
	 * @method	: update
	 * @date	: 2017. 2. 10.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: void
	 */
	public abstract void update(PopupVO popupVO) throws Exception;

	/**
	 * @method	: delete
	 * @date	: 2017. 2. 10.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: void
	 */
	public abstract void delete(PopupVO popupVO);

	/**
	 * @method	: selectFullList
	 * @date	: 2017. 2. 10.
	 * @author	: pdh
	 * @comment	: set condition [locateTyp, actFlg]
	 * @history	: 
	 * @param	: 
	 * @return	: List<EgovMap>
	 */
	public abstract List<EgovMap> selectFullList(PopupVO popupVO);
	
	public abstract void refreshEcache();

}