package kr.freedi.dev.qreport.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
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
import kr.freedi.dev.qreport.domain.ReportDetailVO;
import kr.freedi.dev.qreport.domain.ReportSearchVO;
import kr.freedi.dev.qreport.domain.ReportTeamVO;
import kr.freedi.dev.qreport.domain.ReportVO;

@Service("makeService")
public class MakeService {
	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	@Resource(name = "circleIdGnrService")
	private EgovIdGnrService circleIdGnrService;
	
	@Resource(name = "circleDtlIdGnrService")
	private EgovIdGnrService circleDtlIdGnrService;
	
	@Resource(name = "kpiUserIdGnrService")
	private EgovIdGnrService kpiUserIdGnrService;
	
	@Resource(name = "reportTeamService")
	private ReportTeamService reportTeamService;
	
	public List<EgovMap> selectEmpSearch(UserVO userVO) {
		return dao.selectList("Make.selectEmpSearch", userVO); 
	}
	
	public int selectListCount(MakeSearchVO searchVO) {
		return (Integer) dao.selectOne("Make.selectCirclListCount", searchVO);
	}
	
	public List<MakeVO> selectFullList(MakeSearchVO searchVO) {
		
		return dao.selectList("Make.selectCirclList", searchVO);
	}
	
	public List<ReportTeamVO> selectMemberList(ReportTeamVO teamVO) {
		
		return dao.selectList("Make.ReportTeamVO", teamVO);
	}
	
	public MakeVO select(MakeVO makeVO) {
		
		makeVO = (MakeVO)dao.selectOne("Make.select", makeVO);
		
		ReportTeamVO reportTeamVO = new ReportTeamVO();
		reportTeamVO.setCirCode(makeVO.getCirCode());
		makeVO.setTeamMemList(reportTeamService.selectCircleFullList(reportTeamVO));
		
		return makeVO;
	}

	
	public void insert(MakeVO makeVO) throws Exception {
		
		int cirCode = circleIdGnrService.getNextIntegerId();
		makeVO.setCirCode(Integer.toString(cirCode));
		
		makeVO = this.memberSave(makeVO);		// member 정보 가공해서 저장하기. 이후 마스터 저장하기(인원수 처리때문)
		
		dao.insert("Make.insertCircleMst", makeVO);
	}
	
	public void update(MakeVO makeVO) throws Exception {

		makeVO = this.memberSave(makeVO);		// member 정보 가공해서 저장하기. 이후 마스터 저장하기(인원수 처리때문)
		
		dao.insert("Make.updateCircleMst", makeVO);
	}
		
