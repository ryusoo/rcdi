package com.rcdi.action;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.rcdi.common.Constants;
import com.rcdi.dao.BoardDAO;
import com.rcdi.dto.BoardDTO;

public class ModifyPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 파일 업로드, 저장 디렉토리 생성
		File uploadDir = new File(Constants.UPLOAD_PATH);
		
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		
		// 새로 첨부파일이 있을 때 동작한다. 새로운 첨부파일을 무조건 여기서 등록한다.
		// 기존파일이 있든 없든 새로운 파일을 저장
		// D:\\upload\\에 2개의 파일이 들어간 상태(기존+새로운것)
		// ex) 만약에 기존파일이 aaa.txt가 있고 새로 등록하는 첨부파일이 bbb.txt가 있다면
		//     현재 upload 디렉토리에는 aaa.txt 와 bbb.txt 가 있음
		MultipartRequest multi = new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "UTF-8", new DefaultFileRenamePolicy());
		
		
		
		int bno =Integer.parseInt(multi.getParameter("bno"));
		String title = multi.getParameter("title");
		String content = multi.getParameter("register_box");
		String writer = multi.getParameter("writer");
		String bFileName = multi.getParameter("basic_filename");
		int bFileSize = Integer.parseInt(multi.getParameter("basic_filesize"));
		String bCheck = multi.getParameter("basic_check");
		String filename =" "; // 한 칸 띄는게 중요하다 null이나 공백은 sql Query에서 문제가 생길 확률이 높다 그래서 아래서 잡아줌
		int filesize = 0;
			
		// 파일업로드, DB에 저장할 첨부파일의 이름과 사이즈를 구함
		// 새로등록한 첨부파일이 있다면 새로등록한 첨부파일의 filename과 filesize를 구함
		// 새로 등록한 첨부파일이 없다면 while()을 타지 않아 filename=" "(null)이고 filesize=0으로 고정
		try {
			Enumeration files = multi.getFileNames(); // 파일 불러옴
			
			while(files.hasMoreElements()) { // 
				String file1 = (String) files.nextElement();
				filename =multi.getFilesystemName(file1);
				File f1 = multi.getFile(file1);
				
				if(f1 != null) {
					filesize = (int) f1.length();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();			
		}
		
		
		if(filename == null || filename.trim().equals("")) {
			// 새로등록한 첨부파일 없는 경우
			filename = "-";
			if(bCheck.equals("no")) { // 기존파일이 있는 경우(있으니까 삭제하겠다는 경우)
				File file = new File(Constants.UPLOAD_PATH + bFileName); // 경로 Constants.UPLOAD_PATH + bFileName(기존첨부파일이름)
				file.delete();
			} else { // 현상태 유지하는 경우( 위에서 null, 0으로 초기화했기 때문에 다시 유지하기위해 다시 기존정보 넣어줘야함)
				     // 위에서 기존첨부파일 값을 초기화 했기 때문에
					 // 다시 입력
				filename = bFileName;
				filesize = bFileSize;
			}
		} else {
			// 새로등록한 첨부파일 있는 경우
			// 기존파일 있는지 체크
			if(bFileSize > 0) { // 기존파일 있음
				File file = new File(Constants.UPLOAD_PATH + bFileName);
				file.delete();
			}
			// 기존파일 삭제했으니까 DB에 등록하면 된다 = 교체
			
		}
		
		BoardDTO bDto = new BoardDTO(bno, title, content, writer, filename, filesize);
		System.out.println(bDto.toString());
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.modify(bDto);
		
		String url = "boardView.rcdi?bno="+bno;
		
		
		
		
		
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
