package com.rcdi.mybatis;

import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		String resource ="com/rcdi/mybatis/Configuration.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource); //resource를 읽어온다. 그리고 reader에 담는다
			if(sqlSessionFactory == null) {
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader); // mybatis 정보 총괄형태로 공장을 만들어주고 그 노동자는 그 정보를 알 고 있다. 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
}