	public MakeVO memberSave(MakeVO makeVO) throws FdlException {
		
		int totCnt = 0;
		
		String anLeaderStr1 = makeVO.getLeader1();
		String anLeaderStr2 = makeVO.getLeader2();
		String anLeaderStr3 = makeVO.getLeader3();
		String anLeaderStr4 = makeVO.getLeader4();
		String anLeaderStr5 = makeVO.getLeader5();
		String anLeaderStr6 = makeVO.getLeader6();
		String anLeaderStr7 = makeVO.getLeader7();
		String anLeaderStr8 = makeVO.getLeader8();
		
		String[] anLeader1 = anLeaderStr1.split(",", -1);
		String[] anLeader2 = anLeaderStr2.split(",", -1);
		String[] anLeader3 = anLeaderStr3.split(",", -1);
		String[] anLeader4 = anLeaderStr4.split(",", -1);
		String[] anLeader5 = anLeaderStr5.split(",", -1);
		String[] anLeader6 = anLeaderStr6.split(",", -1);
		String[] anLeader7 = anLeaderStr7.split(",", -1);
		String[] anLeader8 = anLeaderStr8.split(",", -1);
		
		if(!anLeaderStr1.equals("")){
			for(int j=0; j<anLeader1.length; j++){
				
				//cirMemCode가 있으면 update, 없으면 신규 추가
				String cirMemCode = "";
				
				if(anLeader8[j].trim().length()>0) {
					cirMemCode = anLeader8[j].trim();  // 코드 있음. 기존 추가됐던 멤버
				} else {
					cirMemCode = Integer.toString(circleDtlIdGnrService.getNextIntegerId());	// 신규 추가 멤버
				} 
				makeVO.setCirMemCode(cirMemCode);
				makeVO.setComNo(anLeader1[j].trim());
				makeVO.setCirMemName(anLeader2[j].trim());
				makeVO.setCirDeptCode(anLeader3[j].trim());
				makeVO.setComJobxCode(anLeader4[j].trim());
				makeVO.setComPositionCode(anLeader5[j].trim());
				makeVO.setBeltCode(anLeader6[j].trim());
				makeVO.setCirLeaderdeptName(anLeader7[j].trim());
				makeVO.setCirMemRole("LEADER");
				
				
				if(anLeader8[j].trim().length()>0) {
					dao.update("Make.updateCircleDtl", makeVO);						
				} else {
					
					MakeVO deleteParam = new MakeVO();
					deleteParam.setComNo(anLeader1[j].trim());
					dao.delete("Make.deleteCircleDtl", deleteParam);
					dao.insert("Make.insertCircleDtl", makeVO);
				}
				
				totCnt++;
			}
		}
		
		String anTeamStr1 = makeVO.getTeam1();
		String anTeamStr2 = makeVO.getTeam2();
		String anTeamStr3 = makeVO.getTeam3();
		String anTeamStr4 = makeVO.getTeam4();
		String anTeamStr5 = makeVO.getTeam5();
		String anTeamStr6 = makeVO.getTeam6();
		String anTeamStr7 = makeVO.getTeam7();
		String anTeamStr8 = makeVO.getTeam8();
		
		String[] anTeam1 = anTeamStr1.split(",", -1);
		String[] anTeam2 = anTeamStr2.split(",", -1);
		String[] anTeam3 = anTeamStr3.split(",", -1);
		String[] anTeam4 = anTeamStr4.split(",", -1);
		String[] anTeam5 = anTeamStr5.split(",", -1);
		String[] anTeam6 = anTeamStr6.split(",", -1);
		String[] anTeam7 = anTeamStr7.split(",", -1);
		String[] anTeam8 = anTeamStr8.split(",", -1);
		
		if(!anTeamStr1.equals("")){
			for(int j=0; j<anTeam1.length; j++){
				
				String cirMemCode = "";
				if(anTeam8[j].trim().length()>0) {
					cirMemCode = anTeam8[j].trim();  // 코드 있음. 기존 추가됐던 멤버
				} else {
					cirMemCode = Integer.toString(circleDtlIdGnrService.getNextIntegerId());	// 신규 추가 멤버
				} 
				makeVO.setCirMemCode(cirMemCode);
				
				makeVO.setComNo(anTeam1[j].trim());
				makeVO.setCirMemName(anTeam2[j].trim());
				makeVO.setCirDeptCode(anTeam3[j].trim());
				makeVO.setComJobxCode(anTeam4[j].trim());
				makeVO.setComPositionCode(anTeam5[j].trim());
				makeVO.setBeltCode(anTeam6[j].trim());
				makeVO.setCirMemRole("TEAM");
				
				if(anTeam8[j].trim().length()>0) {
					dao.update("Make.updateCircleDtl", makeVO);	
				} else {
					MakeVO deleteParam = new MakeVO();
					deleteParam.setComNo(anTeam1[j].trim());
					dao.delete("Make.deleteCircleDtl", deleteParam);
					dao.insert("Make.insertCircleDtl", makeVO);
				}				
				totCnt++;
			}
		}
		
		String strRemoveMemberIds = makeVO.getRemoveMemberIds();
		
		if(strRemoveMemberIds.length()>0) {
			String[] removeMemberIds = strRemoveMemberIds.split(",", -1);
			for(int j=0; j<removeMemberIds.length; j++){
				
				MakeVO paramVO = new MakeVO();
				paramVO.setCirMemCode(removeMemberIds[j]);
				dao.delete("Make.deleteCircleDtl", paramVO);
				totCnt--;
			}
		}
		
		makeVO.setCirMemCnt(Integer.toString(totCnt));
		makeVO.setCirLName(anLeaderStr2);		
		return makeVO;
	}
	
	
	public void saveKpi(MakeVO makeVO) throws Exception {
		
		//int cirCode = idGnrService.getNextIntegerId();
		//makeVO.setCirCode(Integer.toString(cirCode));
		
		this.memberKpiSave(makeVO);		// member 정보 가공해서 저장하기. 이후 마스터 저장하기(인원수 처리때문)
		
		//dao.insert("Make.insertKpiMst", makeVO);
	}
	
