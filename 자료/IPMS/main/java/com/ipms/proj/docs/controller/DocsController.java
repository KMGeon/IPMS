package com.ipms.proj.docs.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ipms.commons.ftp.FtpUtil;
import com.ipms.commons.ftp.vo.FtpFilePathVO;
import com.ipms.commons.vo.FtpVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class DocsController {
	
//	@Autowired
//	private DocsService docsService;
	
	/**
	 * 문서함의 폴더 조회 
	 * @param projId : 추후 프로젝트 구성원 ID 받을 것
	 * @param model
	 * @return 문서함 최상위
	 */
//	@GetMapping("/docs")
//	public String docs(@ModelAttribute DocsVO docsVO, Model model) {
//		
//		docsVO.setProjId("5");
//		
//		List<DocsVO> docsList = docsService.selectDocs(docsVO);
//		
//		if( !docsList.isEmpty() && docsList != null ) {
//			log.info("DocsController - docs() : st -> {}", docsList.get(0).getFoldName());
//		}
//		
//		model.addAttribute("docsList", docsList);
//		
//		return "proj/docs/docsList";
//	}
	
	// view 조회
	@GetMapping("/{projId}/docs")
	public String view(@PathVariable String projId, Model model) {
		
		model.addAttribute("projId", projId);
		
		return "proj/docs/docsList";
	}
	
	/**
	 * 문서함 폴더 생성
	 * @param foldName : 추후 VO로 받을 것
	 * @return 문서함 최상위로 리턴 추후, 폴더를 생성한 폴더로 바꿔주기
	 */
//	@PostMapping("/docsMkdir")
//	public String insertFolder(@ModelAttribute DocsVO docsVO) {
//		
//		if( docsVO != null ) {
//			log.info("DocsController - insertFolder() : docsVO.getFoldName() -> {}", docsVO.getFoldName());
//		}
//		
//		int result = docsService.insertFolder(docsVO);
//		
//		if(result > 0) {
//			log.info("DocsController - insertFolder() : 폴더 생성 완료");
//		}else {
//			log.info("DocsController - insertFolder() : 폴더 생성 실패!!!");
//		}
//		
//		return "redirect:/proj/docs";
//		
//	}
	
	// 트리와 view 조회
	@ResponseBody
	@GetMapping("/{projId}/docsSelect")
	public List<FtpVO> docsTests(@RequestParam String path) {
		
		List<FtpVO> docsList = null;
		docsList = FtpUtil.getList(path);
		
		return docsList;
	}
	
	// 폴더 생성
	@ResponseBody
	@PostMapping("/{projId}/dirDoc")
	public boolean makeDirTests(String path, String dirName) {
		
		String nowPath = "";
		
		if(StringUtils.isNotBlank(path)) {
			nowPath += "/" + path;
		}
		
		boolean check = FtpUtil.isDirectoryExist(nowPath, dirName);
		boolean result = false;
		// 같은 이름의 폴더가 없다면
		if(!check) {
			// 폴더를 생성합니다.
			result = FtpUtil.createDirectory(nowPath, dirName);
		}
		
		// 성공적으로 마치면 true 반환
		return result;
	}
	
	// 다중 파일 업로드
	@ResponseBody
	@PostMapping("/{projId}/uploadFile")
	public boolean uploadFile(MultipartFile[] docsFile, String path) {
		
		String savePath = "";
		
		if(StringUtils.isNotBlank(path) || docsFile.length > 0 || docsFile != null) {
			log.info("DocsTestController - uploadFile -> path : {}", path);
			log.info("DocsTestController - uploadFile -> docsFile.length : {}", docsFile.length);
			savePath += path;
		}
		
		
		for(int i=0; i < docsFile.length; i++) {
			FtpUtil.uploadToFtp(savePath, docsFile[i].getOriginalFilename(), docsFile[i]);
		}
		
		return true;
	}
	
	// 다중 파일 다운로드
	@PostMapping("/{projId}/fileDownload")
	public void downloadFile(@RequestBody FtpFilePathVO ftpFilePath, HttpServletResponse resp) {
		
		String savePath = "";
		String fileName = "";
		
		if(ftpFilePath != null) {
			savePath = ftpFilePath.getPath(); 
			fileName = ftpFilePath.getFileName();
			log.info("DocsTestController - downloadFile : svaePath -> {}", savePath);
			log.info("DocsTestController - downloadFile : fileName -> {}", fileName);
		}
		
		byte[] file = null;
		file = FtpUtil.getFileByte(savePath, fileName);
		
		resp.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
		resp.setContentLength(file.length);
		resp.setHeader("Content-Disposition", "attatchment;filename=\"" + fileName + "\"");
		
		log.info("DocsTestController - downloadFile : 헤더 설정 통과");
		
		try (
				OutputStream os = resp.getOutputStream();
				InputStream is = new ByteArrayInputStream(file);	
		){
			byte[] buffer = new byte[1024];
			int length = -1;
			
			while( (length = is.read(buffer, 0, buffer.length)) != -1 ) {
				os.write(buffer, 0, length);
			}
		} catch (IOException e) {
			throw new RuntimeException("stream error : " + e.getMessage());
		}
			
	}
		
	// 삭제
	@ResponseBody
	@PostMapping("/{projId}/removeFile")
	public boolean removeFiles(@RequestParam("path") String path, @RequestParam("fileName[]") String[] fileName) {
		
		String savePath = "";
		
		if(StringUtils.isNotBlank(path)) {
			savePath += path;
			
			log.info("DocsTestController - removeFiles -> path : {}", path);
			log.info("DocsTestController - removeFiles -> savePath : {}", savePath);
		}
		
		boolean result = true;
		
		for(String name : fileName) {
			log.info("DocsTestController - removeFiles -> name : {}", name);
			result = FtpUtil.removeFiles(savePath, name);
			
			if(!result) {
				break;
			}
		}
		
		return result;
	}
}
