package com.rcdi.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcdi.action.ActionForward;
import com.rcdi.dao.ProductDAO;
import com.rcdi.dto.ProductDTO;

public class IndexAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "index.jsp";
		
		ProductDAO pDao = ProductDAO.getInstance();
		
		// best상품
		List<ProductDTO> bList = pDao.bestList();
	/*	for (ProductDTO productDTO : bList) {
			System.out.print(productDTO.getP_name()+", ");
			System.out.print(productDTO.getP_img()+", ");
			System.out.print(productDTO.getP_price());
			System.out.println();
		}*/
		// 신상품
		List<ProductDTO> aList = pDao.arrivalList();
		
		request.setAttribute("bestList", bList);
		request.setAttribute("arrivalList", aList);
		
		
		ActionForward forward = new ActionForward(); 
		forward.setPath(url); 
		forward.setRedirect(false);
		
		
		return forward;
	}
	
}
