package kr.freedi.dev.qeducation.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.freedi.dev.article.domain.ArticleSearchVO;
import kr.freedi.dev.user.domain.UserVO;

@Controller
@RequestMapping({"/education"})
public class MyEducationController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@RequestMapping({"/mystatus.do"})
	public String MyStatus(HttpServletRequest request, ModelMap model,
		@ModelAttribute("articleSearchVO") ArticleSearchVO searchVO, 
		UserVO userSession)throws Exception {
		
		return "app/education/MyStatusList";
	}
}
