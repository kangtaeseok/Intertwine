package org.edu.intertwine.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;


// 
@Component("filedown") // 설정 파일에 자동 등록 처리됨 (servlet-context.xml)
public class FileDownloadView extends AbstractView {
	// 파일 다운로드 처리용 뷰클래스임
	// 스프링에서는 뷰리졸버 의해 자동 연결 실행될 뷰클래스를 만들 때,
	// 스프링이 제공하는 AbStrantView를 상속받아서 만들도록 정해두었음.(반드시)
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 파일 다운로드 처리용 코드 작성함
		// 컨트롤러의 메소드에서 리턴해서 전송한 Model의 값(File 객체)을 추룰해서,
		// 저장된 폴더의 파일을 읽어서 요청한 클라이언트 부라우저로 파일을 출력 전송 처리함
		
		// 컨트롤러에서 뷰리졸버(BeanNameViewResolver)를 거쳐 전달된 model의 정보 추출
		File readFile = (File)model.get("renameFile");
		File downFile = (File)model.get("originFile");
		
		// 한글 파일명은 깨지지 않게 인코딩 처리를 위해서 파일명만 추출
		String fileName = downFile.getName();
		
		// 파일 다운을 위한 response 웹 설정 처리 (클라이언트로 전송하기 위한 설정임)
		response.setContentType("text/plain; charset=utf-8");
		// 한글 파일명은 다운되는 클라이언트 컴퓨터의 os 문자셋과 맞추기함
		response.addHeader("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("utf-8"), "ISO-8859-1") + "\"");
		response.setContentLength((int)readFile.length());
		
		// 파일 입출력에 대한 스트림 생성함
		FileInputStream fin = new FileInputStream(readFile);
		OutputStream out = response.getOutputStream();
		
		// 저장폴더에서 readFile을 read() 해서, response로 write() | print() 함
		// 스프링에서 제공함
		FileCopyUtils.copy(fin, out); // while루프 돌려서 알아서 처리함
		
		fin.close();
	}
		
}
