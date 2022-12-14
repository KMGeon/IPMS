package com.ipms.proj.noticeboard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ipms.commons.ftp.vo.IntgAttachFileVO;
import com.ipms.commons.vo.Criteria;
import com.ipms.proj.issue.service.IssueService;
import com.ipms.proj.noticeboard.service.NoticeService;
import com.ipms.proj.noticeboard.vo.NoticeBoardVO;
import com.ipms.proj.noticeboard.vo.NoticePageVO;
import com.ipms.security.domain.CustomUser;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@RequestMapping("/proj")
@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	IssueService issueService;
	
	@Autowired 
	private ServletContext servletContext;
	
	// ???????????? ???????????? ????????? ??????(select) & ????????? ??????
	@GetMapping("/{projId}/noticeBoard")
	public String ntList(String keyword, String category, String pageNum, String amount, Model model, NoticeBoardVO noticeBoardVO, Authentication authentication, @PathVariable String projId) {
		
		Criteria criteria;
		
		log.info("pageNum: {}, amount: {}", pageNum, amount);
		
		if(pageNum == null && amount == null) {
			criteria = new Criteria();
			log.info("??? ????????? pageNum: {}", criteria.getPageNum());
		} else {
			if(pageNum.equals("0")) {
				pageNum = "1";
			}
			criteria = new Criteria(Integer.parseInt(pageNum), Integer.parseInt(amount));
			log.info("??? ?????? ????????? pageNum: {}", criteria.getPageNum());
			
		}
		
		if(category == null || category.equals("")) {
			criteria.setCategory("");
		} else {
			criteria.setCategory(category);
		}
		
		criteria.setKeyword("%"+keyword+"%");
		
		criteria.setProjId(projId);
		criteria.setAmount(10);
		List<NoticeBoardVO> ntSelect = noticeService.getNtPage(criteria);
		
		int total = noticeService.getTotal(projId); // ????????? ??? ??????! 
		
		NoticePageVO noticePageVO = new NoticePageVO(criteria, total);
		
		model.addAttribute("ntSelect", ntSelect);
		model.addAttribute("pageVO", noticePageVO);
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		
		//
		UserDetails userdetail = (UserDetails)authentication.getPrincipal();
		String userEmail = userdetail.getUsername();
		String userCode = this.issueService.getMemCode(userEmail);
		noticeBoardVO.setMemCode(userCode);
		
		String[] auth = noticeService.authCheck(noticeBoardVO);
		
		String authCheck = "";
		
		for (String string : auth) {
			if(string.equals("ROLE_PROJECT_LEADER")) {
				authCheck = "true";
			}else {
				authCheck ="false";
			}
		}
		
		log.info(" authCheck : {}",authCheck);
		
		model.addAttribute("authCheck",authCheck);
		//
		
		return "proj/noticeboard/noticeBoard";
	}
	
	
	@GetMapping("/{projId}/noticeBoardDetail")
	public String detailNt(@ModelAttribute NoticeBoardVO noticeBoardVO, Model model, Authentication authentication, @PathVariable String projId) {
		
		log.info("noticeBoardVO : " + noticeBoardVO.toString());
		
		NoticeBoardVO data = this.noticeService.detailNt(noticeBoardVO);
		log.info("notice detail -> noticeboardVO: " + data.toString());
		
		//
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		String memName = userDetails.getUsername();
		log.info("userName: " + memName); // ddit
		
		String memCode = this.issueService.getMemCode(memName);
		log.info("memCode: " + memCode); // M002
		
		// ????????? ??? ????????? ??? ????????? ?????? ??????????????? ??????/?????? ?????? ???????????? 
		NoticeBoardVO data2 = this.noticeService.detailNt2(noticeBoardVO);
		
		String memCheck = "";
		
		if(data2.getMemCode().equals(memCode)) {
			memCheck = "true";
		} else {
			memCheck = "false";
		}
		
		log.info("memCheck : {}", memCheck);
		
		model.addAttribute("memCheck", memCheck);
		//
		
//		noticeBoardVO.setMemCode(memCode);
		noticeBoardVO.setProjId(projId);
		
		model.addAttribute("data", data);
		
		return "proj/noticeboard/noticeBoardDetail";
	}

	@GetMapping("/{projId}/noticeUpdate")
	public String nUpdate(@ModelAttribute NoticeBoardVO noticeBoardVO, Model model, @PathVariable String projId) {
		
		NoticeBoardVO data = this.noticeService.detailNt(noticeBoardVO);
		
		model.addAttribute("data", data);
		
		return "proj/noticeboard/noticeUpdate";
	}
	
	@PostMapping("/{projId}/noticeBoardUpdatePost")
	public String updateNt(@ModelAttribute NoticeBoardVO noticeBoardVO, @PathVariable String projId) throws IllegalStateException, IOException {
		
		log.info("update notice: " + noticeBoardVO.toString());

		// ????????? ??? ?????? ??????
		String uploadFolder = servletContext.getRealPath("/") + "\\resources\\uploadNt";
		// ???/???/??? ?????? ??????
		String uploadFolderPath = getFolder();
		// ?????? ??????(??????)
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		// ????????? ????????? ????????? ????????? ??????
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		
//		MultipartFile[] uploadFile = noticeBoardVO.getItgrnAttachFileNum();
		
		List<IntgAttachFileVO> intgAttachFileVOList = new ArrayList<IntgAttachFileVO>();
		
		int cnt = 1;
		
		//INTG_ATTACH_FILE ???????????? MAX(INTG_ATTACH_FILE_NUM)+1 ?????? ??? ????????????
		int intgAttachFileNum = this.noticeService.getIntgAttachFileNum();
		log.info("intgAttachFileNum : " + intgAttachFileNum);
		
		MultipartFile[] mf = noticeBoardVO.getUploadFile();
		
		log.info("mf.length : " + mf.length + ", mf : " + mf);
		
		// ?????? ?????? ??????????????? ????????? ?????? ????????? ????????????
		for(MultipartFile multipartFile : mf) {
			// ?????? ?????????
			String uploadFileName = multipartFile.getOriginalFilename();
			// IE ??????. ????????? ????????? ?????? ?????? ??????
			// c:\\temp\\?????????.jpg => ?????????.jpg
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			// UUID ?????????
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			// ?????? ????????? ??????
			// uploadPath: static????????????????????????
			// uploadFileName: UUID_???????????????
			// ??????
			File saveFile = new File(uploadPath, uploadFileName);
			// ??????
			multipartFile.transferTo(saveFile);
			
			IntgAttachFileVO intgAttachFileVO = new IntgAttachFileVO();
			
			intgAttachFileVO.setIntgAttachFileNum(intgAttachFileNum+"");
			intgAttachFileVO.setAttachFileSeq(cnt++);
			intgAttachFileVO.setFilePath(uploadFolder);
			intgAttachFileVO.setFileName(multipartFile.getOriginalFilename());
			intgAttachFileVO.setFileSize((int)multipartFile.getSize());
			intgAttachFileVO.setFileSizeName(multipartFile.getContentType());
			intgAttachFileVO.setRgstId(noticeBoardVO.getMemCode());
			intgAttachFileVO.setFileType(Files.probeContentType(saveFile.toPath()));
			intgAttachFileVO.setSaveFileName(uploadFolderPath.replace("\\", "/") + "/" + uploadFileName); 
			
			//????????? ?????? ????????? ???????????? ??????
			if(intgAttachFileVO.getFileSize()>0) {
				intgAttachFileVOList.add(intgAttachFileVO);
			}
		}
		
		log.info("intgAttachFileVOList : " + intgAttachFileVOList);
		
		int resultFile = 0;
		
		//1-1) ??????????????? ?????? ??? ?????? ?????? -------------------------------------
		if(intgAttachFileVOList.size()>0) {
			resultFile = this.noticeService.insertFile(intgAttachFileVOList);
			log.info("resultFile : " + resultFile);
					
			noticeBoardVO.setItgrnAttachFileNum(intgAttachFileNum+"");
		//1-1) ??????????????? ?????? ??? ?????? ??? -------------------------------------
			
		}else {
		//1-2) ??????????????? ?????? ??? ?????? ?????? -------------------------------------			
			noticeBoardVO.setItgrnAttachFileNum(null);
		//1-2) ??????????????? ?????? ??? ?????? ??? -------------------------------------
		}
		
		int result = this.noticeService.updateNt(noticeBoardVO);
		log.info("result", result);
		
		return "redirect:/proj/{projId}/noticeBoardDetail?projNtNum="+noticeBoardVO.getProjNtNum();
	}
	
	@ResponseBody
	@PostMapping("/{projId}/noticeBoardDelete")
	public int deleteNt(@RequestBody NoticeBoardVO noticeBoardVO, @PathVariable String projId) {
		
		int result = this.noticeService.deleteNt(noticeBoardVO);
		log.info("result", result);
		
		return result;
		
	}
	
	@ResponseBody
	@PostMapping("/{projId}/deleteSelNt")
	public int ckDelNt(@RequestParam(value = "ckbox[]") List<String> ckArr, NoticeBoardVO noticeBoardVO, Authentication authentication, @PathVariable String projId) {
		
		log.info("?????? ?????? ---------------------");
		
		UserDetails userdetail = (UserDetails)authentication.getPrincipal();
		String userEmail = userdetail.getUsername();
		String userCode = this.issueService.getMemCode(userEmail);
		noticeBoardVO.setMemCode(userCode);
		
		int result = 0;
		int projNtNum = 0;
		
		for(String i : ckArr) {
			projNtNum = Integer.parseInt(i);
			noticeBoardVO.setProjNtNum(projNtNum);
			noticeService.ckDelNt(noticeBoardVO);
		}
		result = 1;
		
		return result;
	}
	
	
	@GetMapping("/{projId}/noticeInsert")
	public String nInsert(Model model, @PathVariable String projId) {
		
		return "proj/noticeboard/noticeInsert";
	}
	
	// ???????????? ?????? ?????? insert
