package convert;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public class HsptlDataConverter {

	public static void main(String[] args) throws Exception{

		System.out.println("============================================================");
		
		HsptlDataConverter hdc = new HsptlDataConverter();

		/*
		System.out.println("<testDB timestamp=\"" + hdc.getTime() + "\">");
		hdc.testDB();
		System.out.println("</testDB timestamp=\"" + hdc.getTime() + "\">");
		*/
		
		/*
		System.out.println("<testReadExcel timestamp=\"" + hdc.getTime() + "\">");
		hdc.testReadExcel();
		System.out.println("</testReadExcel timestamp=\"" + hdc.getTime() + "\">");
		*/
		
		
		System.out.println("<insertHsptl timestamp=\"" + hdc.getTime() + "\">");
		hdc.insertHsptl();
		System.out.println("</insertHsptl timestamp=\"" + hdc.getTime() + "\">");
		
		
		/*
		System.out.println("<insertCorpUser timestamp=\"" + hdc.getTime() + "\">");
		hdc.insertCorpUser();
		System.out.println("</insertCorpUser timestamp=\"" + hdc.getTime() + "\">");
		*/

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

	public HsptlDataConverter() throws ClassNotFoundException {
		Class.forName("org.mariadb.jdbc.Driver");
	}

	public Connection getConnection() throws SQLException {
		Connection con = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3307/test", "test", "test123");
		return con;
	}
	
	public void testDB() throws IOException, SQLException {
		Connection con = this.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = null;
		
		try{
			st = con.createStatement();
			
			sql = "SELECT COUNT(*) CNT FROM TB_HSPTL";
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				System.out.println("CNT=" + rs.getString("CNT"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			this.close(rs);
			this.close(st);
			this.close(con);
		}
		
	}
	
	public void testReadExcel(){
		
		List<EgovMap> excelList = this.getExcelList("D:/Dev/badugi/work/badugi-hsptl-base-20170524.xlsx", 0, 0, 2);
		
		System.out.println("size=" + excelList.size());
		for(EgovMap m : excelList){
			System.out.println(m.toString());
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
	
	public List<EgovMap> getExcelList(String filePath, Integer fromSheet, Integer toSheet, Integer startRow){
		
		ExcelUtil eu = new ExcelUtil();
		List<EgovMap> excelList = eu.xlsxToList(filePath, fromSheet, toSheet, startRow);
		
		//System.out.println("excelList.size()=" + excelList.size());
		/*
		for(EgovMap eMap : excelList){
			System.out.print("0=" + eMap.get("0"));
			System.out.print(",1=" + eMap.get("1"));
			System.out.print(",2=" + eMap.get("2"));
			System.out.println("\n");
		}
		*/
		return excelList;
	}
	
	
	public void insertHsptl() throws IOException, SQLException {
		
		List<EgovMap> excelList = this.getExcelList("D:/Dev/badugi/work/badugi-hsptl-base-20170524.xlsx", 1, 1, 2);
		
		Connection con = this.getConnection();
		PreparedStatement ps = null;
		String sql = null;
		
		int result = 0;
		int hsptlKey = 0;
		
		List<String> insertedList = new ArrayList<String>();
		insertedList.add("DEFAULT");
		String thisIns = "";
		
		NumberFormat nf = NumberFormat.getInstance();
		nf.setGroupingUsed(false);
		
		
		try {
			
			StringBuffer sbSql = new StringBuffer();
			sbSql.append(" HSPTL_KEY");
			sbSql.append(",HSPTL_NM");
			sbSql.append(",CLASS_CD");
			sbSql.append(",TEL");
			sbSql.append(",FAX");
			
			sbSql.append(",LEGAL_CD");
			sbSql.append(",LEGAL_SIDO_CD");
			sbSql.append(",LEGAL_SIDO_NM");
			sbSql.append(",LEGAL_SGGU_CD");
			sbSql.append(",LEGAL_SGGU_NM");
			sbSql.append(",LEGAL_DONG_CD");
			sbSql.append(",LEGAL_DONG_NM");
			sbSql.append(",LEGAL_RI_CD");
			sbSql.append(",LEGAL_RI_NM");
			
			sbSql.append(",LEGAL_ADDR1");
			sbSql.append(",LEGAL_ADDR2");
			sbSql.append(",ROAD_ADDR1");
			sbSql.append(",ROAD_ADDR2");
			sbSql.append(",POS_LAT");
			sbSql.append(",POS_LON");
			sbSql.append(",FRST_OPER_ID");
			sbSql.append(",FRST_OPER_DT");
			sbSql.append(",CMPLT_FLG");
			sbSql.append(",ACT_FLG");
			
			sql = this.makeInsertQuery(sbSql.toString(), "TB_HSPTL", 24);
			
			ps = con.prepareStatement(sql);
			
			String trs = "";
			String trsTyp = "";
			String trsArea = "";
			String tel = "";
			String fax = "";
			
			String legalCd = "";
			String legalSidoCd = "";
			String legalSidoNm = "";
			String legalSgguCd = "";
			String legalSgguNm = "";
			String legalDongCd = "";
			String legalDongNm = "";
			String legalRiCd = "";
			String legalRiNm = "";
			
			String legal1 = "";
			String legal2 = "";
			String legal3 = "";
			String legalAddr1 = "";
			
			String road1 = "";
			String road2 = "";
			String road3 = "";
			String road4 = "";
			String road5 = "";
			String road6 = "";
			String roadAddr1 = "";
			
			EgovMap m = null;
			for(int i=0; i<excelList.size(); i++){
				m = excelList.get(i);
				
				trs = "";
				trsTyp = "";
				trsArea = "";
				tel = "";
				fax = "";
				
				legalCd = "";
				legalSidoCd = "";
				legalSidoNm = "";
				legalSgguCd = "";
				legalSgguNm = "";
				legalDongCd = "";
				legalDongNm = "";
				legalRiCd = "";
				legalRiNm = "";

				legal1 = "";
				legal2 = "";
				legal3 = "";
				legalAddr1 = "";

				road1 = "";
				road2 = "";
				road3 = "";
				road4 = "";
				road5 = "";
				road6 = "";
				roadAddr1 = "";
				
				//telephone_key, bjd_code를 조합하여 동일주소지인지 구분
				thisIns = this.nullToEmpty(String.valueOf(m.get("1"))) + "-" + nf.format(Double.parseDouble(this.nullToEmpty(String.valueOf(m.get("15")))));
				System.out.println("thisIns=" + thisIns);

				
				////
				trs = this.nullToEmpty(String.valueOf(m.get("12")));
				trsTyp = this.nullToEmpty(String.valueOf(m.get("13")));
				trsArea = this.nullToEmpty(String.valueOf(m.get("11"))).replace(".0", "");
				
				if(trsArea.length() == 1){
					trsArea = StringUtils.leftPad(trsArea, 2, "0");
				}else if(trsArea.length() == 2){
					trsArea = StringUtils.leftPad(trsArea, 3, "0");
				}
				
				if(StringUtils.isEmpty(trsTyp)){
					tel = trsArea + "-" + trs;
				}else{
					if(StringUtils.equals(trsTyp, "팩스")){
						fax = trsArea + "-" + trs;
					}else if(StringUtils.equals(trsTyp, "팩스겸용")){
						tel = trsArea + "-" + trs;
						fax = trsArea + "-" + trs;
					}else{
						//
					}					
				}
				
				////
				legalCd = nf.format(Double.parseDouble(this.nullToEmpty(String.valueOf(m.get("15")))));
				legalSidoCd = legalCd.substring(0, 2);
				legalSidoNm = this.nullToEmpty(String.valueOf(m.get("22")));
				legalSgguCd = legalSidoNm.indexOf("세종") == -1 ? legalCd.substring(2, 5) : "";
				legalSgguNm = (this.nullToEmpty(String.valueOf(m.get("23"))) + " " + this.nullToEmpty(String.valueOf(m.get("24")))).trim();
				legalDongCd = "";
				legalDongNm = "";
				legalRiCd = "";
				legalRiNm = "";

				////
				legal1 = this.nullToEmpty(String.valueOf(m.get("16")));
				legal2 = this.nullToEmpty(String.valueOf(m.get("18"))).replace(".0", "");
				legal3 = this.nullToEmpty(String.valueOf(m.get("19"))).replace(".0", "");
				
				if(StringUtils.isNotEmpty(legal1)){
					legalAddr1 = legal1;
					if(StringUtils.isNotEmpty(legal2) && !StringUtils.equals(legal2, "0")){
						legalAddr1 = legalAddr1 + " " + legal2;
						if(StringUtils.isNotEmpty(legal3) && !StringUtils.equals(legal3, "0")){
							legalAddr1 = legalAddr1 + "-" + legal3;
						}
					}
				}
				
				////
				road1 = this.nullToEmpty(String.valueOf(m.get("22")));
				road2 = this.nullToEmpty(String.valueOf(m.get("23")));
				road3 = this.nullToEmpty(String.valueOf(m.get("24")));
				road4 = this.nullToEmpty(String.valueOf(m.get("25")));
				road5 = this.nullToEmpty(String.valueOf(m.get("26"))).replace(".0", "");
				road6 = this.nullToEmpty(String.valueOf(m.get("27"))).replace(".0", "");
				
				if(StringUtils.isNotEmpty(road1)){
					roadAddr1 = road1;
					if(StringUtils.isNotEmpty(road2)){
						roadAddr1 = roadAddr1 + " " + road2; 
					}
					if(StringUtils.isNotEmpty(road3)){
						roadAddr1 = roadAddr1 + " " + road3; 
					}
					if(StringUtils.isNotEmpty(road4)){
						roadAddr1 = roadAddr1 + " " + road4; 
					}
					if(StringUtils.isNotEmpty(road5) && !StringUtils.equals(road5, "0")){
						roadAddr1 = roadAddr1 + " " + road5;
						if(StringUtils.isNotEmpty(road6) && !StringUtils.equals(road6, "0")){
							roadAddr1 = roadAddr1 + "-" + road6; 
						}
					}
				}
				
				//if(insertedList.indexOf(thisIns) == -1){
				System.out.println(insertedList.get(insertedList.size()-1) + "==" + thisIns);
				if(!StringUtils.equals(insertedList.get(insertedList.size()-1), thisIns)){
					insertedList.add(thisIns);
					hsptlKey = hsptlKey + 1;
					
					ps.setObject(1, hsptlKey);    //hsptlKey
					ps.setObject(2, m.get("3"));     //hsptlNm
					ps.setObject(3, "A001");     //classCd
					ps.setObject(4, tel);     //tel
					ps.setObject(5, fax);     //fax
					
					ps.setObject(6, legalCd);     //
					ps.setObject(7, legalSidoCd);     //
					ps.setObject(8, legalSidoNm);     //
					ps.setObject(9, legalSgguCd);     //
					ps.setObject(10, legalSgguNm);     //
					ps.setObject(11, legalDongCd);     //
					ps.setObject(12, legalDongNm);     //
					ps.setObject(13, legalRiCd);     //
					ps.setObject(14, legalRiNm);     //
					
					ps.setObject(15, legalAddr1);     //legalAddr1
					ps.setObject(16, "");     //legalAddr2
					ps.setObject(17, roadAddr1);     //roadAddr1
					ps.setObject(18, "");     //roadAddr2
					ps.setObject(19, m.get("30"));     //posLat
					ps.setObject(20, m.get("31"));    //posLon
					ps.setObject(21, "dev");    //frstOperId
					ps.setObject(22, "2017-05-24 16:00:00");    //frstOperDt
					ps.setObject(23, "N");    //cmpltFlg
					ps.setObject(24, "N");    //actFlg
	
					result += ps.executeUpdate();
					System.out.println("INSERT HSPTL EXCEL-SEQ=" + m.get("0") + ", hsptlKey=" + hsptlKey + ", hsptlNm=" + m.get("3"));
					
					//insert tel
					/*
					if(StringUtils.isNotEmpty(tel)){
						EgovMap hsptlTelMap = new EgovMap();
						hsptlTelMap.put("hsptlKey", hsptlKey);
						hsptlTelMap.put("hsptlTelKey", "1");
						hsptlTelMap.put("tel", tel);
						hsptlTelMap.put("dlgFlg", "Y");
						
						this.insertHsptlTel(hsptlTelMap);
					}
					*/
				}else{
					//insert tel
					if(StringUtils.isNotEmpty(tel)){
						EgovMap hsptlTelMap = new EgovMap();
						hsptlTelMap.put("hsptlKey", hsptlKey);
						hsptlTelMap.put("hsptlTelKey", "");
						hsptlTelMap.put("tel", tel);
						hsptlTelMap.put("useInfo", "");
						
						this.insertHsptlTel(hsptlTelMap);
					}
				}
			}
			System.out.println("result=" + result);
			
		} finally {
			this.close(ps);
			this.close(con);
		}
	}

	
	public void insertHsptlTel(EgovMap hsptlTelMap) throws IOException, SQLException {
		
		Connection con = this.getConnection();
		PreparedStatement ps = null;
		Statement st = null;
		ResultSet rs = null;
		String sql = null;
		Integer result = 0;
		
		String sHsptlTelKey = "";
		Integer hsptlTelKey = 0;
		
		try {
			st = con.createStatement();
			
			sHsptlTelKey = this.nullToEmpty(String.valueOf(hsptlTelMap.get("hsptlTelKey")));
			if(StringUtils.isEmpty(sHsptlTelKey) || StringUtils.equals(sHsptlTelKey, "0")){
				rs = st.executeQuery("SELECT IFNULL(MAX(HSPTL_TEL_KEY), 0) + 1 hsptlTelKey FROM TB_HSPTL_TEL WHERE HSPTL_KEY = " + hsptlTelMap.get("hsptlKey"));
				if(rs.next()){
					hsptlTelKey = rs.getInt(1);
				}
			}else{
				hsptlTelKey = Integer.parseInt(sHsptlTelKey);
			}
			
			StringBuffer sbSql = new StringBuffer();
			sbSql.append(" HSPTL_KEY");
			sbSql.append(",HSPTL_TEL_KEY");
			sbSql.append(",TEL");
			sbSql.append(",USE_INFO");
			sbSql.append(",FRST_OPER_ID");
			sbSql.append(",FRST_OPER_DT");
			
			sql = this.makeInsertQuery(sbSql.toString(), "TB_HSPTL_TEL", 6);
			
			ps = con.prepareStatement(sql);
			
			ps.setObject(1, hsptlTelMap.get("hsptlKey"));    //hsptlKey
			ps.setObject(2, hsptlTelKey);     //hsptlTelKey
			ps.setObject(3, hsptlTelMap.get("tel"));     //tel
			ps.setObject(4, hsptlTelMap.get("useInfo"));     //dlgFlg
			ps.setObject(5, "dev");     //frstOperId
			ps.setObject(6, "2017-05-24 16:00:00");     //frstOperDt

			result += ps.executeUpdate();
			System.out.println("INSERT HSPTL_TEL=" + hsptlTelMap.toString());

		}catch(Exception e){
			e.printStackTrace();
		} finally {
			this.close(st);
			this.close(ps);
			this.close(con);
		}
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
