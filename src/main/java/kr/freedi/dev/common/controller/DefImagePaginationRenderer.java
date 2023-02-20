package kr.freedi.dev.common.controller;

import java.text.MessageFormat;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationRenderer;

/**
 * @project : dev_default
 * @file 	: DefImagePaginationRenderer.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class DefImagePaginationRenderer implements PaginationRenderer {

	public String firstPageLabel;
	public String previousPageLabel;
	public String currentPageLabel;
	public String otherPageLabel;
	public String nextPageLabel;
	public String lastPageLabel;
	
	public DefImagePaginationRenderer() {

	}
	
	
	public String renderPagination(PaginationInfo paginationInfo,String jsFunction){
		
		StringBuffer strBuff = new StringBuffer();
        
        int firstPageNo = paginationInfo.getFirstPageNo();
        int firstPageNoOnPageList = paginationInfo.getFirstPageNoOnPageList();
        int totalPageCount = paginationInfo.getTotalPageCount();
		int pageSize = paginationInfo.getPageSize();
		int lastPageNoOnPageList = paginationInfo.getLastPageNoOnPageList();
		int currentPageNo = paginationInfo.getCurrentPageNo();
		int lastPageNo = paginationInfo.getLastPageNo();
		
		String strWebDir = "/def/img/common/";
		
		firstPageLabel = "<ul style=\"test\" class=\"paging\">\n";
		firstPageLabel += "\t<li class=\"btncl\"><a href=\"#\" onclick=\"{0}({1}); return false;\"><img src='" + strWebDir + "btn_first.gif' border=0 alt=\"처음\"/></a></li>\n"; 
        previousPageLabel = "\t<li class=\"btncl\"><a href=\"#\" onclick=\"{0}({1}); return false;\"><img src='" + strWebDir + "btn_prev.gif' border=0 alt=\"이전 "+pageSize+" 페이지 이동\"/></a></li>\n";
        currentPageLabel = "\t<li><a href=\"javascript://\"><strong>{0}</strong></a></li>\n";
        otherPageLabel = "\t<li><a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a></li>\n";
        nextPageLabel = "\t<li class=\"btncl\"><a href=\"#\" onclick=\"{0}({1}); return false;\"><img src='" + strWebDir + "btn_next.gif' border=0 alt=\"다음 "+pageSize+" 페이지 이동\"/></a></li>\n";
        lastPageLabel = "\t<li class=\"btncl\"><a href=\"#\" onclick=\"{0}({1}); return false;\"><img src='" + strWebDir + "btn_last.gif' border=0 alt=\"마지막\"/></a></li>\n";
        lastPageLabel += "</ul>";
        

		if(firstPageNoOnPageList > pageSize){
			strBuff.append(MessageFormat.format(firstPageLabel,new Object[]{jsFunction,Integer.toString(firstPageNo)}));
			strBuff.append(MessageFormat.format(previousPageLabel,new Object[]{jsFunction,Integer.toString(firstPageNoOnPageList-1)}));
        }else{
        	strBuff.append(MessageFormat.format(firstPageLabel,new Object[]{jsFunction,Integer.toString(firstPageNo)}));
			strBuff.append(MessageFormat.format(previousPageLabel,new Object[]{jsFunction,Integer.toString(firstPageNo)}));
        }
	
		
		for(int i=firstPageNoOnPageList;i<=lastPageNoOnPageList;i++){
			if(i==currentPageNo){
        		strBuff.append(MessageFormat.format(currentPageLabel,new Object[]{Integer.toString(i)}));
        	}else{
        		strBuff.append(MessageFormat.format(otherPageLabel,new Object[]{jsFunction,Integer.toString(i),Integer.toString(i)}));
        	}
		}
    
		if(lastPageNoOnPageList < totalPageCount){
        	strBuff.append(MessageFormat.format(nextPageLabel,new Object[]{jsFunction,Integer.toString(firstPageNoOnPageList+pageSize)}));
        	strBuff.append(MessageFormat.format(lastPageLabel,new Object[]{jsFunction,Integer.toString(lastPageNo)}));
        }else{
        	strBuff.append(MessageFormat.format(nextPageLabel,new Object[]{jsFunction,Integer.toString(lastPageNo)}));
        	strBuff.append(MessageFormat.format(lastPageLabel,new Object[]{jsFunction,Integer.toString(lastPageNo)}));
        }
		
		
	
		return strBuff.toString();
	}
}
