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

import javax.servlet.ServletContext;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
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
	
	@Autowired
	ServletContext servletContext;
	
	@GetMapping("/{projId}/issueboard")
	public ModelAndView issueboard(
			  @RequestParam(value="keyword", required=false,defaultValue = "") String keyword 
			, @RequestParam(value="comple" , required=false,defaultValue = "") String comple
			, @RequestParam(value="noncomple" , required=false,defaultValue = "") String noncomple
			, Criteria criteria 
			, ModelAndView mav 
			, String pageNum 
			, String amount 
			, @PathVariable String projId 
			, Authentication authentication) {
		
		
		log.info("pageNum : {} , amount : {}", pageNum, amount);
		log.info("keyword : {}", keyword);
		
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
	
		criteria.setKeyword(keyword);
		criteria.setComple(comple);
		criteria.setNoncomple(noncomple);
		criteria.setProjId(projId);
		
		log.info("criteriaVO : {}" , criteria.toString());
		List<IssueVO> vo = this.issueservice.issuePage(criteria);
		
		
		int total = issueservice.totalNum(criteria);
		
		PageVO pageVO = new PageVO(criteria, total);
		
		mav.addObject("vo", vo);
		mav.addObject("pageVO", pageVO);
		mav.addObject("comple", comple);
		mav.addObject("noncomple", noncomple);
		mav.addObject("keyword", keyword);
		
//		mav.addObject("vo", vo);
		mav.setViewName("proj/issueboard/issueBoard");
		
		
		
		return mav;
	}
	
	@GetMapping("/issueBoardPL")
	public String issueBoardPL() {
		return "proj/issueboard/issueBoardPL";
	}
	
	@GetMapping("/{projId}/issueDetail")
	public ModelAndView issueDetail(ModelAndView mav , IssueVO vo , @PathVariable String projId ) {
		log.info("detailvo : {}",vo.toString());
		vo.setProjId(projId);
		IssueVO list = this.issueservice.IssueDetail(vo);
		
		mav.addObject("list",list);
		mav.addObject("issueCd",list.getIssueId());
		mav.addObject("projId",projId);
		mav.setViewName("proj/issueboard/issueDetail");
		
		return mav;
	}
	
	@GetMapping("/{projId}/issueInsert") // insert 폼 이동
	public String issueInsert(@PathVariable String projId) {
		return "proj/issueboard/issueInsert";
	}
	
	@GetMapping("/{projId}/issueUpdate")// 디테일에서 수정버튼 클릭 시 
	public String issueUpdate(@PathVariable String projId , IssueVO vo , Model model) {
		log.info("*CONTROLLER * IssueController => issueUpdate Value : "  + vo.toString());
		vo.setProjId(projId);
		
		IssueVO list = this.issueservice.IssueDetail(vo);
		
		model.addAttribute("list",list);
		
		return "proj/issueboard/issueUpdate";
	}
	
	
	@ResponseBody
	@PostMapping("/{projId}/issueDataInsert")
	public int issueDataInsert( IssueVO vo , MultipartFile[] uploadFile , Authentication authentication , @PathVariable String projId) {
		List<IntgAttachFileVO> attachVOList = new ArrayList<IntgAttachFileVO>();
		vo.setProjId(projId);
		
		log.info("* view -> CONTROLLER * IssueController => issueDataInsert Value : "  + vo.toString());
		log.info("* view -> CONTROLLER * IssueController => uploadFile Value : "  + uploadFile.length);
		
		UserDetails userdetail = (UserDetails)authentication.getPrincipal();
		String userName = userdetail.getUsername();
		log.info("username : " + userName);
		
		String memCode = this.issueservice.getMemCode(userName); // 멤코드 조회 파일 업로드 시 멤코드 사용
		log.info("memCode : " + memCode);
		
		// 인설트 할때 유저이름 넣어줘야됨
		vo.setWriter(memCode);

		String uploadFolder = servletContext.getRealPath("/") + "\\resources\\uploadIs";
		
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
	@PostMapping("/{projId}/taskListSelect")
	public JSONObject taskListSelect( @PathVariable String projId) {
		List<IssueVO> returnvo = this.issueservice.taskListSelect(projId);
		
		log.info("* DB -> CONTROLLER * IssueController => taskListSelct Value : "  + returnvo.toString());
		
		JSONObject obj = new JSONObject();
		obj.put("vo", returnvo);
		
		return obj ;
	}
	
	@ResponseBody
	@PostMapping("/{projId}/issueStatusCompl")
	public int issueStatusCompl(@RequestBody IssueVO vo) {
		log.info("issueStatusUpdate VO  : {} ",vo.toString());
		int result = this.issueservice.issueStatusCompl(vo);
		
		log.info("issueStatusUpdate result  : {} ",result);
		
		
		return result;
	}

	@ResponseBody
	@PostMapping("/{projId}/issueStatusnonCompl")
	public int issueStatusNonCompl(@RequestBody IssueVO vo ) {
		log.info("issueStatusUpdate VO  : {} ",vo.toString());
		int result = this.issueservice.issueStatusCompl(vo);
		
		log.info("issueStatusUpdate result  : {} ",result);
		
		
		return result;
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
