package kr.freedi.dev.common.controller;

import java.text.MessageFormat;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationRenderer;

/**
 * @project : dev_default
 * @file 	: CslDefaultPaginationRenderer.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class CslDefaultPaginationRenderer  implements PaginationRenderer {
	
	public String firstPageLabel;
	public String previousPageLabel;
	public String currentPageLabel;
	public String otherPageLabel;
	public String nextPageLabel;
	public String lastPageLabel;
	
	@Override
	public String renderPagination(PaginationInfo paginationInfo,String jsFunction){
		
		StringBuffer strBuff = new StringBuffer();
        
        int firstPageNo = paginationInfo.getFirstPageNo();
        int firstPageNoOnPageList = paginationInfo.getFirstPageNoOnPageList();
        int totalPageCount = paginationInfo.getTotalPageCount();
		int pageSize = paginationInfo.getPageSize();
		int lastPageNoOnPageList = paginationInfo.getLastPageNoOnPageList();
		int currentPageNo = paginationInfo.getCurrentPageNo();
		int lastPageNo = paginationInfo.getLastPageNo();
		
		//String strWebDir = "/csl/img/contents/";

        /*
		<div class="paging_wrap">
			<div class="paging">
				<span class="paging_disabled">처음</span>
				<span class="paging_disabled">이전</span>
				<span class="paging_current">1</span>
				<a href="#?page=2">2</a><a href="#?page=3">3</a>
				<a href="#?page=4">4</a><a href="#?page=5">5</a>
				<a href="#?page=6">6</a><a href="#?page=7">7</a>
				<a href="#?page=199">199</a>
				<a href="#?page=200">200</a>
				<a href="#?page=2">다음</a>
				<a href="#?page=2">마지막</a>
			</div>
		</div>
        */
		
		firstPageLabel = "<div class=\"paging_wrap\"><div class=\"paging\">\n";
		firstPageLabel += "\t<a href=\"#\" onclick=\"{0}({1}); return false;\" title=\"처음\">처음</a>\n"; 
        previousPageLabel = "\t<a href=\"#\" onclick=\"{0}({1}); return false;\" title=\"이전 " + pageSize + " 페이지\">이전</a>\n";
        currentPageLabel = "\t<span class=\"paging_current\">{0}</span>\n";
        otherPageLabel = "\t<a href=\"#\" onclick=\"{0}({1}); return false;\" title=\"{2} 페이지\">{2}</a>\n";
        nextPageLabel = "\t<a href=\"#\" onclick=\"{0}({1}); return false;\" title=\"다음 " + pageSize + " 페이지\">다음</a>\n";
        lastPageLabel = "\t<a href=\"#\" onclick=\"{0}({1}); return false;\" title=\"마지막\">마지막</a>\n";
        lastPageLabel += "</div></div>";
        
        
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
