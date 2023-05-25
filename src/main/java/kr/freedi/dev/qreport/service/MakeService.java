package kr.freedi.dev.qreport.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.freedi.dev.common.dao.DefaultDAO;
import kr.freedi.dev.qpopup.domain.UserVO;
import kr.freedi.dev.qreport.domain.MakeSearchVO;
import kr.freedi.dev.qreport.domain.MakeVO;

@Service("makeService")
public class MakeService {
	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "defaultDAO")
	private DefaultDAO dao;
	
	@Resource(name = "reportIdGnrService")
	private EgovIdGnrService idGnrService;
	
	public List<EgovMap> selectEmpSearch(UserVO userVO) {
		return dao.selectList("Make.selectEmpSearch", userVO); 
	}
	
	public int selectListCount(MakeSearchVO searchVO) {
		return (Integer) dao.selectOne("Make.selectCirclListCount", searchVO);
	}
	
	public List<MakeVO> selectFullList(MakeSearchVO searchVO) {
		
		return dao.selectList("Make.selectCirclList", searchVO);
	}

	
	public void insert(MakeVO makeVO) throws Exception {
		int cirCode = idGnrService.getNextIntegerId();
		makeVO.setCirCode(Integer.toString(cirCode));
		
		int totCnt = 0;
		
		String anLeaderStr1 = makeVO.getLeader1();
		String anLeaderStr2 = makeVO.getLeader2();
		String anLeaderStr3 = makeVO.getLeader3();
		String anLeaderStr4 = makeVO.getLeader4();
		String anLeaderStr5 = makeVO.getLeader5();
		String anLeaderStr6 = makeVO.getLeader6();
		String anLeaderStr7 = makeVO.getLeader7();
		
		String[] anLeader1 = anLeaderStr1.split(",", -1);
		String[] anLeader2 = anLeaderStr2.split(",", -1);
		String[] anLeader3 = anLeaderStr3.split(",", -1);
		String[] anLeader4 = anLeaderStr4.split(",", -1);
		String[] anLeader5 = anLeaderStr5.split(",", -1);
		String[] anLeader6 = anLeaderStr6.split(",", -1);
		String[] anLeader7 = anLeaderStr7.split(",", -1);
		
		if(!anLeaderStr1.equals("")){
			for(int j=0; j<anLeader1.length; j++){
				int cirMemCode = idGnrService.getNextIntegerId();
				makeVO.setCirMemCode(Integer.toString(cirMemCode));
				
				makeVO.setComNo(anLeader1[j].trim());
				makeVO.setCirMemName(anLeader2[j].trim());
				makeVO.setCirDeptCode(anLeader3[j].trim());
				makeVO.setComJobxCode(anLeader4[j].trim());
				makeVO.setComPositionCode(anLeader5[j].trim());
				makeVO.setBeltCode(anLeader6[j].trim());
				makeVO.setCirLeaderdeptName(anLeader7[j].trim());
				makeVO.setCirMemRole("LEADER");
				
				System.out.println(anLeader1[j].trim());
				dao.insert("Make.insertCircleDtl", makeVO);
				totCnt = totCnt+1;
			}
		}
		
		String anTeamStr1 = makeVO.getTeam1();
		String anTeamStr2 = makeVO.getTeam2();
		String anTeamStr3 = makeVO.getTeam3();
		String anTeamStr4 = makeVO.getTeam4();
		String anTeamStr5 = makeVO.getTeam5();
		String anTeamStr6 = makeVO.getTeam6();
		String anTeamStr7 = makeVO.getTeam7();
		
		String[] anTeam1 = anTeamStr1.split(",", -1);
		String[] anTeam2 = anTeamStr2.split(",", -1);
		String[] anTeam3 = anTeamStr3.split(",", -1);
		String[] anTeam4 = anTeamStr4.split(",", -1);
		String[] anTeam5 = anTeamStr5.split(",", -1);
		String[] anTeam6 = anTeamStr6.split(",", -1);
		String[] anTeam7 = anTeamStr7.split(",", -1);
		
		if(!anTeamStr1.equals("")){
			for(int j=0; j<anTeam1.length; j++){
				int cirMemCode = idGnrService.getNextIntegerId();
				makeVO.setCirMemCode(Integer.toString(cirMemCode));
				
				makeVO.setComNo(anTeam1[j].trim());
				makeVO.setCirMemName(anTeam2[j].trim());
				makeVO.setCirDeptCode(anTeam3[j].trim());
				makeVO.setComJobxCode(anTeam4[j].trim());
				makeVO.setComPositionCode(anTeam5[j].trim());
				makeVO.setBeltCode(anTeam6[j].trim());
				makeVO.setCirMemRole("TEAM");
				
				System.out.println(anTeam1[j].trim());
				dao.insert("Make.insertCircleDtl", makeVO);
				totCnt = totCnt+1;
			}
		}
		
		System.out.println("totCnt : " + totCnt);
		makeVO.setCirMemCnt(Integer.toString(totCnt));
		makeVO.setCirLName(anLeaderStr2);
		
		dao.insert("Make.insertCircleMst", makeVO);
		
		
	}
	
	
	
}
