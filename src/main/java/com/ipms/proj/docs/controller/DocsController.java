package com.ipms.proj.docs.controller;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ipms.commons.ftp.FtpUtil;
import com.ipms.commons.vo.FtpVO;
import com.ipms.proj.docs.service.DocsService;
import com.ipms.proj.docs.vo.DocsVO;

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
	
	@GetMapping("/docs")
	public String view() {
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
	
	
	@ResponseBody
	@GetMapping("/docTest")
	public List<FtpVO> docsTests(@RequestParam String path) {
		
		List<FtpVO> docsList = null;
		docsList = FtpUtil.getList(path);
		
		return docsList;
	}
	
	@ResponseBody
	@PostMapping("/dirDocTest")
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
	
	@ResponseBody
	@PostMapping("/uploadFileTest")
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
}
