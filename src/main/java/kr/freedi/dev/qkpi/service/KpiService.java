package kr.freedi.dev.qkpi.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qkpi.domain.KpiManageVO;
import kr.freedi.dev.qkpi.domain.KpiSearchVO;
import kr.freedi.dev.qkpi.domain.KpiVO;
import kr.freedi.dev.qpopup.domain.DepartVO;
import kr.freedi.dev.qpopup.domain.UserVO;
import kr.freedi.dev.qreport.domain.MakeSearchVO;
import kr.freedi.dev.qreport.domain.MakeVO;
import kr.freedi.dev.qreport.domain.ReportTeamVO;
import kr.freedi.dev.qreport.service.ReportTeamService;


@Service("kpiService")
public class KpiService {
	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	@Resource(name = "kpiUserIdGnrService")
	private EgovIdGnrService kpiUserIdGnrService;
	

	public JsonArray getPlanData(KpiSearchVO vo) {
		
		List<EgovMap> data = dao.selectList("KPI.selectMgrPlan", vo);
		
		return this.buildTree(data, "50000000");
	}
	
	public JsonArray buildTree(List<EgovMap> list, String parentId) {
		
		//System.out.println("BuildTree - " + parentId);
		
        JsonArray resultArray = new JsonArray();

        for (int i = 0; i < list.size(); i++) {

        	EgovMap item = list.get(i);

            String id = (String) item.get("deptCode");
            String name = (String) item.get("deptName");
            String parent = (String) item.get("deptUperCode");

            if ((parentId == null && parent == null) || (parentId != null && parentId.equals(parent))) {
                JsonObject node = new JsonObject();
                node.addProperty("id", id);
                node.addProperty("name", name);
                
        		node.addProperty("GB1_1", "0");
        		node.addProperty("GB1_2", "0");
        		node.addProperty("BB1_1", "0");
        		node.addProperty("BB1_2", "0");
        		node.addProperty("MBB1_1", "0");
        		node.addProperty("MBB1_2", "0");
        		node.addProperty("BB이상1_1", "0");
        		node.addProperty("BB이상1_2", "0");
        		
        		int totalCnt = Integer.parseInt(item.get("gbCnt").toString());
        		totalCnt += Integer.parseInt(item.get("bbCnt").toString());
        		totalCnt += Integer.parseInt(item.get("mbbCnt").toString());
        		totalCnt += Integer.parseInt(item.get("bbuCnt").toString());
        		
        		node.addProperty("KPI_CNT", String.valueOf(totalCnt));
        		node.addProperty("GB2_1", String.valueOf(item.get("kmGbUserCnt")));
        		node.addProperty("GB2_2", String.valueOf(item.get("gbRat")));
        		node.addProperty("BB2_1", String.valueOf(item.get("kmBbUserCnt")));
        		node.addProperty("BB2_2", String.valueOf(item.get("bbRat")));
        		node.addProperty("MBB2_1", String.valueOf(item.get("kmMbbUserCnt")));
        		node.addProperty("MBB2_2", String.valueOf(item.get("mbbRat")));
        		node.addProperty("BB이상2_1", String.valueOf(item.get("kmBbuUserCnt")));
        		node.addProperty("BB이상2_2", String.valueOf(item.get("bbuRat")));
        		
        		node.addProperty("GB3_1", String.valueOf(item.get("gbCertCnt")));
        		node.addProperty("GB3_2", String.valueOf(item.get("gbCertRat")));
        		node.addProperty("BB3_1", String.valueOf(item.get("bbCertCnt")));
        		node.addProperty("BB3_2", String.valueOf(item.get("bbCertRat")));
        		node.addProperty("MBB3_1", String.valueOf(item.get("mbbCertCnt")));
        		node.addProperty("MBB3_2", String.valueOf(item.get("mbbCertRat")));
        		node.addProperty("BB이상3_1", String.valueOf(item.get("bbuCertCnt")));
        		node.addProperty("BB이상3_2", String.valueOf(item.get("bbuCertRat")));
        		node.addProperty("name5", String.valueOf(item.get("totCnt")));
                
                
                JsonArray children = buildTree(list, id);
                if (children.size() > 0) {
                    node.add("_children", children);
                }
                resultArray.add(node);
            }
        }
        
        return resultArray;
    }
	
