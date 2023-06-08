package kr.freedi.dev.qeducation.excel;

import java.io.BufferedReader;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Clob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public class ExcelFunction {
	public static void excelWriter(HttpServletRequest request, HttpServletResponse response, 
			List<HashMap<String,Object>> dataList, String fileName, String[] colIdArr, String[] colNameArr) throws Exception {
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-disposition","attachment;filename=" + new String(fileName.getBytes("euc-kr"),"8859_1"));
		response.setHeader("Cache-Control", "max-age=0");
		OutputStream os = response.getOutputStream();
		XSSFWorkbook wb 	= new XSSFWorkbook();
		
		XSSFFont font = wb.createFont();
		font.setFontHeightInPoints((short)10);
				
		XSSFCellStyle headerStyle = wb.createCellStyle();
		
		headerStyle.setFont(font);
		headerStyle.setBorderBottom(BorderStyle.THIN);
        headerStyle.setBorderLeft(BorderStyle.THIN);
        headerStyle.setBorderRight(BorderStyle.THIN);
        headerStyle.setBorderTop(BorderStyle.THIN);
        headerStyle.setAlignment(HorizontalAlignment.CENTER);
        headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        headerStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        headerStyle.setLocked(true);
		
        XSSFCellStyle normalStyle = wb.createCellStyle();
		normalStyle.setFont(font);
		normalStyle.setLocked(false);
		
		XSSFCellStyle errorStyle = wb.createCellStyle();
		errorStyle.setFillForegroundColor(IndexedColors.ROSE.getIndex());
		errorStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		errorStyle.setLocked(false);
		
		try{
			int sheetIdx = 0;
			do{
				
				int rowIdx = 0;
				String sheetName = fileName.substring(0, fileName.lastIndexOf('.'));
				XSSFSheet sheet 	= wb.createSheet(sheetName+"_"+(++sheetIdx));
				sheet.setDefaultColumnWidth(15);
				
				XSSFRow row0		= sheet.createRow(0);
				for(int i=0; i<colNameArr.length; i++){
					XSSFCell headerCell = row0.createCell(i);
					headerCell.setCellValue(colNameArr[i].toString());
					headerCell.setCellStyle(headerStyle);
				}					
				
				while(!dataList.isEmpty() && (rowIdx+1)<60000){
					HashMap<String, Object> map = (HashMap<String, Object>)dataList.remove(0);
					
					XSSFRow row = sheet.createRow(++rowIdx);
					for(int i=0; i<colIdArr.length; i++){	
						XSSFCell cell = null;
						Object value = map.get(colIdArr[i]);
						
						if(value == null){
							cell = row.createCell(i, Cell.CELL_TYPE_BLANK);
						}else if(value instanceof Boolean){
							cell = row.createCell(i, Cell.CELL_TYPE_BOOLEAN);
							cell.setCellValue((Boolean)value);
						}else if(value instanceof Integer){
							cell = row.createCell(i, Cell.CELL_TYPE_NUMERIC);
							cell.setCellValue((Integer)value);
						}else if(value instanceof Long){
							cell = row.createCell(i, Cell.CELL_TYPE_NUMERIC);
							cell.setCellValue((Long)value);
						}else if(value instanceof Float){
							cell = row.createCell(i, Cell.CELL_TYPE_NUMERIC);
							cell.setCellValue((Float)value);
						}else if(value instanceof Double){
							cell = row.createCell(i, Cell.CELL_TYPE_NUMERIC);
							cell.setCellValue((Double)value);
						}else if(value instanceof BigDecimal){
							cell = row.createCell(i, Cell.CELL_TYPE_NUMERIC);
							cell.setCellValue(((BigDecimal)value).doubleValue());
						}else if(value instanceof BigInteger){
							cell = row.createCell(i, Cell.CELL_TYPE_NUMERIC);
							cell.setCellValue(((BigInteger)value).longValue());
						}else if(value instanceof String){
							cell = row.createCell(i, Cell.CELL_TYPE_STRING);
							cell.setCellValue(value.toString());
						}else if(value instanceof Clob){
							cell = row.createCell(i, Cell.CELL_TYPE_STRING);
							StringBuffer buffer = new StringBuffer();
							BufferedReader reader = new BufferedReader(((Clob)value).getCharacterStream());
							String clobVal = "";
							while((clobVal = reader.readLine()) != null){
								buffer.append(clobVal);
							}
							reader.close();
							cell.setCellValue(buffer.toString());
						}else{
							cell = row.createCell(i, Cell.CELL_TYPE_STRING);
						}

						if(i==0){
							cell.setCellStyle(headerStyle);
						}else{
							cell.setCellStyle(normalStyle);							
						}
						
						/*
						if(cell.getCellTypeEnum() == CellType.BLANK) {
							
						}
						*/
					}
				}
			}while(!dataList.isEmpty());
			wb.write(os);
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}finally{
			if(os!=null) try{os.close();}catch(Exception e){}
		}	
		
		
		
		
		
		
		
		
	
	}
}
