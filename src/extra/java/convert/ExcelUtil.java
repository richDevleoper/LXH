/*
 * @(#)ExcelUtil.java
 */
package convert;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public class ExcelUtil {
	//private static Log log = LogFactory.getLog(ExcelUtil.class);

	/**
	 * 
	 * @param filePath
	 * @return
	 */
	public List<EgovMap> xlsToList(String filePath) {
		
		// 반환할 객체를 생성
		List<EgovMap> list = new ArrayList<EgovMap>();
		
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		
		try {
			
			fis= new FileInputStream(filePath);
			// HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
			workbook = new HSSFWorkbook(fis);
			
			// 탐색에 사용할 Sheet, Row, Cell 객체
			HSSFSheet curSheet;
			HSSFRow   curRow;
			HSSFCell  curCell;
			EgovMap vo;
			
			// Sheet 탐색 for문
			for(int sheetIndex = 0 ; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
				// 현재 Sheet 반환
				curSheet = workbook.getSheetAt(sheetIndex);
				// row 탐색 for문
				for(int rowIndex=0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					// row 0은 헤더정보이기 때문에 무시
					if(rowIndex != 0) {
						// 현재 row 반환
						curRow = curSheet.getRow(rowIndex);
						vo = new EgovMap();
						String value;
						
						// row의 첫번째 cell값이 비어있지 않은 경우 만 cell탐색
						if(!"".equals(curRow.getCell(0).getStringCellValue())) {
							
							// cell 탐색 for 문
							for(int cellIndex=0;cellIndex<curRow.getPhysicalNumberOfCells(); cellIndex++) {
								curCell = curRow.getCell(cellIndex);
								
								if(true) {
									value = "";
									// cell 스타일이 다르더라도 String으로 반환 받음
									switch (curCell.getCellType()){
					                case HSSFCell.CELL_TYPE_FORMULA:
					                	value = curCell.getCellFormula();
					                    break;
					                case HSSFCell.CELL_TYPE_NUMERIC:
					                	value = curCell.getNumericCellValue()+"";
					                    break;
					                case HSSFCell.CELL_TYPE_STRING:
					                    value = curCell.getStringCellValue()+"";
					                    break;
					                case HSSFCell.CELL_TYPE_BLANK:
					                    value = curCell.getBooleanCellValue()+"";
					                    break;
					                case HSSFCell.CELL_TYPE_ERROR:
					                    value = curCell.getErrorCellValue()+"";
					                    break;
					                default:
					                	value = new String();
										break;
					                }
									
									// 현재 column index에 따라서 vo에 입력
									switch (cellIndex) {
									case 0: // 아이디
										vo.put("1", value);
										break;
										
									case 1: // 이름
										vo.put("2", value);
										break;
										
									case 2: // 나이
										vo.put("3", value);
										break;
										
									case 3: // 이메일
										vo.put("4", value);
										break;
		
									default:
										break;
									}
								}
							}
							// cell 탐색 이후 vo 추가
							list.add(vo);
						}
					}
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
			
		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if( workbook!= null) workbook.close();
				if( fis!= null) fis.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	/**
	 * 
	 * @param filePath
	 * @return
	 */
	public List<EgovMap> xlsxToList(String filePath, Integer fromSheet, Integer toSheet, Integer startRow) {
		// 반환할 객체를 생성
		List<EgovMap> list = new ArrayList<EgovMap>();
		
		FileInputStream fis = null;
		XSSFWorkbook workbook = null;
		
		try {
			
			fis= new FileInputStream(filePath);
			// HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
			workbook = new XSSFWorkbook(fis);
			
			// 탐색에 사용할 Sheet, Row, Cell 객체
			XSSFSheet curSheet;
			XSSFRow   curRow;
			XSSFCell  curCell;
			EgovMap map;
			
			// Sheet 탐색 for문
			//for(int sheetIndex = 0 ; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
			for(int sheetIndex = fromSheet ; sheetIndex <= toSheet; sheetIndex++) {
				// 현재 Sheet 반환
				curSheet = workbook.getSheetAt(sheetIndex);
				// row 탐색 for문
				for(int rowIndex=startRow; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					// 현재 row 반환
					curRow = curSheet.getRow(rowIndex);
					if(curRow != null){
						//System.out.println(curRow.getRowNum());
						map = new EgovMap();
						String value;
						
						// row의 첫번째 cell값이 비어있지 않은 경우 만 cell탐색
						//System.out.println("curRow.getCell(0).toString() : " + curRow.getCell(0).toString());
						//if(!"".equals(curRow.getCell(0).getStringCellValue())) {
						if(curRow.getCell(0) != null && !"".equals(curRow.getCell(0).toString())) {
							
							// cell 탐색 for 문
							for(int cellIndex=0;cellIndex<curRow.getPhysicalNumberOfCells(); cellIndex++) {
								curCell = curRow.getCell(cellIndex);
								//System.out.println(curCell.toString());
								
								if(true) {
									value = "";
									// cell 스타일이 다르더라도 String으로 반환 받음
									//System.out.println("cellIndex : " + cellIndex + ", curCell.getCellType() : " + curCell.getCellType());
									switch (curCell.getCellType()){
					                case HSSFCell.CELL_TYPE_FORMULA:
					                	value = curCell.getCellFormula();
					                    break;
					                case HSSFCell.CELL_TYPE_NUMERIC:
					                	value = curCell.getNumericCellValue()+"";
					                    break;
					                case HSSFCell.CELL_TYPE_STRING:
					                    value = curCell.getStringCellValue()+"";
					                    break;
					                case HSSFCell.CELL_TYPE_BLANK:
					                    //value = curCell.getBooleanCellValue()+"";
					                	value = curCell.getStringCellValue()+"";
					                    break;
					                case HSSFCell.CELL_TYPE_ERROR:
					                    value = curCell.getErrorCellValue()+"";
					                    break;
					                default:
					                	value = new String();
										break;
					                }
									
									// 현재 column index에 따라서 vo에 입력
									/*
									switch (cellIndex) {
									case 0: // 아이디
										vo.put("1", value);
										break;
										
									case 1: // 이름
										vo.put("2", value);
										break;
										
									case 2: // 나이
										vo.put("3", value);
										break;
										
									case 3: // 이메일
										vo.put("4", value);
										break;
		
									default:
										break;
									}
									*/
									map.put(String.valueOf(cellIndex) , value);
								}
							}
							// cell 탐색 이후 vo 추가
							//System.out.println(map.toString());
							list.add(map);
						}
					}
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
			
		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if( workbook!= null) workbook.close();
				if( fis!= null) fis.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
	
	public static void main(String[] args) throws Exception {
		
		/*
		 * test case
		 */
		/*
		ExcelUtil eu = new ExcelUtil();
		List<EgovMap> list = eu.xlsxToList("E:\\Dev\\Temp\\scode.xlsx");
		//List<EgovMap> list = eu.xlsToList("E:\\Dev\\Temp\\scode.xls");
		for(EgovMap em : list){
			System.out.println(em.toString());
		}
		*/
	}
}