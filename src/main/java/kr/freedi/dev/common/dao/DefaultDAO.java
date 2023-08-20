package kr.freedi.dev.common.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * @project : dev_default
 * @file 	: DefaultDAO.java
 * @date	: 2017. 6. 21.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */
@Repository("defaultDAO")
public class DefaultDAO extends EgovAbstractMapper {

	//@Resource(name = "defaultSqlSession")
	public void setSqlSessionFactory(SqlSessionFactory sqlSession) {
    	super.setSqlSessionFactory(sqlSession);
    }
	
	@Deprecated
	public List<Object> list(String queryId, Object parameterObject) {
		return super.selectList(queryId, parameterObject);
	}

	@Deprecated
	public Object selectByPk(String queryId, Object parameterObject) {
		return super.selectOne(queryId, parameterObject);
	}
}
