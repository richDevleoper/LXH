package kr.freedi.dev.common.interceptor;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

import kr.freedi.dev.common.domain.CommonVO;

@Intercepts({
	@Signature(type=Executor.class, method="query", args={MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class}),
	@Signature(type=Executor.class, method="update", args={MappedStatement.class, Object.class})
})
public class QueryInterceptor implements Interceptor {

	protected Log log = LogFactory.getLog(this.getClass());

	@Override
	@SuppressWarnings("unchecked")
	public Object intercept(Invocation invocation) throws Throwable {

		Object[] args = invocation.getArgs();
		MappedStatement ms = (MappedStatement)args[0];
		Object parameter = args[1];
		BoundSql boundSql = ms.getBoundSql(parameter);
		String sql = boundSql.getSql();

		if (parameter != null) {

			if (parameter instanceof String) {
				sql = StringUtils.replaceOnce(sql, "?", "'" + parameter + "'");
			} else if (parameter instanceof Integer) {
				sql = StringUtils.replaceOnce(sql, "?", ((Integer)parameter).toString());
			} else if (parameter instanceof Double) {
				sql = StringUtils.replaceOnce(sql, "?", ((Double)parameter).toString());
			} else if (parameter instanceof Map) {
				// Map 형태
				Map<String, Object> paramMap = (Map<String, Object>)parameter;

				for (ParameterMapping paramMapp : boundSql.getParameterMappings()) {
					sql = StringUtils.replaceOnce(sql, "?", "'" + paramMap.get(paramMapp.getProperty()) + "'");
				}

			} else if (parameter instanceof List) {
				// List 형태
				for (Object obj : (List<Object>)parameter) {
					if (obj instanceof Integer) {
						sql = StringUtils.replaceOnce(sql, "?", ((Integer)parameter).toString());
					} else if(obj instanceof Double) {
						sql = StringUtils.replaceOnce(sql, "?", ((Double)obj).toString());
					} else {
						sql = StringUtils.replaceOnce(sql, "?", "'" + parameter + "'");
					}
				}

			} else {
				// SearchVO
				Field[] fields = parameter.getClass().getDeclaredFields();
				Map<String, Object> objMap = new HashMap<String, Object>();

				for (int i = 0; i <= fields.length - 1; i++) {
					fields[i].setAccessible(true);
					objMap.put(fields[i].getName(), fields[i].get(parameter));
				}

				// SearchVO 일 경우 페이징 처리 클래스도 불러옴.
				if (parameter.getClass().getSuperclass() == CommonVO.class) {

					// PaginationInfo
					fields = parameter.getClass().getSuperclass().getSuperclass().getDeclaredFields();

					for (int i = 0; i < fields.length; i++) {
						fields[i].setAccessible(true);
						objMap.put(fields[i].getName(), fields[i].get(parameter));
					}

					// CommonVO
					fields = parameter.getClass().getSuperclass().getDeclaredFields();

					for (int i = 0; i < fields.length; i++) {
						fields[i].setAccessible(true);
						objMap.put(fields[i].getName(), fields[i].get(parameter));
					}
				}

				for (ParameterMapping paramMapp : boundSql.getParameterMappings()) {

					Object obj = objMap.get(paramMapp.getProperty());

					if (obj instanceof Integer) {
						sql = StringUtils.replaceOnce(sql, "?", ((Integer)obj).toString());
					} else if (obj instanceof Double) {
						sql = StringUtils.replaceOnce(sql, "?", ((Double)obj).toString());
					} else {
						sql = StringUtils.replaceOnce(sql, "?", "'" + obj + "'");
					}
				}
			}
		}

		if (log.isDebugEnabled()) {
			log.debug("\n# " + ms.getId() + "\n" + sql + "\n");
		}

		return invocation.proceed();
	}

	@Override
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties properties) {
	}
}
