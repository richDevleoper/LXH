package kr.freedi.dev.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.directwebremoting.WebContextFactory;

import kr.freedi.dev.user.domain.UserVO;

public class CommonDWR {

	/**
	 * <pre>
	 *  설명 : HttpServletRequest 정보를 가져온다.
	 * </pre>
	 * @return
	 */
	public HttpServletRequest getHttpServletRequest() {
		
		HttpServletRequest request = WebContextFactory.get().getHttpServletRequest();		
		return request;
	}
	
	/**
	 * <pre>
	 *  설명 : USER의 SESSION 정보를 가져온다.
	 * </pre>
	 * @return
	 */
	public UserVO getUserSession() {
		
		HttpServletRequest request = WebContextFactory.get().getHttpServletRequest();
		UserVO userSession = (UserVO) request.getSession().getAttribute("userSession");
		
		return userSession;
	}
	
	/**
	 * 
	 * 설명 : Multi String Data를 List<HashMap> 데이터로 변환한다.
	 * @Method Name : convertTojqGridData
	 * @param data
	 * @return
	 * @throws Exception
	 */
	/*
	@SuppressWarnings({ "deprecation", "unchecked" })
	protected List<HashMap<String, Object>> convertTojqGridMultiData(String data) throws Exception{
		JSONArray jsonArr = new JSONArray();
		jsonArr.element(data);
		List<HashMap<String, Object>> list = (List<HashMap<String, Object>>)JSONArray.toList(jsonArr, HashMap.class).get(0);
		return list;
	}
	*/
}