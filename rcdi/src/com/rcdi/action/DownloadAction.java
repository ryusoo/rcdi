package com.rcdi.action;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcdi.common.Constants;

public class DownloadAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String filename = request.getParameter("file"); // 쿼리스트링으로 file변수로 받았다
		System.out.println("filename>>>"+filename);
		
		//파일 다운로드 과정
		String path = Constants.UPLOAD_PATH + filename;
		// D:\\upload==1.png
		// 4096/4096/4096/2000 나누어져서 보내진다.
		
		// byte단위로 쪼개서 가져오는 과정을 많이 사용한다
		byte[] b = new byte[4096]; // 바이트 배열 생성
		
		// 서버에 저장된 파일을 읽기 위한 스트림 생성
		// D드라이브 upload로 가서 파일이름에 맞는 것을 읽어온다 byte단위로 읽어오면 자바가 보내준다
		FileInputStream fis = new FileInputStream(path);
		
		// 파일의 종류 (mimeType) : 통합 확장자라서 웬만한 확장자는 다 읽어준다
		String mimeType = request.getServletContext().getMimeType(path);
		if(mimeType == null) {
			mimeType = "application/octet-stream; charset=utf-8";
		}
		
		// input스트림으로 읽어오면 output스트림으로 사용자 컴퓨터로 보낸다
		
		// 파일 이름에 한글이 포함된 경우
		// new String(바이트배열, 변환할 인코딩) 8859_1 서유럽언어
		// header에 특수문자 사용 못함, 서유럽언어로 변환
		 filename = new String(filename.getBytes("utf-8"), "8859_1");
		 
		 // http header
		 // 파일이름을 보내서 헤더에 파일이름 셋팅
		 response.setHeader("content-Disposition", "attachment;filename="+filename);
		 
		 // http body
		 // OutputStream 생성(서버에서 클라이언트에 쓰기)
		 // 바디에 내용을 셋팅
		 ServletOutputStream out = response.getOutputStream(); // out 쪼개서 보낼 블럭의 크기
		 
		 // 파일용량이 큰 경우 한 번에 못 보내고 쪼개서 보내야 함
		 
		 // 실질적으로 파일을 다운로드 해주는 코드
		 // 파일이 35, 000 byte => 한번에 다운로드 불가능
		  int numRead;
		  while(true) {
			  // 4096 byte로 쪼개서 파일 읽어오기
			  numRead = fis.read(b, 0, b.length); // FileinputStream=fis 
			  if(numRead == -1) break; // 4096씩 보내줬는데 2000이 남으면 꽉차지않아서 -1을 반환한다.
			  out.write(b, 0, numRead);  // server->client 전송(response할 때 쓰는 것)
		  }
		  
		  // 파일 처리 관련 리소스 정리
		  fis.close(); // 파일시스템 썼으니 반납
		  out.flush(); // 마지막에 4096보다 작은  2000을 작은사이즈 남아있는 것을 받아주는 코드
		  out.close(); // 파일시스템 썼으니 반납
		
		
		return null;
	}

}