	public MakeVO memberKpiSave(MakeVO makeVO) throws FdlException {
		
		int totCnt = 0;
		
		String anLeaderStr1 = makeVO.getLeader1();
		String anLeaderStr2 = makeVO.getLeader2();
		String anLeaderStr3 = makeVO.getLeader3();  // deptcode
		String anLeaderStr4 = makeVO.getLeader4();
		String anLeaderStr5 = makeVO.getLeader5();
		String anLeaderStr6 = makeVO.getLeader6();
		String anLeaderStr7 = makeVO.getLeader7();	// deptname
		String anLeaderStr8 = makeVO.getLeader8();
		
		String[] anLeader1 = anLeaderStr1.split(",", -1);
		String[] anLeader2 = anLeaderStr2.split(",", -1);
		String[] anLeader3 = anLeaderStr3.split(",", -1);
		String[] anLeader4 = anLeaderStr4.split(",", -1);
		String[] anLeader5 = anLeaderStr5.split(",", -1);
		String[] anLeader6 = anLeaderStr6.split(",", -1);
		String[] anLeader7 = anLeaderStr7.split(",", -1);
		String[] anLeader8 = anLeaderStr8.split(",", -1);
		
		if(!anLeaderStr1.equals("")){
			for(int j=0; j<anLeader1.length; j++){
				
				//cirMemCode가 있으면 update, 없으면 신규 추가
				String cirMemCode = "";
				
				if(anLeader8[j].trim().length()>0) {
					cirMemCode = anLeader8[j].trim();  // 코드 있음. 기존 추가됐던 멤버
				} else {
					cirMemCode = Integer.toString(kpiUserIdGnrService.getNextIntegerId());	// 신규 추가 멤버
				} 
				makeVO.setCirMemCode(cirMemCode);
				makeVO.setComNo(anLeader1[j].trim());
				makeVO.setCirMemName(anLeader2[j].trim());
				makeVO.setCirDeptCode(anLeader3[j].trim());
				makeVO.setComJobxCode(anLeader4[j].trim());
				makeVO.setComPositionCode(anLeader5[j].trim());
				makeVO.setBeltCode(anLeader6[j].trim());
				makeVO.setCirDeptName(anLeader7[j].trim());
				
				//makeVO.setCirMemRole("LEADER");
				
				
				makeVO.setKudChkTypeCode("KUD001"); // 품질인재
				
				if(anLeader8[j].trim().length()>0) {
					dao.update("KPI.updateDtl", makeVO);	
				} else {
					dao.insert("KPI.insertDtl", makeVO);
				}
				
				totCnt++;
			}
		}
		
		String anTeamStr1 = makeVO.getTeam1();
		String anTeamStr2 = makeVO.getTeam2();
		String anTeamStr3 = makeVO.getTeam3();
		String anTeamStr4 = makeVO.getTeam4();
		String anTeamStr5 = makeVO.getTeam5();
		String anTeamStr6 = makeVO.getTeam6();
//		String anTeamStr7 = makeVO.getTeam7();
		String anTeamStr8 = makeVO.getTeam8();
		
		String[] anTeam1 = anTeamStr1.split(",", -1);
		String[] anTeam2 = anTeamStr2.split(",", -1);
		String[] anTeam3 = anTeamStr3.split(",", -1);
		String[] anTeam4 = anTeamStr4.split(",", -1);
		String[] anTeam5 = anTeamStr5.split(",", -1);
		String[] anTeam6 = anTeamStr6.split(",", -1);
//		String[] anTeam7 = anTeamStr7.split(",", -1);
		String[] anTeam8 = anTeamStr8.split(",", -1);
		
		if(!anTeamStr1.equals("")){
			for(int j=0; j<anTeam1.length; j++){
				
				String cirMemCode = "";
				if(anTeam8[j].trim().length()>0) {
					cirMemCode = anTeam8[j].trim();  // 코드 있음. 기존 추가됐던 멤버
				} else {
					cirMemCode = Integer.toString(kpiUserIdGnrService.getNextIntegerId());	// 신규 추가 멤버
				} 
				makeVO.setCirMemCode(cirMemCode);
				
				makeVO.setComNo(anTeam1[j].trim());
				makeVO.setCirMemName(anTeam2[j].trim());
				makeVO.setCirDeptCode(anTeam3[j].trim());
				makeVO.setComJobxCode(anTeam4[j].trim());
				makeVO.setComPositionCode(anTeam5[j].trim());
				makeVO.setBeltCode(anTeam6[j].trim());
				//makeVO.setCirMemRole("TEAM");
				
				makeVO.setKudChkTypeCode("KUD002"); // 품질인재
				
				if(anTeam8[j].trim().length()>0) {
					dao.update("KPI.updateDtl", makeVO);	
				} else {
					dao.insert("KPI.insertDtl", makeVO);
				}
				totCnt++;
			}
		}
		
		String strRemoveMemberIds = makeVO.getRemoveMemberIds();
		
		if(strRemoveMemberIds.length()>0) {
			String[] removeMemberIds = strRemoveMemberIds.split(",", -1);
			for(int j=0; j<removeMemberIds.length; j++){
				
				MakeVO paramVO = new MakeVO();
				paramVO.setCirMemCode(removeMemberIds[j]);
				dao.delete("KPI.deleteUserDtl", paramVO);
				totCnt--;
			}
		}
		
		makeVO.setCirMemCnt(Integer.toString(totCnt));
		makeVO.setCirLName(anLeaderStr2);		
		return makeVO;
	}
	
	
	
