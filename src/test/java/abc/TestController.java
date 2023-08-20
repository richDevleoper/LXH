package abc;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.freedi.dev.menu.domain.MenuVO;
import kr.freedi.dev.menu.service.MenuService;
 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
									"file:src/main/resources/kr/freedi/dev/spring/context-aspect.xml",
									"file:src/main/resources/kr/freedi/dev/spring/context-common.xml",
									"file:src/main/resources/kr/freedi/dev/spring/context-datasource.xml",
									"file:src/main/resources/kr/freedi/dev/spring/context-dwr.xml",
									"file:src/main/resources/kr/freedi/dev/spring/context-ehcache.xml",
									"file:src/main/resources/kr/freedi/dev/spring/context-excel.xml",
									"file:src/main/resources/kr/freedi/dev/spring/context-idgen.xml	",
									"file:src/main/resources/kr/freedi/dev/spring/context-jfile.xml",
									"file:src/main/resources/kr/freedi/dev/spring/context-job.xml",
									"file:src/main/resources/kr/freedi/dev/spring/context-mapper.xml",
									"file:src/main/resources/kr/freedi/dev/spring/context-properties.xml",
									"file:src/main/resources/kr/freedi/dev/spring/context-transaction.xml",
									"file:src/main/resources/kr/freedi/dev/spring/context-validator.xml",
							        "file:src/main/webapp/WEB-INF/config/springmvc/dispatcher-servlet.xml",
							        "file:src/main/webapp/WEB-INF/config/springmvc/urlfilename-servlet.xml"
							      })
public class TestController {
	//@Autowired
	//private ApplicationContext applicationContext;
 
	@Autowired
	private MenuService menuService;
	
	@Test
    public void test(){
		List<MenuVO> list = menuService.getTreeList("CSL");
		for(MenuVO vo : list){
			System.out.println(vo.toString());
		}
    }
}