package kr.freedi.dev.ecache.service;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import kr.freedi.dev.banner.service.IBannerService;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.content.service.IContentService;
import kr.freedi.dev.ecache.domain.EcacheApplyVO;
import kr.freedi.dev.link.service.ILinkService;
import kr.freedi.dev.menu.service.IMenuService;
import kr.freedi.dev.popup.service.IPopupService;

/**
 * @project : dev_default
 * @file 	: EcacheApplyService.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service
public class EcacheApplyService {

	final String SVC_MENU = "MENU";
	final String SVC_CONTENT = "CONTENT";
	final String SVC_BANNER = "BANNER";
	final String SVC_POPUP = "POPUP";
	final String SVC_LINK = "LINK";
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	@Resource(name = "menuService")
	private IMenuService menuService;
	
	@Resource(name = "contentService")
	private IContentService contentService;
	
	@Resource(name = "bannerService")
	private IBannerService bannerService;
	
	@Resource(name = "linkService")
	private ILinkService linkService;
	
	@Resource(name = "popupService")
	private IPopupService popupService;
	
	
	public EcacheApplyVO select(EcacheApplyVO ecacheApplyVO){
		return (EcacheApplyVO)dao.selectOne("EcacheApply.select", ecacheApplyVO);
	}
	
	public Integer insert(EcacheApplyVO ecacheApplyVO){
		return (Integer)dao.insert("EcacheApply.insert", ecacheApplyVO);
	}
	
	public Integer update(EcacheApplyVO ecacheApplyVO){
		return (Integer)dao.update("EcacheApply.update", ecacheApplyVO);
	}
	
	public Integer updateMenuFlg(EcacheApplyVO ecacheApplyVO){
		return (Integer)dao.update("EcacheApply.updateMenuFlg", ecacheApplyVO);
	}
	
	public Integer updateMenuFlgAll(EcacheApplyVO ecacheApplyVO){
		return (Integer)dao.update("EcacheApply.updateMenuFlgAll", ecacheApplyVO);
	}
	
	public Integer updateContentFlg(EcacheApplyVO ecacheApplyVO){
		return (Integer)dao.update("EcacheApply.updateContentFlg", ecacheApplyVO);
	}
	
	public Integer updateContentFlgAll(EcacheApplyVO ecacheApplyVO){
		return (Integer)dao.update("EcacheApply.updateContentFlgAll", ecacheApplyVO);
	}
	
	public Integer updateBannerFlg(EcacheApplyVO ecacheApplyVO){
		return (Integer)dao.update("EcacheApply.updateBannerFlg", ecacheApplyVO);
	}
	
	public Integer updateBannerFlgAll(EcacheApplyVO ecacheApplyVO){
		return (Integer)dao.update("EcacheApply.updateBannerFlgAll", ecacheApplyVO);
	}
	
	public Integer updatePopupFlg(EcacheApplyVO ecacheApplyVO){
		return (Integer)dao.update("EcacheApply.updatePopupFlg", ecacheApplyVO);
	}
	
	public Integer updatePopupFlgAll(EcacheApplyVO ecacheApplyVO){
		return (Integer)dao.update("EcacheApply.updatePopupFlgAll", ecacheApplyVO);
	}
	
	public Integer updateLinkFlg(EcacheApplyVO ecacheApplyVO){
		return (Integer)dao.update("EcacheApply.updateLinkFlg", ecacheApplyVO);
	}
	
	public Integer updateLinkFlgAll(EcacheApplyVO ecacheApplyVO){
		return (Integer)dao.update("EcacheApply.updateLinkFlgAll", ecacheApplyVO);
	}
	

	public void refreshEcache(String nodeNm, String targetSvcNm){
		EcacheApplyVO paramVO = new EcacheApplyVO();
		paramVO.setNodeNm(nodeNm);
		
		EcacheApplyVO ecacheApplyVO = this.select(paramVO);
		
		if(ecacheApplyVO == null){
			//최초 등록
			paramVO.setMenuFlg("N");
			paramVO.setContentFlg("N");
			paramVO.setBannerFlg("N");
			paramVO.setPopupFlg("N");
			paramVO.setLinkFlg("N");
			this.insert(paramVO);
			
			if(StringUtils.equals(targetSvcNm, "ALL")){
				menuService.refreshEcache();
				paramVO.setMenuFlg("Y");
				this.updateMenuFlg(paramVO);
				
				contentService.refreshEcache();
				paramVO.setContentFlg("Y");
				this.updateContentFlg(paramVO);
				
				bannerService.refreshEcache();
				paramVO.setBannerFlg("Y");
				this.updateBannerFlg(paramVO);
				
				popupService.refreshEcache();
				paramVO.setPopupFlg("Y");
				this.updatePopupFlg(paramVO);
				
				linkService.refreshEcache();
				paramVO.setLinkFlg("Y");
				this.updateLinkFlg(paramVO);
				
			}else{
				if(StringUtils.equals(targetSvcNm, SVC_MENU)){
					menuService.refreshEcache();
					paramVO.setMenuFlg("Y");
					this.updateMenuFlg(paramVO);

				}else if(StringUtils.equals(targetSvcNm, SVC_CONTENT)){
					contentService.refreshEcache();
					paramVO.setContentFlg("Y");
					this.updateContentFlg(paramVO);
					
				}else if(StringUtils.equals(targetSvcNm, SVC_BANNER)){
					bannerService.refreshEcache();
					paramVO.setBannerFlg("Y");
					this.updateBannerFlg(paramVO);
					
				}else if(StringUtils.equals(targetSvcNm, SVC_POPUP)){
					popupService.refreshEcache();
					paramVO.setPopupFlg("Y");
					this.updatePopupFlg(paramVO);
					
				}else if(StringUtils.equals(targetSvcNm, SVC_LINK)){
					linkService.refreshEcache();
					paramVO.setLinkFlg("Y");
					this.updateLinkFlg(paramVO);
				}
			}
		}else{
			
			if(StringUtils.equals(targetSvcNm, "ALL")){
				
				if(StringUtils.equals(ecacheApplyVO.getMenuFlg(), "N")){
					menuService.refreshEcache();
					paramVO.setMenuFlg("Y");
					this.updateMenuFlg(paramVO);
				}
				
				if(StringUtils.equals(ecacheApplyVO.getContentFlg(), "N")){
					contentService.refreshEcache();
					paramVO.setContentFlg("Y");
					this.updateContentFlg(paramVO);
				}
				
				if(StringUtils.equals(ecacheApplyVO.getBannerFlg(), "N")){
					bannerService.refreshEcache();
					paramVO.setBannerFlg("Y");
					this.updateBannerFlg(paramVO);
				}
				
				if(StringUtils.equals(ecacheApplyVO.getPopupFlg(), "N")){
					popupService.refreshEcache();
					paramVO.setPopupFlg("Y");
					this.updatePopupFlg(paramVO);
				}
				
				if(StringUtils.equals(ecacheApplyVO.getLinkFlg(), "N")){
					linkService.refreshEcache();
					paramVO.setLinkFlg("Y");
					this.updateLinkFlg(paramVO);
				}
				
			}else{
				if(StringUtils.equals(targetSvcNm, SVC_MENU)){
					if(StringUtils.equals(ecacheApplyVO.getMenuFlg(), "N")){
						menuService.refreshEcache();
						paramVO.setMenuFlg("Y");
						this.updateMenuFlg(paramVO);
					}
				}else if(StringUtils.equals(targetSvcNm, SVC_CONTENT)){
					if(StringUtils.equals(ecacheApplyVO.getContentFlg(), "N")){
						contentService.refreshEcache();
						paramVO.setContentFlg("Y");
						this.updateContentFlg(paramVO);
					}
				}else if(StringUtils.equals(targetSvcNm, SVC_BANNER)){
					if(StringUtils.equals(ecacheApplyVO.getBannerFlg(), "N")){
						bannerService.refreshEcache();
						paramVO.setBannerFlg("Y");
						this.updateBannerFlg(paramVO);
					}
				}else if(StringUtils.equals(targetSvcNm, SVC_POPUP)){
					if(StringUtils.equals(ecacheApplyVO.getPopupFlg(), "N")){
						popupService.refreshEcache();
						paramVO.setPopupFlg("Y");
						this.updatePopupFlg(paramVO);
					}
				}else if(StringUtils.equals(targetSvcNm, SVC_LINK)){
					if(StringUtils.equals(ecacheApplyVO.getLinkFlg(), "N")){
						linkService.refreshEcache();
						paramVO.setLinkFlg("Y");
						this.updateLinkFlg(paramVO);
					}
				}
			}
		}
	}
}
