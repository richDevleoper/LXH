package kr.freedi.dev.qkpi.service;

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
		
		return this.buildTree(data, null);
	}

	
	
	
	public JsonArray buildTree(List<EgovMap> list, String parentId) {
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
                if(name.equals("CEO"))
                	name="생산/기술/R&D/품질";
                node.addProperty("name", name);
        		node.addProperty("GB1_1", 193+i);
        		node.addProperty("GB1_2", 30+i);
        		node.addProperty("BB1_1", 193+i);
        		node.addProperty("BB1_2", 30+i);
        		node.addProperty("MBB1_1", 30+i);
        		node.addProperty("MBB1_2", 30+i);
        		node.addProperty("BB이상1_1", 180+i);
        		node.addProperty("BB이상1_2", 180+i*2);
        		node.addProperty("GB2_1", 193);
        		node.addProperty("GB2_2", 30+i);
        		node.addProperty("BB2_1", 150+i);
        		node.addProperty("BB2_2", i+1);
        		node.addProperty("MBB2_1", 110+i*5);
        		node.addProperty("MBB2_2", 30+i);
        		node.addProperty("BB이상2_1", 180+i);
        		node.addProperty("BB이상2_2", 30+i);
        		node.addProperty("GB3_1", 180+i*2);
        		node.addProperty("GB3_2", 30+i);
        		node.addProperty("BB3_1", 180+i*2);
        		node.addProperty("BB3_2", 30+i);
        		node.addProperty("MBB3_1", 180+i*2);
        		node.addProperty("MBB3_2", 30+i);
        		node.addProperty("BB이상3_1", 180+i);
        		node.addProperty("BB이상3_2", 30+i);
        		node.addProperty("name5", i+i);
                
                
                JsonArray children = buildTree(list, id);
                if (children.size() > 0) {
                    node.add("_children", children);
                }
                resultArray.add(node);
            }
        }
        
        JsonObject node = new JsonObject();
		node.addProperty("name", "생산/기술/R&D/품질 외");
		node.addProperty("GB1_1", "193");
		node.addProperty("GB1_2", "30");
		node.addProperty("BB1_1", "193");
		node.addProperty("BB1_2", "30");
		node.addProperty("MBB1_1", "193");
		node.addProperty("MBB1_2", "30");
		node.addProperty("BB이상1_1", "193");
		node.addProperty("BB이상1_2", "30");
		node.addProperty("GB2_1", "193");
		node.addProperty("GB2_2", "30");
		node.addProperty("BB2_1", "193");
		node.addProperty("BB2_2", "30");
		node.addProperty("MBB2_1", "193");
		node.addProperty("MBB2_2", "30");
		node.addProperty("BB이상2_1", "193");
		node.addProperty("BB이상2_2", "30");
		node.addProperty("GB3_1", "193");
		node.addProperty("GB3_2", "30");
		node.addProperty("BB3_1", "193");
		node.addProperty("BB3_2", "30");
		node.addProperty("MBB3_1", "193");
		node.addProperty("MBB3_2", "30");
		node.addProperty("BB이상3_1", "193");
		node.addProperty("BB이상3_2", "30");
		node.addProperty("name5", "1");
		
		resultArray.add(node);
        
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
	
	
}
