package kr.freedi.dev.common.controller;

import java.text.MessageFormat;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationRenderer;

/**
 * @project : dev_default
 * @file 	: DefDefaultPaginationRenderer.java
 * @date	: 2017. 7. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
public class DefDefaultPaginationRenderer  implements PaginationRenderer {
	
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
		
		//String strWebDir = "/def/img/common/";
		
        /*
		<ul class="paging">
			<li><a href="#none">&lt;&lt;</a></li>
			<li><a href="#none">&lt;</a></li>
			<li class="current"><span>1</span></li>
			<li><a href="#none">2</a></li>
			<li><a href="#none">3</a></li>
			<li><a href="#none">4</a></li>
			<li><a href="#none">5</a></li>
			<li><a href="#none">&gt;</a></li>
			<li><a href="#none">&gt;&gt;</a></li>
		</ul>
        */
		
		firstPageLabel = "<ul class=\"paging\">\n";
		firstPageLabel += "\t<li><a href=\"#\" onclick=\"{0}({1}); return false;\" title=\"처음\">&lt;&lt;</a></li>\n"; 
        previousPageLabel = "\t<li><a href=\"#\" onclick=\"{0}({1}); return false;\" title=\"이전 " + pageSize + " 페이지\">&lt;</a></li>\n";
        currentPageLabel = "\t<li><span class=\"current\">{0}</span></li>\n";
        otherPageLabel = "\t<li><a href=\"#\" onclick=\"{0}({1}); return false;\" title=\"{2} 페이지\">{2}</a></li>\n";
        nextPageLabel = "\t<li><a href=\"#\" onclick=\"{0}({1}); return false;\" title=\"다음 " + pageSize + " 페이지\">&gt;</a></li>\n";
        lastPageLabel = "\t<li><a href=\"#\" onclick=\"{0}({1}); return false;\" title=\"마지막\">&gt;&gt;</a></li>\n";
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