	public JsonArray getPlanDataTMbb(KpiSearchVO vo) {
		
		List<EgovMap> data = dao.selectList("KPI.selectMgrMBBPlan", vo);
		
		return this.buildTMbbTree(data, "50000000");
	}
	
	public JsonArray buildTMbbTree(List<EgovMap> list, String parentId) {
		
		//System.out.println("BuildTree - " + parentId);
		
        JsonArray resultArray = new JsonArray();

        for (int i = 0; i < list.size(); i++) {
        	EgovMap item = list.get(i);
        	//{level1=1, deptCode=50000000, deptName=CEO, deptUperCode=null, deptSortOrder=1, deptLevel=1, deptStateCode=U, comCode=C100, deptLv1Code=null, deptLv2Code=null, deptLv3Code=null, deptLv4Code=null, deptLv1Name=null, deptLv2Name=null, deptLv3Name=null, deptLv4Name=null, updateDate=2023-05-31 02:20:02.0, regDate=2009-03-27 15:56:23.0}
            String id = (String) item.get("deptCode");
            String name = (String) item.get("deptName");
            String parent = (String) item.get("deptUperCode");

            if ((parentId == null && parent == null) || (parentId != null && parentId.equals(parent))) {
                JsonObject node = new JsonObject();
                node.addProperty("id", id);
//                if(name.equals("CEO"))
//                	name="생산/기술/R&D/품질";
                node.addProperty("DEPT_NAME", name);
        		node.addProperty("MBB_23", String.valueOf(item.get("gbCnt1")));
        		node.addProperty("MBB_CNT", String.valueOf(item.get("gbRat1")));
        		node.addProperty("MBB_RATE", String.valueOf(item.get("bbCnt1")));
        		node.addProperty("ST_DIRECT", String.valueOf(item.get("bbRat1")));
        		node.addProperty("ST_DIRECT_RMK", String.valueOf(item.get("mbbCnt1")));
        		node.addProperty("ST_SUPORT", String.valueOf(item.get("mbbRat1")));
        		node.addProperty("ST_SUPORT_RMK", String.valueOf(item.get("bbuCnt1")));
        		node.addProperty("ST_TMBB", String.valueOf(item.get("bbuRat1")));
        		node.addProperty("ST_TMBB_RMK", String.valueOf(item.get("gbCnt2")));
        		node.addProperty("ACT_CNT", String.valueOf(item.get("gbRat2")));
        		node.addProperty("ACT_RATE", String.valueOf(item.get("bbCnt2")));
        		node.addProperty("YPLAN_CNT", String.valueOf(item.get("bbRat2")));
        		node.addProperty("YPLAN_RATE", String.valueOf(item.get("mbbCnt2")));
                
                
                JsonArray children = buildTMbbTree(list, id);
                if (children.size() > 0) {
                    node.add("_children", children);
                }
                resultArray.add(node);
            }
        }
        
        return resultArray;
    }
	
	
	public List<KpiManageVO> selectKpiUserDetailList(MakeVO makeVO) throws Exception {
		
		return dao.selectList("KPI.selectUserDetail", makeVO);
	}
	
	public List<KpiManageVO> selectKpiFullList(KpiSearchVO searchVO) {
		
		return dao.selectList("KPI.selectFullList", searchVO);
	}
	
	public int selectKpiListCount(KpiSearchVO searchVO) {
		return (Integer) dao.selectOne("KPI.selectCirclListCount", searchVO);
	}
	
	public int updateMaster(KpiVO vo){
		return (Integer)dao.update("KPI.updateKpiMaster", vo);
	}
	
	public int insertMaster(KpiVO vo) {
		return (Integer)dao.insert("KPI.insertKpiMaster", vo);
	}
	
	public List<HashMap<String, String>> getDeptStatus(HashMap<String, String> param){
		return dao.selectList("KPI.getDeptStatus", param);
	}

	public String selectDepartName(HashMap<String, String> param) {
		return (String) dao.selectOne("KPI.selectDepartName", param);
	}
}
