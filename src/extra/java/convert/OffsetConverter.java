package convert;

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public class OffsetConverter {

	public static void main(String[] args) throws Exception{

		System.out.println("============================================================");
		
		OffsetConverter oc = new OffsetConverter();

		System.out.println("<testDB timestamp=\"" + oc.getTime() + "\">");
		oc.testDB();
		System.out.println("</testDB timestamp=\"" + oc.getTime() + "\">");
		
		System.out.println("<insertCorpUser timestamp=\"" + oc.getTime() + "\">");
		oc.insertCorpUser();
		System.out.println("</insertCorpUser timestamp=\"" + oc.getTime() + "\">");

		/*
		// make_bizList
		System.out.println("<make_bizList timestamp=\"" + bc.getTime() + "\">");
		List<EgovMap> bizList = bc.makekBizList(excelList);
		System.out.println(bizList.size());
		System.out.println("</make_bizList timestamp=\"" + bc.getTime() + "\">");
		
		
		// checkCorpIn
		System.out.println("<check_corpIn timestamp=\"" + bc.getTime() + "\">");
		////bc.checkCorpIn(bizList);
		System.out.println("</check_corpIn timestamp=\"" + bc.getTime() + "\">");		
		
		
		// convertBizInfo
		System.out.println("<convert_bizInfo timestamp=\"" + bc.getTime() + "\">");
		bc.convertBizInfo(bizList);
		System.out.println("</convert_bizInfo timestamp=\"" + bc.getTime() + "\">");
		
		
		// convertBizInfoByIndustryFile
		System.out.println("<convert_bizInfo_byIndustryFile timestamp=\"" + bc.getTime() + "\">");
		bc.convertBizInfoByIndustryFile();
		System.out.println("</convert_bizInfo_byIndustryFile timestamp=\"" + bc.getTime() + "\">");
		
		
		// default_introCom_update
		System.out.println("<default_introCom_update timestamp=\"" + bc.getTime() + "\">");
		bc.defaultIntroComUpdate();
		System.out.println("</default_introCom_update timestamp=\"" + bc.getTime() + "\">");
		*/
		
		
		System.out.println("============================================================");
	}

	public OffsetConverter() throws ClassNotFoundException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}

	public Connection getConnection() throws SQLException {
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:ORCL", "test", "test123");
		return con;
	}
	
	public void testDB() throws IOException, SQLException {
		Connection con = this.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = null;
		
		try{
			st = con.createStatement();
			
			sql = "SELECT * FROM TB_CORP_USER";
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				System.out.println(rs.getString("user_id"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			this.close(rs);
			this.close(st);
			this.close(con);
		}
		
	}
	
	private String makeInsertQuery(String sql, String tableName, int columnCount) {

		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO ");
		sb.append(tableName);
		sb.append("(");
		sb.append(sql);
		sb.append(") VALUES (");

		for (int i = 0; i < columnCount; i++) {
			sb.append("?");
			if (i < columnCount - 1) {
				sb.append(", ");
			}
		}
		sb.append(")");
		System.out.println(sb.toString());

		return sb.toString();
	}
	
	public List<EgovMap> getExcelList(String filePath, Integer fromSheet, Integer toSheet){
		
		ExcelUtil eu = new ExcelUtil();
		List<EgovMap> excelList = eu.xlsxToList(filePath, fromSheet, toSheet, 0);
		
		System.out.println(excelList.size());
		
		for(EgovMap eMap : excelList){
			System.out.print("0=" + eMap.get("0"));
			System.out.print(",1=" + eMap.get("1"));
			System.out.print(",2=" + eMap.get("2"));
			System.out.println("\n");
		}
		
		return excelList;
	}
	
	
	public void insertCorpUser() throws IOException, SQLException {
		
		List<EgovMap> excelList = this.getExcelList("D:/Dev/offset/work/data-20170407.xlsx", 1, 1);
		
		Connection con = this.getConnection();
		PreparedStatement ps = null;
		String sql = null;
		
		int result = 0;
		
		try {
			StringBuffer sbSql = new StringBuffer();
			sbSql.append(" USER_ID");
			sbSql.append(",USER_PWD"); //임의 일괄세팅
			sbSql.append(",USER_NM");
			sbSql.append(",USER_NM_EN");
			sbSql.append(",CHR_TEL");
			sbSql.append(",CHR_MOB");
			sbSql.append(",CHR_FAX");
			sbSql.append(",CHR_EMAIL");
			sbSql.append(",CORP_ID");
			sbSql.append(",CORP_NM");
			sbSql.append(",CORP_NM_EN");
			sbSql.append(",CORP_DLG_NM");
			sbSql.append(",CORP_DLG_NM_EN");
			sbSql.append(",CORP_TEL");
			sbSql.append(",CORP_FAX");
			sbSql.append(",CORP_EMAIL");
			sbSql.append(",CORP_ZIP");
			sbSql.append(",CORP_ADDR1");
			sbSql.append(",CORP_ADDR2");
			sbSql.append(",CORP_ADDR1_EN");
			sbSql.append(",CORP_ADDR2_EN");
			sbSql.append(",CORP_SMMR"); //desc convert
			sbSql.append(",CORP_DESC");
			sbSql.append(",LOGO_FILE_MSK");
			sbSql.append(",HOMEPAGE_URL");
			//sbSql.append(",PRMT_URL");
			//sbSql.append(",B2B_APPLY_URL");
			//sbSql.append(",FACEBOOK_URL");
			//sbSql.append(",TWITTER_URL");
			//sbSql.append(",YOUTUBE_URL");
			sbSql.append(",BLOG_USE_FLG");
			sbSql.append(",REG_ST");
			sbSql.append(",AUTH_ID");
			sbSql.append(",LAST_LOGIN_DT");
			sbSql.append(",FRST_OPER_DT");
			sbSql.append(",LAST_OPER_DT");
			
			sql = this.makeInsertQuery(sbSql.toString(), "TB_CORP_USER", 31);
			
			ps = con.prepareStatement(sql);
			
			for(EgovMap m : excelList){
				ps.setObject(1, m.get("1"));    //USER_ID
				ps.setObject(2, m.get(""));     //USER_PWD //임의 일괄세팅
				ps.setObject(3, m.get("24"));     //USER_NM
				ps.setObject(4, m.get("25"));     //USER_NM_EN
				ps.setObject(5, m.get("26"));     //CHR_TEL
				ps.setObject(6, m.get("29"));     //CHR_MOB
				ps.setObject(7, m.get("27"));     //CHR_FAX
				ps.setObject(8, m.get("28"));     //CHR_EMAIL
				ps.setObject(9, m.get("1"));     //CORP_ID
				ps.setObject(10, m.get("6"));    //CORP_NM
				ps.setObject(11, m.get("7"));    //CORP_NM_EN
				ps.setObject(12, m.get("8"));    //CORP_DLG_NM
				ps.setObject(13, m.get("9"));    //CORP_DLG_NM_EN
				ps.setObject(14, m.get("25"));    //CORP_TEL
				ps.setObject(15, m.get("16"));    //CORP_FAX
				ps.setObject(16, m.get("3"));    //CORP_EMAIL
				ps.setObject(17, m.get("20"));    //CORP_ZIP
				ps.setObject(18, m.get("18"));    //CORP_ADDR1
				ps.setObject(19, m.get("21"));    //CORP_ADDR2
				ps.setObject(20, m.get("19"));    //CORP_ADDR1_EN
				ps.setObject(21, m.get("22"));    //CORP_ADDR2_EN
				ps.setObject(22, m.get("12"));    //CORP_SMMR //desc convert
				ps.setObject(23, m.get("12"));    //CORP_DESC
				ps.setObject(24, m.get("-"));    //LOGO_FILE_MSK
				ps.setObject(25, m.get("13"));    //HOMEPAGE_URL
				ps.setObject(26, m.get("Y"));    //BLOG_USE_FLG
				ps.setObject(27, "B01");    //REG_ST
				ps.setObject(28, "ROLE_CORP_BASIC");    //AUTH_ID
				ps.setObject(29, m.get("4"));    //LAST_LOGIN_DT
				ps.setObject(30, m.get("2"));    //FRST_OPER_DT
				ps.setObject(31, m.get("33"));    //LAST_OPER_DT

				result += ps.executeUpdate();
			}
			System.out.println("result=" + result);
			
			
			
		} finally {
			this.close(ps);
			this.close(con);
		}
	}
	
	@SuppressWarnings("unused")
	private List<EgovMap> makekBizList(List<EgovMap> excelList) throws IOException{
		List<EgovMap> bizList = new ArrayList<EgovMap>();
		ArrayList<String> bizNoList = new ArrayList<String>();
		
		EgovMap eMap = null;
		String industryNm = null;
		String majorNm = null;
		String bizNm = null;
		String bizNo = null;
		String bizNoNumeric = null;
		
		for(EgovMap m : excelList){
			eMap = new EgovMap();
			
			majorNm = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("2"))));
			industryNm = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("3"))));
			bizNm = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("4"))));
			bizNo = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("5"))));
			bizNoNumeric = bizNo.replaceAll("-", "");
			
			if(bizNoList.indexOf(bizNo) == -1){
				bizNoList.add(bizNo);
				
				eMap.put("bizNo", bizNo);
				eMap.put("bizNoNumeric", bizNoNumeric);
				eMap.put("bizNm", bizNm);
				eMap.put("majorNm", majorNm);
				eMap.put("industryNm", industryNm);
				
				bizList.add(eMap);
			}
		}
		
		for(EgovMap m : bizList){
			System.out.println(m.toString());
		}
		
		return bizList;
	}
	
	
	@SuppressWarnings("unused")
	private void checkCorpIn(List<EgovMap> bizList) throws IOException, SQLException{
		Connection con = this.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = null;
		
		List<EgovMap> corpInYListByExcel = new ArrayList<EgovMap>();
		List<EgovMap> corpInNListByExcel = new ArrayList<EgovMap>();
		List<EgovMap> corpInNList = new ArrayList<EgovMap>();
		String bizNo = null;
		String bizNoNumeric = null;
		String bizNm = null;
		String majorNm = null;
		String industryNm = null;
		
		try {
			st = con.createStatement();
			
			String isuNo = null;
			
			for(EgovMap m : bizList){
				
				bizNo = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("bizNo"))));
				bizNoNumeric = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("bizNoNumeric"))));
				bizNm = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("bizNm"))));
				industryNm = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("industryNm"))));
				majorNm = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("majorNm"))));
				
				//액셀의 사업자번호와 매핑되는 db 데이터가 없는 경우가 있다, 확인해보니 업체는 있으며, 사업자번호가 틀림, db 데이터 값으로 replace
				if(StringUtils.equals(bizNoNumeric, "1048126728")){ //삼성물산
					bizNoNumeric = "4688500111";
				}else if(StringUtils.equals(bizNoNumeric, "2148720571")){ //현대엔지니어링
					bizNoNumeric = "1018166755";
				}
				
				sql = " SELECT COUNT(*) FROM BNS_BIZ_INFO WHERE CORP_IN_YN = 'Y' AND BIZ_ID = '" + bizNoNumeric + "'";
				
				rs = st.executeQuery(sql);
				if(rs.next()){
					if(rs.getInt(1) > 0){ //존재
						corpInYListByExcel.add(m);
					}else{
						corpInNListByExcel.add(m);
					}
				}
				this.close(rs);
			}
			
			System.out.println(">>>>corpInYListByExcel");
			for(EgovMap m : corpInYListByExcel){
				System.out.println(m.get("bizNo") + "\t" + m.get("bizNoNumeric") + "\t" + m.get("bizNm"));
			}
			
			System.out.println(">>>>corpInNListByExcel");
			for(EgovMap m : corpInNListByExcel){
				System.out.println(m.get("bizNo") + "\t" + m.get("bizNoNumeric") + "\t" + m.get("bizNm"));
			}
			
			//액셀에 없는 데이터 확인
			String bizId = null;
			String compNm = null;
			boolean isMapping = false;
			EgovMap eMap = null;
			
			sql = " SELECT * FROM BNS_BIZ_INFO WHERE CORP_IN_YN = 'Y'";
			rs = st.executeQuery(sql);
			
			
			while(rs.next()){
				isMapping = false;
				eMap = new EgovMap();
				
				bizId = StringUtils.trim(rs.getString("BIZ_ID"));
				compNm = StringUtils.trim(rs.getString("COMP_NM"));
				for(EgovMap m : bizList){
					bizNoNumeric = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("bizNoNumeric"))));
					
					//액셀의 사업자번호와 매핑되는 db 데이터가 없는 경우가 있다, 확인해보니 업체는 있으며, 사업자번호가 틀림, db 데이터 값으로 replace
					if(StringUtils.equals(bizNoNumeric, "1048126728")){ //삼성물산
						bizNoNumeric = "4688500111";
					}else if(StringUtils.equals(bizNoNumeric, "2148720571")){ //현대엔지니어링
						bizNoNumeric = "1018166755";
					}
					
					if(StringUtils.equals(bizId, bizNoNumeric)){
						isMapping = true;
					}
				}
				if(!isMapping){
					eMap.put("bizId", bizId);
					eMap.put("compNm", compNm);
					corpInNList.add(eMap);
				}
			}
			
			System.out.println(">>>>corpInNList");
			System.out.println("corpInNList.size=" + corpInNList.size());
			String tmpId = null;
			String tmpIdHyphen = null;
			for(EgovMap m : corpInNList){
				tmpId = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("bizId"))));
				tmpIdHyphen = tmpId.substring(0, 3) + "-" + tmpId.substring(3, 5) + "-" + tmpId.substring(5, 10); 
				System.out.println(tmpId + "\t" + tmpIdHyphen + "\t" + m.get("compNm"));
			}
			
		} finally {
			close(rs);
			close(st);
			close(con);
		}
	}
	
	
	@SuppressWarnings("unused")
	public void convertBizInfo(List<EgovMap> excelList) throws IOException, SQLException {

		Connection con = this.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = null;
		
		//String bizMajorSql = "SELECT * FROM BNS_SCODE WHERE LCODE = 'BNS270'";
		//String bizIndustrySql = "SELECT * FROM BNS_SCODE WHERE LCODE = 'BNS280'";
		//List<EgovMap> bizMajorList = new ArrayList<EgovMap>();
		//EgovMap eMap = null;
		
		String bizNo = null;
		String bizNoNumeric = null;
		String bizNm = null;
		String majorNm = null;
		String industryNm = null;
		
		String majorCode = null;
		String industryCode = null;

		int result = 0;
		
		try {
			st = con.createStatement();
			
			for(EgovMap m : excelList){
				
				bizNo = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("bizNo"))));
				bizNoNumeric = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("bizNoNumeric"))));
				bizNm = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("bizNm"))));
				industryNm = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("industryNm"))));
				majorNm = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("majorNm"))));
				
				majorCode = this.getMajorCode(majorNm);
				industryCode = this.getIndustryCode(industryNm);
				//System.out.println("majorNm=" + majorNm + ", industryNm=" + industryNm);
				
				//액셀의 사업자번호와 매핑되는 db 데이터가 없는 경우가 있다, 확인해보니 업체는 있으며, 사업자번호가 틀림, db 데이터 값으로 replace
				if(StringUtils.equals(bizNoNumeric, "1048126728")){ //삼성물산
					bizNoNumeric = "4688500111";
				}else if(StringUtils.equals(bizNoNumeric, "2148720571")){ //현대엔지니어링
					bizNoNumeric = "1018166755";
				}
				
				sql = "UPDATE BNS_BIZ_INFO SET MAJOR_YN = '" + majorCode + "', INDUSTRY = '" + industryCode + "' WHERE BIZ_ID = '" + bizNoNumeric + "'";
				//System.out.println(sql);
				
				result += st.executeUpdate(sql);
				System.out.println("result=" + result + ", sql=" + sql);
			}
			System.out.println("result:" + result);
			
		} finally {
			this.close(rs);
			this.close(st);
			this.close(con);
		}
	}
	
	
	
	@SuppressWarnings("unused")
	public void convertBizInfoByIndustryFile() throws IOException, SQLException {

		ExcelUtil eu = new ExcelUtil();
		List<EgovMap> industryExcelList = eu.xlsxToList("D:/Dev/benis/201701/readfile/benis-industry-20170120.xlsx", 1, 1, 0);
		System.out.println("industryExcelList.size=" + industryExcelList.size());
		
		Connection con = this.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = null;
		
		//String bizMajorSql = "SELECT * FROM BNS_SCODE WHERE LCODE = 'BNS270'";
		//String bizIndustrySql = "SELECT * FROM BNS_SCODE WHERE LCODE = 'BNS280'";
		//List<EgovMap> bizMajorList = new ArrayList<EgovMap>();
		//EgovMap eMap = null;
		
		String majorNm = null;
		String industryNm = null;
		String bizNm = null;
		
		String majorCode = null;
		String industryCode = null;
		
		ArrayList<String> corpInList = null;
		String compNm = null;

		int result = 0;
		int r = 0;
		
		try {
			st = con.createStatement();
			
			corpInList = new ArrayList<String>();
			rs = st.executeQuery("SELECT COMP_NM FROM BNS_BIZ_INFO WHERE CORP_IN_YN = 'Y'");
			while(rs.next()){
				corpInList.add(rs.getString(1));
			}
			
			System.out.println("corpInList.size=" + corpInList.size());
			//for(String nm : corpInList){
			//	System.out.println(nm.replaceAll("[^0-9a-zA-Z가-힣()]", "").replaceAll("\\(주\\)", ""));
			//}
			
			for(EgovMap m : industryExcelList){

				majorNm = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("1"))));
				industryNm = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("2"))));
				bizNm = StringUtils.trim(this.nullToEmpty(String.valueOf(m.get("3"))));
				
				majorCode = this.getMajorCode(majorNm);
				industryCode = this.getIndustryCode(industryNm);
				//System.out.println("majorNm=" + majorNm + ", industryNm=" + industryNm);
				
				String tmp = null;
				for(String nm : corpInList){
					tmp = nm.replaceAll("[^0-9a-zA-Z가-힣()]", "").replaceAll("\\(주\\)", "").replaceAll("\\(유\\)", "").replaceAll("주식회사", "").replaceAll(" ", "");
					if(StringUtils.equals(bizNm, tmp)){
						sql = "UPDATE BNS_BIZ_INFO SET MAJOR_YN = '" + majorCode + "', INDUSTRY = '" + industryCode + "' WHERE COMP_NM = '" + nm + "'";
						//System.out.println(sql);
						
						r = st.executeUpdate(sql);
						result += r;
						//System.out.println("result=" + result + ", sql=" + sql);
						
						if(r == 0){
							System.out.println("result=" + result + ", sql=" + sql);
						}
						break;
					}
				}
			}
			System.out.println("result:" + result);
			
		} finally {
			this.close(rs);
			this.close(st);
			this.close(con);
		}
	}
	
	
	@SuppressWarnings("unused")
	public void defaultIntroComUpdate() throws IOException, SQLException {
		
		Connection con = this.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = null;
		
		int result = 0;
		
		try {
			st = con.createStatement();
			
			Path fileName = Paths.get("D:/Dev/benis/201701/convert", "db-introCom-update.txt");
			
			List<String> queryList = null;
			queryList = Files.readAllLines(fileName, Charset.forName("UTF-8"));
			System.out.println("queryList.size=" + queryList.size());
			
			for(String query : queryList){
				if(!StringUtils.startsWith(query, "-")){
					
					System.out.println(query);
					result += st.executeUpdate(query);
				}
			}
			
			System.out.println("result:" + result);
			
		} finally {
			this.close(rs);
			this.close(st);
			this.close(con);
		}
	}
	
	
	/*
	 * C010	준정부기관 
	 * C020	대기업    
	 * C030	중견기업   
	 * C040	1차(중견) 
	 * C050	1차(중소) 
	 * C060	공기업    
	 * C070	지방공기업 
	 * C080	기타공공기관
	 */
	private String getMajorCode(String majorNm){
		String rs = "";
		String str = majorNm.replaceAll("[^0-9a-zA-Z가-힣()]", "");
		
		if(StringUtils.isNotEmpty(str)){
			if(StringUtils.equals(str, "준정부기관")){
				rs = "C010";
			}else if(StringUtils.equals(str, "대기업")){
				rs = "C020"; 
			}else if(StringUtils.equals(str, "중견기업")){
				rs = "C030";
			}else if(StringUtils.equals(str, "1차(중견)")){
				rs = "C040";
			}else if(StringUtils.equals(str, "1차(중소)")){
				rs = "C050";
			}else if(StringUtils.equals(str, "공기업")){
				rs = "C060";
			}else if(StringUtils.equals(str, "지방공기업")){
				rs = "C070";
			}else if(StringUtils.equals(str, "기타공공기관")){
				rs = "C080";
			}
		}
		return rs;
	}
	
	
	/*
	 * A01	가맹점업
	 * A02	건설
	 * A03	공기업
	 * A04	기계·자동차·조선
	 * A05	기타공공기관
	 * A06	도소매
	 * A07	백화점
	 * A08	식품업
	 * A09	전기·전자
	 * A10	정보서비스업
	 * A11	준정부기관
	 * A12	지방공기업
	 * A13	통신업
	 * A14	플랫폼사업자
	 * A15	홈쇼핑업
	 * A16	화학·비금속·금속
	 * A17	민간기타
	 * A18	공공기타
	*/
	private String getIndustryCode(String industry){
		String rs = "";
		String str = industry.replaceAll("[^0-9a-zA-Z가-힣()]", "");
		
		if(StringUtils.isNotEmpty(str)){
			if(StringUtils.equals(str, "가맹점업")){
				rs = "A01";
			}else if(StringUtils.equals(str, "건설")){
				rs = "A02"; 
			}else if(StringUtils.equals(str, "공기업")){
				rs = "A03";
			}else if(StringUtils.equals(str, "기계자동차조선")){
				rs = "A04";
			}else if(StringUtils.equals(str, "기타공공기관")){
				rs = "A05";
			}else if(StringUtils.equals(str, "도소매")){
				rs = "A06";
			}else if(StringUtils.equals(str, "백화점")){
				rs = "A07";
			}else if(StringUtils.equals(str, "식품업")){
				rs = "A08";
			}else if(StringUtils.equals(str, "전기전자")){
				rs = "A09";
			}else if(StringUtils.equals(str, "정보서비스업")){
				rs = "A10";
			}else if(StringUtils.equals(str, "준정부기관")){
				rs = "A11";
			}else if(StringUtils.equals(str, "지방공기업")){
				rs = "A12";
			}else if(StringUtils.equals(str, "통신업")){
				rs = "A13";
			}else if(StringUtils.equals(str, "플랫폼사업자")){
				rs = "A14";
			}else if(StringUtils.equals(str, "홈쇼핑업")){
				rs = "A15";
			}else if(StringUtils.equals(str, "화학비금속금속")){
				rs = "A16";
			}else{
				rs = "A17"; //민간기타
			}
		}
		return rs;
	}
	
	
	private String getTime(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new Date());
	}
	
	private String nullToEmpty(String str){
		if(str == null){
			return "";
		}
		return str;
	}
	
	private void close(Connection con) {
		try {
			if (con != null) {
				con.close();
				con = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void close(Statement st) {
		try {
			if (st != null) {
				st.close();
				st = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void close(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