//	@PostMapping("/noticeBoardInsertPost")
//	public String insertNt(@ModelAttribute NoticeBoardVO noticeBoardVO) {
//		
//		log.info("notice insert -> noticeBoardVO: " + noticeBoardVO.toString());
//		
//		int result = this.noticeService.insertNt(noticeBoardVO);
//		log.info("result: " + result);
//		
//		return "redirect:/proj/noticeBoardDetail?projNtNum="+noticeBoardVO.getProjNtNum();
//		
//	}
	
	// ???????????? ?????? insert
	@PostMapping("/{projId}/noticeBoardInsertPost")
	public String insertNt(@ModelAttribute NoticeBoardVO noticeBoardVO, @PathVariable String projId, HttpServletRequest req) throws IllegalStateException, IOException {
		
		log.info("NoticeController - insertNt -> ?????? ?????????  : {}", servletContext.getRealPath("/"));
		
		log.info("notice insert -> noticeBoardVO: " + noticeBoardVO.toString());
		
		// ????????? ??? ?????? ??????
		String uploadFolder = servletContext.getRealPath("/") + "\\resources\\uploadNt";
		
		log.info("????????? ????????? ??????  :  {}", req.getContextPath());
		
		// ???/???/??? ?????? ??????
		String uploadFolderPath = getFolder();
		// ?????? ??????(??????)
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		// ????????? ????????? ????????? ????????? ??????
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		
//		MultipartFile[] uploadFile = noticeBoardVO.getItgrnAttachFileNum();
		
		List<IntgAttachFileVO> intgAttachFileVOList = new ArrayList<IntgAttachFileVO>();
		
		int cnt = 1;
		
		//INTG_ATTACH_FILE ???????????? MAX(INTG_ATTACH_FILE_NUM)+1 ?????? ??? ????????????
		int intgAttachFileNum = this.noticeService.getIntgAttachFileNum();
		log.info("intgAttachFileNum : " + intgAttachFileNum);
		
		MultipartFile[] mf = noticeBoardVO.getUploadFile();
		
		log.info("mf.length : " + mf.length + ", mf : " + mf);
		
		// ?????? ?????? ??????????????? ????????? ?????? ????????? ????????????
		for(MultipartFile multipartFile : mf) {
			// ?????? ?????????
			String uploadFileName = multipartFile.getOriginalFilename();
			// IE ??????. ????????? ????????? ?????? ?????? ??????
			// c:\\temp\\?????????.jpg => ?????????.jpg
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			// UUID ?????????
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			// ?????? ????????? ??????
			// uploadPath: static????????????????????????
			// uploadFileName: UUID_???????????????
			// ??????
			File saveFile = new File(uploadPath, uploadFileName);
			// ??????
			multipartFile.transferTo(saveFile);
			
			IntgAttachFileVO intgAttachFileVO = new IntgAttachFileVO();
			
			intgAttachFileVO.setIntgAttachFileNum(intgAttachFileNum+"");
			intgAttachFileVO.setAttachFileSeq(cnt++);
			intgAttachFileVO.setFilePath(uploadFolder);
			intgAttachFileVO.setFileName(multipartFile.getOriginalFilename());
			intgAttachFileVO.setFileSize((int)multipartFile.getSize());
			intgAttachFileVO.setFileSizeName(multipartFile.getContentType());
			intgAttachFileVO.setRgstId(noticeBoardVO.getMemCode());
			intgAttachFileVO.setFileType(Files.probeContentType(saveFile.toPath()));
			intgAttachFileVO.setSaveFileName(uploadFolderPath.replace("\\", "/") + "/" + uploadFileName); 
			
			//????????? ?????? ????????? ???????????? ??????
			if(intgAttachFileVO.getFileSize()>0) {
				intgAttachFileVOList.add(intgAttachFileVO);
			}
		}
		
		log.info("intgAttachFileVOList : " + intgAttachFileVOList);
		
		int resultFile = 0;
		
		//1-1) ??????????????? ?????? ??? ?????? ?????? -------------------------------------
		if(intgAttachFileVOList.size()>0) {
			resultFile = this.noticeService.insertFile(intgAttachFileVOList);
			log.info("resultFile : " + resultFile);
					
			noticeBoardVO.setItgrnAttachFileNum(intgAttachFileNum+"");
		//1-1) ??????????????? ?????? ??? ?????? ??? -------------------------------------
			
		}else {
		//1-2) ??????????????? ?????? ??? ?????? ?????? -------------------------------------			
			noticeBoardVO.setItgrnAttachFileNum("");
		//1-2) ??????????????? ?????? ??? ?????? ??? -------------------------------------
		}
		
		
		int result = this.noticeService.insertNt(noticeBoardVO);
		log.info("result: " + result);
		
		return "redirect:/proj/{projId}/noticeBoardDetail?projNtNum="+noticeBoardVO.getProjNtNum();
	}
	
	//?????? ????????? ??????
	public String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		//str : 2022-08-03
		String str = sdf.format(date);
		//2022?????? > 08?????? > 03??????
		return str.replace("-", File.separator);
	}
	

//	@ResponseBody
//	@GetMapping("/download")
//	public ResponseEntity<Resource> download(@RequestParam String fileName) {
//		
//		log.info("fileName : " + fileName);
//		
//		//resource : ???????????? ?????? ??????(??????)
//		Resource resource = new FileSystemResource(
//				"C:\\eclipse-jee-2020-06-R-win32-x86_64\\workspace\\TspringProj\\src\\main\\webapp\\resources\\upload"
//				+fileName
//				);
//		
//		//cd862ebd-10a2-4220-bbbb-5bbf8ffdadd7_phone01.jpg
//		String resourceName = resource.getFilename();
//		
//		//header : ????????? ??????, ????????? ??????
//		HttpHeaders headers = new HttpHeaders();
//		
//		try {
//			headers.add("Content-Disposition", "attachment;filename="+
//					new String(resourceName.getBytes("UTF-8"),"ISO-8859-1"));
//		} catch (UnsupportedEncodingException e) {
//			log.info(e.getMessage());
//		}
//		
//		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
//	}
//	
	
}