	public JsonArray convertTreeJson(List<DepartVO> list) {
        
        return buildTree(list, "50000000");
	}
	
	public JsonArray buildTree(List<DepartVO> list, String parentId) {
        JsonArray resultArray = new JsonArray();

        for (int i = 0; i < list.size(); i++) {
        	DepartVO dept = list.get(i);
            String id = dept.getDeptCode();
            String name = dept.getDeptName();
            String parent = dept.getDeptUperCode();

            if ((parentId == null && parent == null) || (parentId != null && parentId.equals(parent))) {
                JsonObject node = new JsonObject();
                node.addProperty("id", id);
                node.addProperty("text", name);
                if(id.equals("50000000")) {
                	JsonObject stateNode = new JsonObject();
                	stateNode.addProperty("opened", true);
                	node.add("state", stateNode);
                }
                JsonArray children = buildTree(list, id);
                if (children.size() > 0) {
                    node.add("children", children);
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
	
	public List<HashMap<String,Object>> selectKpiFullListExcel(KpiSearchVO searchVO) {
		
		return dao.selectList("KPI.selectFullListExcel", searchVO);
	}
	
	public int selectKpiListCount(KpiSearchVO searchVO) {
		return (Integer) dao.selectOne("KPI.selectCirclListCount", searchVO);
	}
	
	
}
