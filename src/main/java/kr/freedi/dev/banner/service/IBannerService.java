package kr.freedi.dev.banner.service;

import java.util.List;

import kr.freedi.dev.banner.domain.BannerSearchVO;
import kr.freedi.dev.banner.domain.BannerVO;

import org.springframework.web.multipart.MultipartHttpServletRequest;



import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @project : dev_default
 * @file 	: IBannerService.java
 * @date	: 2017. 2. 9.
 * @author	: pdh
 * @comment :  
 * @history	:
 */
public interface IBannerService {
	
	/**
	 * @method	: selectList
	 * @date	: 2017. 2. 9.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: List<EgovMap>
	 */
	public List<EgovMap> selectList(BannerSearchVO searchVO);
	
	/**
	 * @method	: selectListCount
	 * @date	: 2017. 2. 9.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: int
	 */
	public int selectListCount(BannerSearchVO searchVO);
	
	/**
	 * @method	: selectActiveList
	 * @date	: 2017. 2. 9.
	 * @author	: pdh
	 * @comment	: set condition [locateTyp, actFlg]
	 * @history	: 
	 * @param	: 
	 * @return	: List<EgovMap>
	 */
	public List<EgovMap> selectFullList(BannerVO bannerVO);
	
	/**
	 * @method	: insert
	 * @date	: 2017. 2. 9.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: void
	 */
	public void insert(BannerVO bannerVO, MultipartHttpServletRequest mrequest, String inputFileTagName) throws Exception;

	/**
	 * @method	: select
	 * @date	: 2017. 2. 9.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: BannerVO
	 */
	public BannerVO select(BannerVO bannerVO);
	
	/**
	 * @method	: update
	 * @date	: 2017. 2. 9.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: void
	 */
	public void update(BannerVO bannerVO, MultipartHttpServletRequest mrequest, String inputFileTagName) throws Exception;
	
	/**
	 * @method	: delete
	 * @date	: 2017. 2. 9.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: void
	 */
	public void delete(BannerVO bannerVO);
	
	/**
	 * 
	 * @method	: deleteFile
	 * @date	: 2017. 2. 10.
	 * @author	: pdh
	 * @comment	: 
	 * @history	: 
	 * @param	: 
	 * @return	: void
	 */
	public Integer deleteFile(BannerVO bannerVO);
	
	public abstract void refreshEcache();
}
