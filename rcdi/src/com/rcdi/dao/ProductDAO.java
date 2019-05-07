package com.rcdi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.rcdi.dao.ProductDAO;
import com.rcdi.dto.ProductDTO;
import com.rcdi.mybatis.SqlMapConfig;

public class ProductDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession(); // SqlMapConfig 에 있는 getSqlSession()를 호출함
	SqlSession sqlSession;

	private ProductDAO(){}

	private static ProductDAO instance = new ProductDAO();

	public static ProductDAO getInstance() {
		return instance;
	}

	int result = 0;
	
	
	public List<ProductDTO> bestList(){
		List<ProductDTO> list = null;
		
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			list = sqlSession.selectList("bestList");
			
			// 여기는 안써도 되는데 잘되는지 안되는지 어디서 안되는지를 잘 모르니까... 
			// for each가 안쓰면 DB에서 못가져왔다.
			/*
			 * for (ProductDTO productDTO : list) {
			 * 
			 * }
			 */
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		
		return list;
	}
	
	public List<ProductDTO> arrivalList(){
		List<ProductDTO> list = null;
		
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			list = sqlSession.selectList("arrivalList");
			
			// 여기는 안써도 되는데 잘되는지 안되는지 어디서 안되는지를 잘 모르니까... 
			// for each가 안쓰면 DB에서 못가져왔다.
			/*
			 * for (ProductDTO productDTO : list) {
			 * 
			 * }
			 */
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		
		return list;
	}
	
	
}






