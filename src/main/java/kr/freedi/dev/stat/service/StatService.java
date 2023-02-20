
package kr.freedi.dev.stat.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.common.dao.DefaultDAO;

/**
 * @project : dev_default
 * @file 	: StatService.java
 * @date	: 2017. 4. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Service
public class StatService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	final String STAT_TABLE_PREFIX = "TB_STAT_";
	
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
		
		dao.insert("Stat.insert", map);
	}
	
	public List<EgovMap> getStatAll(Map<String, Object> map) throws Exception {
		return dao.selectList("Stat.statAll", map);
	}
	
	public List<EgovMap> getStatLang(Map<String, Object> map) throws Exception {
		return dao.selectList("Stat.statLang", map);
	}
	
	public List<EgovMap> getStatCntry(Map<String, Object> map) throws Exception {
		return dao.selectList("Stat.statCntry", map);
	}
	
	public List<EgovMap> getStatYear(Map<String, Object> map) throws Exception {
		return dao.selectList("Stat.statYear", map);
	}

	public List<EgovMap> getStatMonth(Map<String, Object> map) throws Exception {
		return dao.selectList("Stat.statMonth", map);
	}

	public List<EgovMap> getStatDate(Map<String, Object> map) throws Exception {
		return dao.selectList("Stat.statDate", map);
	}

	public List<EgovMap> getStatHour(Map<String, Object> map) throws Exception {
		return dao.selectList("Stat.statHour", map);
	}

	public List<EgovMap> getStatMinute(Map<String, Object> map) throws Exception {
		return dao.selectList("Stat.statMinute", map);
	}


	public Integer selectCountAll(Map<String, Object> map) {
		List<EgovMap> rsList = null;
		Integer cnt = 0;
		
		map.put("tablePrefix", STAT_TABLE_PREFIX);
		rsList = dao.selectList("Stat.selectStatTables", map);
		
		if(rsList != null && rsList.size() > 0){
			for(EgovMap eMap : rsList){
				map.put("year", StringUtils.substringAfterLast(String.valueOf(eMap.get("tableName")), "_"));
				cnt += (Integer)dao.selectOne("Stat.selectCountByTable", map);
			}
		}
		
		return cnt;
	}
	
	public Integer selectCountByTable(Map<String, Object> map) {
		return (Integer)dao.selectOne("Stat.selectCountByTable", map);
	}

	
	/* job =========================================================== */
	
	public void createNextYearTable() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Calendar today = Calendar.getInstance();
		int nextYear = today.get(Calendar.YEAR) + 1;
		//int nextYear = today.get(Calendar.YEAR);

		List<EgovMap> rsList = null;
		String tableNm = "TB_STAT_" + nextYear;
		map.put("tableNm", tableNm);
		rsList = dao.selectList("Stat.isNextYearTable", map);
		
		if(rsList != null && rsList.size() > 0){
			log.info(tableNm + " already exists ");
			return;
		}
		
		StringBuffer sb = new StringBuffer();
		sb.append("CREATE TABLE TB_STAT_" + nextYear + " (");
		sb.append("`STAT_KEY`             INT(8) NOT NULL COMMENT '접속통계키',");
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
		sb.append("PRIMARY KEY (`STAT_KEY`)");
		sb.append(")CHARSET=utf8 COMMENT='접속통계_" + nextYear + "'");
		map.put("sql", sb.toString());
		dao.selectOne("Stat.createNextYearTable", map);
		
		/*map.put("sql", "ALTER TABLE TB_STAT_" + nextYear + " ADD CONSTRAINT  PK_TB_STAT_" + nextYear + " PRIMARY KEY (STAT_KEY)");
		dao.selectOne("Stat.createNextYearTable", map);
		
		map.put("sql", "COMMENT ON TABLE TB_STAT_" + nextYear + " IS '접속통계_" + nextYear + "'");
		dao.selectOne("Stat.createNextYearTable", map);
		
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".STAT_KEY IS '접속통계키'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".YEAR IS '년'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".MONTH IS '월'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".DAY IS '일'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".HOUR IS '시'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".MINUTE IS '분'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".SECOND IS '초'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".STAT_TYP IS '통계구분'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".SESSION_ID IS '세션ID'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".URL IS 'URL'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".LOCALE IS '로케일'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".LANG IS '언어'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".CNTRY IS '국가'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".DSPLY_LANG IS '출력언어'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".DSPLY_CNTRY IS '출력국가'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".IP IS 'IP'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".REFERER IS 'REFERER'");
		dao.selectOne("Stat.createNextYearTable", map);
		map.put("sql", "COMMENT ON COLUMN TB_STAT_" + nextYear + ".USER_AGENT IS 'USER_AGENT'");
		dao.selectOne("Stat.createNextYearTable", map);
		*/
		log.info(tableNm + " create ok ");
	}
}
