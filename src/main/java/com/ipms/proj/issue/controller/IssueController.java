package com.ipms.proj.issue.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ipms.commons.ftp.vo.IntgAttachFileVO;
import com.ipms.commons.vo.Criteria;
import com.ipms.commons.vo.PageVO;
import com.ipms.proj.issue.service.IssueService;
import com.ipms.proj.issue.vo.IssueVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/proj")
public class IssueController {
	
	@Autowired
	IssueService issueservice;

	@GetMapping("/{projId}/issueboard")
	public ModelAndView issueboard(ModelAndView mav , String pageNum , String amount , @PathVariable String projId) {
		
//		List<IssueVO> vo = this.issueservice.IssueListSelect();
//		log.info("vo : " + vo.toString());
		
		Criteria criteria;
		
		log.info("pageNum : {} , amount : {}", pageNum, amount);
		
		if(pageNum == null && amount == null) { // 처음 들어왔을 때
			criteria = new Criteria();
			log.info("처음 페이지 pageNum : {}",criteria.getPageNum());
		}else { // 페이징 숫자를 눌렀을 경우
			if(pageNum.equals("0")) {
				pageNum = "1";
			}
			criteria = new Criteria(Integer.parseInt( pageNum ), Integer.parseInt( amount ));
			log.info("두번쨰 페이지 pageNum : {}",criteria.getPageNum());
		}
		
		// 한 회원의 QaA만 필요한 경우
		List<IssueVO> vo = this.issueservice.issuePage(criteria);
		
		
		// total은 전체 페이지의 수를 결정하기위해 필요
		int total = issueservice.totalNum();
		
		PageVO pageVO = new PageVO(criteria, total);
		
		mav.addObject("vo", vo);
		mav.addObject("pageVO", pageVO);
//		mav.addObject("vo", vo);
		mav.setViewName("proj/issueboard/issueBoard");
		
		
		
		return mav;
	}
	
	@GetMapping("/issueBoardPL")
	public String issueBoardPL() {
		return "proj/issueboard/issueBoardPL";
	}
	
	@GetMapping("/issueDetail")
	public ModelAndView issueDetail(ModelAndView mav , IssueVO vo ) {
		IssueVO list = this.issueservice.IssueDetail(vo);
		
		mav.addObject("list",list);
		mav.setViewName("proj/issueboard/issueDetail");
		
		return mav;
	}
	
	@GetMapping("/issueInsert")
	public String issueInsert() {
		return "proj/issueboard/issueInsert";
	}
	
	@GetMapping("/issueUpdate")
	public String issueUpdate() {
		return "proj/issueboard/issueUpdate";
	}
	
	String uploadFolder = "C:\\eGovFrameDev-3.10.0-64bit\\finalproject\\ipms\\src\\main\\webapp\\resources";
	
	@ResponseBody
	@PostMapping("/issueDataInsert")
	public int issueDataInsert( IssueVO vo , MultipartFile[] uploadFile , Authentication authentication) {
		
		List<IntgAttachFileVO> attachVOList = new ArrayList<IntgAttachFileVO>();
		
		log.info("* view -> CONTROLLER * IssueController => issueDataInsert Value : "  + vo.toString());
		log.info("* view -> CONTROLLER * IssueController => uploadFile Value : "  + uploadFile.length);
		
		UserDetails userdetail = (UserDetails)authentication.getPrincipal();
		String userName = userdetail.getUsername();
		log.info("username : " + userName);
		
		String memCode = this.issueservice.getMemCode(userName); // 멤코드 조회
		log.info("memCode : " + memCode);
		
		File uploadPath = new File(uploadFolder,getFolder());
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		int seq = 1;
					  
		int filenum = this.issueservice.MaxFileNumSelect(); // 공통첨부파일 MAX(기본키 추출)

		for (MultipartFile multipartFile : uploadFile) {
			log.info("------------");
			log.info("파일명: "+multipartFile.getOriginalFilename());
			log.info("파일크기 : "+multipartFile.getSize());
			
			//IE처리 => 경로를 제외한 파일명만 추출
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_"+uploadFileName;
			
			File saveFile = new File(uploadPath,uploadFileName);
			//Attach 테이블의 seq 컬럼에 들어갈 값
			
			
			try {
				multipartFile.transferTo(saveFile);
				
				IntgAttachFileVO attachVO = new IntgAttachFileVO();
				attachVO.setIntgAttachFileNum(filenum +"");
				attachVO.setAttachFileSeq(seq++);
				attachVO.setFileName(multipartFile.getOriginalFilename());
				attachVO.setSaveFileName("/"+getFolder().replace("\\", "/")+"/"+uploadFileName);
				attachVO.setFileSize(Long.valueOf(multipartFile.getSize()).intValue());
				attachVO.setRgstId(memCode);
				attachVO.setFilePath(uploadFolder);
				attachVO.setFileSizeName(multipartFile.getContentType());
				attachVO.setFileSize(multipartFile.getSize());
				attachVO.setFileType(Files.probeContentType(saveFile.toPath()));
				log.info("attachVO : " + attachVO);
				attachVOList.add(attachVO);
				
				if(checkImageType(saveFile)) {
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
					//Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
					thumbnail.close();
				}
			} catch (Exception e) {
				log.info(e.getMessage());
			}
		}
		
		
		for(IntgAttachFileVO attachVO  :attachVOList) {
			int furesult = this.issueservice.uploadFileInsert(attachVO);
			log.info("파일 업로드 결과 : " + furesult);
		}
		
		vo.setItgrnAttachFileNum(filenum+"");
		log.info("issue vo 먼저선 : " + vo.toString());
		int result = this.issueservice.IssueDataInsert(vo);
		log.info("issue vo 뒤후: " + vo.toString());
		
		log.info("* DB -> CONTROLLER * IssueController => issueDataInsert result : " + result);
		
		return result ; 
	}
	
	
	
	
	@ResponseBody
	@PostMapping("/taskListSelect")
	public JSONObject taskListSelect() {
		List<IssueVO> returnvo = this.issueservice.taskListSelect();
		
		log.info("* DB -> CONTROLLER * IssueController => taskListSelct Value : "  + returnvo.toString());
		
		JSONObject obj = new JSONObject();
		obj.put("vo", returnvo);
		
		return obj ;
	}
	
	public String getFolder() {
		//format 지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//날짜 객체 생성
		Date date = new Date();
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	
	//이미지인지 체크(썸네일용)
		//모바일과 같은 환경에서 많은 데이터를 소비해야 하므로
		//이미지의 경우 특별한 경우가 아니면 섬네일을 제작해줘야함
	public boolean checkImageType(File file) {
		/*
		 	jpeg/ jpg(jpeg 이미지)의 MIME 타입: image/jpeg
		 	//MIME 타입을 통해 이미지 여부 확인
		 	file.toPath() : 파일 객체를 Path객체로 변화
		 */
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			log.info("contentType: "+contentType);
			return contentType.startsWith("image");
		} catch (IOException e) {
			log.error(e.getMessage());
		}
		return false;
	}
	
	
	
	
	
}
