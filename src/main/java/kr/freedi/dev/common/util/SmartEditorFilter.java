package kr.freedi.dev.common.util;

/**
 * @comment : smartEditor에서 글 작성시 닫히지 않는 self close tag를 닫아준다.
 * area
 * base
 * br
 * col
 * command
 * embed
 * hr
 * img
 * input
 * keygen
 * link
 * meta
 * param
 * source
 * track
 * wbr
 * 
 * 
 */
public class SmartEditorFilter {
	//private final Log log = LogFactory.getLog(this.getClass());
	
	public SmartEditorFilter(){	}
	
	public String getFilteredData(String oData){
		String rData = oData;
		
		rData = rData.replaceAll("(<[aA][rR][eE][aA].*?)>", "$1 \\/>");
		rData = rData.replaceAll("(<[bB][aA][sS][eE].*?)>", "$1 \\/>");
		rData = rData.replaceAll("(<[bB][rR].*?)>", "$1\\/>");
		rData = rData.replaceAll("(<[cC][oO][lL].*?)>", "$1\\/>");
		//rData = rData.replaceAll("(<[cC][oO][mM][mM][aA][nN][dD].*?)>", "$1 \\/>");
		rData = rData.replaceAll("(<[eE][mM][bB][eE][dD].*?)>", "$1 \\/>");
		rData = rData.replaceAll("(<[hH][rR].*?)>", "$1 \\/>");
		rData = rData.replaceAll("(<[iI][mM][gG].*?)>", "$1 \\/>");
		rData = rData.replaceAll("(<[iI][nN][pP][uU][tT].*?)>", "$1\\/>");
		//rData = rData.replaceAll("(<[kK][eE][yY][gG][eE][nN].*?)>", "$1 \\/>");
		rData = rData.replaceAll("(<[lL][iI][nN][kK].*?)>", "$1 \\/>");
		//rData = rData.replaceAll("(<[mM][eE][tT][aA].*?)>", "$1 \\/>");
		//rData = rData.replaceAll("(<[pP][aA][rR][aA][mM].*?)>", "$1 \\/>");
		//rData = rData.replaceAll("(<[sS][oO][uU][rR][cC][eE].*?)>", "$1 \\/>");
		//rData = rData.replaceAll("(<[tT][rR][aA][cC][kK].*?)>", "$1 \\/>");
		//rData = rData.replaceAll("(<[wW][bB][rR].*?)>", "$1 \\/>");
		
		return rData;
	}
	
	
}
