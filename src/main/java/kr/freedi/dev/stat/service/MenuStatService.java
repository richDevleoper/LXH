
package kr.freedi.dev.stat.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.FastDateFormat;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.common.dao.DefaultDAO;

/**
 * @project : dev_default
 * @file 	: MenuStatService.java
 * @date	: 2017. 4. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service
public class MenuStatService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	public void insert(HttpServletRequest request, String statTyp) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Calendar today = Calendar.getInstance();
		
		map.put("year", today.get(Calendar.YEAR));
		map.put("month", today.get(Calendar.MONTH)+1);
		map.put("day", today.get(Calendar.DATE));
		map.put("hour", today.get(Calendar.HOUR_OF_DAY));
		map.put("minute", today.get(Calendar.MINUTE));
		map.put("second", today.get(Calendar.SECOND));
		map.put("statTyp", statTyp);
		map.put("sessionId", request.getSession().getId());
		map.put("url", request.getRequestURI());
		map.put("locale", request.getLocale().toString());
		map.put("lang", request.getLocale().getLanguage());
		map.put("cntry", StringUtils.isEmpty(request.getLocale().getCountry()) ? "-" : request.getLocale().getCountry());
		map.put("dsplyLang", request.getLocale().getDisplayLanguage());
		map.put("dsplyCntry", StringUtils.isEmpty(request.getLocale().getDisplayCountry()) ? "-" : request.getLocale().getDisplayCountry());
		map.put("ip", request.getRemoteAddr());
		map.put("userAgent", request.getHeader("user-agent"));
		String referer = request.getHeader("referer") == null ? "" : request.getHeader("referer");
		map.put("referer", referer.length() > 255 ? referer.substring(0, 255) : referer);
		
		map.put("menuKey", request.getParameter("menuKey"));
		
		FastDateFormat fdf = FastDateFormat.getInstance("yyyyMM");
		map.put("ym", fdf.format(today));
		
		dao.insert("MenuStat.insert", map);
	}
	
	
	public List<EgovMap> getStatTopMenu(Map<String, Object> map) {
		return dao.selectList("MenuStat.statTopMenu", map);
	}

	public List<EgovMap> getStatMenu(Map<String, Object> map) {
		return dao.selectList("MenuStat.statMenu", map);
	}
	
	
	/* job =========================================================== */
	
	public void createNextMonthTable() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Calendar today = Calendar.getInstance();
		String nextYm = "";
		int curYear = today.get(Calendar.YEAR);
		int curMonth = today.get(Calendar.MONTH)+1;
		//int curMonth = today.get(Calendar.MONTH);
		
		if(curMonth == 12){
			nextYm = String.valueOf(curYear+1) + StringUtils.leftPad(String.valueOf(1), 2, "0");
		}else{
			nextYm = String.valueOf(curYear) + StringUtils.leftPad(String.valueOf(curMonth+1), 2, "0");
		}

		List<EgovMap> rsList = null;
		String tableNm = "TB_MENU_STAT_" + nextYm;
		map.put("tableNm", tableNm);
		rsList = dao.selectList("MenuStat.isNextMonthTable", map);
		
		if(rsList != null && rsList.size() > 0){
			log.info(tableNm + " already exists ");
			return;
		}
		
		StringBuffer sb = new StringBuffer();
		sb.append("CREATE TABLE `TB_MENU_STAT_" + nextYm + "` (");
		sb.append("`MENU_STAT_KEY`        INT(8) NOT NULL COMMENT '메뉴통계키',");
		sb.append("`YEAR`                 INT(4) NOT NULL COMMENT '년',");
		sb.append("`MONTH`                INT(2) NOT NULL COMMENT '월',");
		sb.append("`DAY`                  INT(2) NOT NULL COMMENT '일',");
		sb.append("`HOUR`                 INT(2) NOT NULL COMMENT '시',");
		sb.append("`MINUTE`               INT(2) NOT NULL COMMENT '분',");
		sb.append("`SECOND`               INT(2) NOT NULL COMMENT '초',");
		sb.append("`STAT_TYP`             VARCHAR(20) NOT NULL COMMENT '통계구분',");
		sb.append("`SESSION_ID`           VARCHAR(100) NOT NULL COMMENT '세션ID',");
		sb.append("`URL`                  VARCHAR(255) NULL COMMENT 'URL',");
		sb.append("`LOCALE`               VARCHAR(50) NULL COMMENT '로케일',");
		sb.append("`LANG`                 VARCHAR(10) NULL COMMENT '언어',");
		sb.append("`CNTRY`                VARCHAR(10) NULL COMMENT '국가',");
		sb.append("`DSPLY_LANG`           VARCHAR(20) NULL COMMENT '출력언어',");
		sb.append("`DSPLY_CNTRY`          VARCHAR(20) NULL COMMENT '출력국가',");
		sb.append("`IP`                   VARCHAR(20) NULL COMMENT 'IP',");
		sb.append("`REFERER`              VARCHAR(255) NULL COMMENT 'REFERER',");
		sb.append("`USER_AGENT`           VARCHAR(255) NULL COMMENT 'USER_AGENT',");
		sb.append("`MENU_KEY`             INT(8) NULL COMMENT '메뉴키',");
		sb.append("PRIMARY KEY (`MENU_STAT_KEY`)");
		sb.append(")CHARSET=utf8 COMMENT='메뉴통계_" + nextYm + "'");
		
		map.put("sql", sb.toString());
		dao.selectOne("MenuStat.createNextMonthTable", map);
		
		/*map.put("sql", "ALTER TABLE TB_MENU_STAT_" + nextYm + " ADD CONSTRAINT  PK_TB_MENU_STAT_" + nextYm + " PRIMARY KEY (MENU_STAT_KEY)");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		
		map.put("sql", "COMMENT ON TABLE TB_MENU_STAT_" + nextYm + " IS '메뉴통계_" + nextYm + "'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".MENU_STAT_KEY IS '메뉴통계키'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".YEAR IS '년'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".MONTH IS '월'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".DAY IS '일'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".HOUR IS '시'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".MINUTE IS '분'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".SECOND IS '초'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".STAT_TYP IS '통계구분'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".SESSION_ID IS '세션ID'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".URL IS 'URL'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".LOCALE IS '로케일'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".LANG IS '언어'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".CNTRY IS '국가'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".DSPLY_LANG IS '출력언어'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".DSPLY_CNTRY IS '출력국가'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".IP IS 'IP'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".REFERER IS 'REFERER'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".USER_AGENT IS 'USER_AGENT'");
		dao.selectOne("MenuStat.createNextMonthTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_MENU_STAT_" + nextYm + ".MENU_KEY IS '메뉴키'");
		dao.selectOne("MenuStat.createNextMonthTable", map);*/
		
		log.info(tableNm + " create ok ");
		
	}
}
