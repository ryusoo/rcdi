package com.rcdi.action;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.rcdi.common.Constants;
import com.rcdi.dao.BoardDAO;
import com.rcdi.dto.BoardDTO;

import oracle.net.aso.e;

public class RegisterPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1)~3) 과정을 거쳐야만 완벽하게 저장
		
		// 파일업로드 1) 파일을 저장할 디렉토리 생성
		// 파일 업로드 처리(이 처리가 없는데 파일을 받게하면 에러가뜬다. 그래서 제일 상단에 위치한 이유이다.)
		File uploadDir = new File(Constants.UPLOAD_PATH);
		
		if(!uploadDir.exists()) { // 저장할 경로가 없다면(!false=true경로를탐)
			uploadDir.mkdir(); // 디렉토리(directory)를 생성(MaKe)하세요
		}
		
		// request를 확장시킨 MultipartRequest 생성
		// request는 모두 String타입
		// 파일 <- request로 전송 불가
		// 파일 <- request를 향상시킨 MultipartRequest를 사용
		// 그래서 파일뿐만 아니라 기존에 String타입도 전부 Multipart타입으로 변경해야함
		
		
		// 파일업로드 2) "D:\\upload"로 첨부파일 저장
		MultipartRequest multi = new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "UTF-8", new DefaultFileRenamePolicy());
		//  Constants.UPLOAD_PATH, 파일업로드 디렉토리
		// Constants.MAX_UPLOAD, 업로드 최대 용량
		// "UTF-8", 인코딩
		// new DefaultiFileRenamePolicy() 파일이름중복정책
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("register_box");
		String writer = multi.getParameter("writer");
		String filename =" "; // 한 칸 띄는게 중요하다 null이나 공백은 sql Query에서 문제가 생길 확률이 높다 그래서 아래서 잡아줌
		int filesize = 0;
		
		
		// 파일을 설정한 경로(D:\\upload)로 업로드하는 과정
		// 파일 IO이기 때문에 try-catch함
		
		// 파일업로드 3) DB에 저장할 첨부파일의 이름과 사이즈를 구함
		try {
			Enumeration files = multi.getFileNames();
			
			while(files.hasMoreElements()) { // files가 만약에 첨부파일이 3개(file1->true file2->true file3->true 그다음 false 반복문 나감)가 있으면 값이 있는지 없는지를 판단해줌 
				String file1 = (String)files.nextElement(); // 먼저 file1을 담음 
				filename = multi.getFilesystemName(file1); // 첨부파일이름을 가져와서 filename에 담음 : 첨부파일의 파일이름
				File f1 = multi.getFile(file1); // : 첨부파일의 파일
				
				if(f1 != null) {
					// filesize는 long타입으로 가져옴
					// int로 형변환
					filesize = (int)f1.length(); // 첨부파일의 파일 사이즈
				}
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 사용자가 첨부파일을 등록하지 않았을 때
		// 파일이름이 null이나 " "으로 들어가는 것을 방지
		if(filename == null || filename.trim().equals("")) {
			filename = "-";
		}
		
		
		
		BoardDTO bDto = new BoardDTO(title, content, writer, filename, filesize);
		System.out.println(bDto.toString());
		
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.boardRegister(bDto);
		int currval = bDao.boardLastBno();
		
		
		String url ="boardView.rcdi?bno="+currval;
		
		if(result > 0) {
			System.out.println("게시글 등록 성공");
		} else {
			System.out.println("게시글 등록 실패");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
