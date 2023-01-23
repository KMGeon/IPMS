package com.ipms.proj.freeboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
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

import com.ipms.commons.ftp.vo.IntgAttachFileVO;
import com.ipms.commons.vo.Criteria;
import com.ipms.proj.freeboard.vo.FreeboardCmtVO;
import com.ipms.proj.freeboard.vo.FreeboardPageVO;
import com.ipms.proj.calendar.vo.CalendarVO;
import com.ipms.proj.freeboard.service.FreeboardCmtService;
import com.ipms.proj.freeboard.service.FreeboardService;
import com.ipms.proj.freeboard.vo.FreeboardVO;
import com.ipms.proj.issue.service.IssueService;
import com.ipms.proj.noticeboard.vo.NoticeBoardVO;
import com.ipms.util.FileUploadUtil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/proj")
public class FreeboardController {

	@Autowired
	FreeboardService freeboardservice;
	
	@Autowired
	IssueService issueService;
	
	@Autowired
	FreeboardCmtService freeboardCmtService;
	
//	 자유 게시판 리스트
//	@GetMapping("/freeboard")
//	public String selectFree(Model model) {
//		
//		List<FreeboardVO> freeboardVOList = this.freeboardservice.selectFree();
//		log.info("freeboardVOList: " + freeboardVOList);
//		
//		model.addAttribute("freeboardVOList", freeboardVOList);
//		
//		return "proj/freeboard/freeBoard";
//	}

	// 자유 게시판 리스트 - 페이징 처리
	@GetMapping("/{projId}/freeboard")
	public String freeList(String keyword, String category, Model model, String pageNum, String amount, FreeboardVO freeboardVO, Authentication authentication, @PathVariable String projId) {
		
		Criteria criteria;
		log.info("===================="+projId);
		log.info("pageNum: {} , amount: {}", pageNum, amount);
		
		if(pageNum == null && amount == null) {
			criteria = new Criteria();
			log.info("첫 페이지 pageNum: {}", criteria.getPageNum());
			
		} else {
			if(pageNum.equals("0")) {
				pageNum = "1";
			} 
			criteria = new Criteria(Integer.parseInt(pageNum), Integer.parseInt(amount));
			log.info("두 번째 페이지 pageNum: {}", criteria.getPageNum());

		}
		
		if(category == null || category.equals("")) {
			criteria.setCategory("");
		}else {
			criteria.setCategory(category);
		}
		criteria.setKeyword("%"+keyword+"%");
		
		criteria.setProjId(projId);
		criteria.setAmount(10);
		
		List<FreeboardVO> freeSelect = freeboardservice.getFreePage(criteria);
		
		int total = freeboardservice.getTotal(projId);
		
		FreeboardPageVO freeboardPageVO = new FreeboardPageVO(criteria, total);
		
		model.addAttribute("freeSelect", freeSelect);
		model.addAttribute("pageVO", freeboardPageVO);
		model.addAttribute("keyword",keyword);
		
		//
		UserDetails userdetail = (UserDetails)authentication.getPrincipal();
		String userEmail = userdetail.getUsername();
		String userCode = this.issueService.getMemCode(userEmail); // memcode가져오기
		
	//	log.info("userCode::::::::::: " + userCode);
		
		freeboardVO.setWriter(userCode);
		
		String[] auth = freeboardservice.authCheck(freeboardVO);
		
		String authCheck = "";
		
		for (String string : auth) {
			if(string.equals("ROLE_PROJECT_LEADER")) {
				authCheck = "true";
			}else {
				authCheck ="false";
			}
		}
		
		log.info("authCheck : {}", authCheck);
		
		model.addAttribute("authCheck",authCheck);
		//
		
		return "proj/freeboard/freeBoard";
		
	}
	

	@GetMapping("/{projId}/freeBoardDetail")
	public String detailFree(@ModelAttribute FreeboardVO freeboardVO, Model model, Authentication authentication, @PathVariable String projId) {
		
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		String memName = userDetails.getUsername();
		log.info("userName: " + memName);
		
		String writer = this.issueService.getMemCode(memName);
		log.info("writer: " + writer);
		
		freeboardVO.setWriter(writer);
		freeboardVO.setProjId(projId);
		log.info("projId: " + projId);
		
		FreeboardVO data = this.freeboardservice.detailFree(freeboardVO);
		log.info("detailFree->freeboardVO: " + data.toString());
		
		// 로그인 한 사람이 쓴 글인지 판단하고 상세 페이지에서 수정/삭제 버튼 처리
			FreeboardVO data2 = this.freeboardservice.detailFree2(freeboardVO);
			
			String memCheck = "";
			
			if(data2.getWriter().equals(writer)) {
				memCheck = "true";
			} else {
				memCheck = "false";
			}
			
			log.info("memCheck : {}", memCheck);
			
			model.addAttribute("memCheck", memCheck);
		//
		
		model.addAttribute("data", data);
		
		// 댓글 리스트
		List<FreeboardCmtVO> dataCmt = this.freeboardCmtService.freeCmtList(freeboardVO);
		log.info("cmt list: " + dataCmt.toString());
		
		model.addAttribute("data", data);
		model.addAttribute("dataCmt", dataCmt);
		
		return "proj/freeboard/freeBoardDetail";
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/{projId}/freeBoardInsert")
	public String fInsert(Model model, @PathVariable String projId) {
		return "proj/freeboard/freeBoardInsert";
	}
	
	@PostMapping("/{projId}/freeBoardInsertPost")
	public String freeInsert(@ModelAttribute FreeboardVO freeboardVO, Authentication authentication, @PathVariable String projId) {
		
		log.info("freeInsert->freeboardVO: " + freeboardVO.toString());
		
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		String memName = userDetails.getUsername();
		log.info("userName: " + memName);
		
		String writer = this.issueService.getMemCode(memName);
		log.info("writer: " + writer);
		
		freeboardVO.setWriter(writer);
		freeboardVO.setProjId(projId);
		log.info("projId -------> " + projId);
		
		// 글 입력
		int result = this.freeboardservice.insertFree(freeboardVO);
		log.info("result: " + result);
		
		return "redirect:/proj/{projId}/freeBoardDetail?projBdId="+freeboardVO.getProjBdId();
	}
	
	@GetMapping("/{projId}/freeBoardUpdate")
	public String fUpdate(@ModelAttribute FreeboardVO freeboardVO, Model model, @PathVariable String projId) {
	
		FreeboardVO data = this.freeboardservice.detailFree(freeboardVO);
		
		model.addAttribute("data", data);
		
		return "proj/freeboard/freeBoardUpdate";
	}
	
	@PostMapping("/{projId}/freeBoardUpdatePost")
	public String freeUpdate(@ModelAttribute FreeboardVO freeboardVO, Authentication authentication, @PathVariable String projId) {
		
		log.info("freeUpdate -> freeboardVO: " + freeboardVO.toString());
		
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		String memName = userDetails.getUsername();
		log.info("userName: " + memName);
		
		String writer = this.issueService.getMemCode(memName);
		log.info("writer: " + writer);
		
		freeboardVO.setWriter(writer);
		freeboardVO.setProjId(projId);
		log.info("projId -------> " + projId);
		
		int result = this.freeboardservice.updateFree(freeboardVO);
		log.info("result: " + result);
		
		return "redirect:/proj/{projId}/freeBoardDetail?projBdId="+freeboardVO.getProjBdId();
	}
	

	@ResponseBody
	@PostMapping("/{projId}/freeBoardDelete")
	public Map<String, String> deleteFree(@RequestBody FreeboardVO freeboardVO, Authentication authentication, @PathVariable String projId){
		
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		String memName = userDetails.getUsername();
		log.info("userName: " + memName);
		
		String writer = this.issueService.getMemCode(memName);
		log.info("writer: " + writer);
		
		freeboardVO.setWriter(writer);
		freeboardVO.setProjId(projId);
		
		log.info("projId: " + projId);
		log.info("deleteFree->freeboardVO :" + freeboardVO);
		
		Map<String, String> map = new HashMap<String, String>();
		
		int result = this.freeboardservice.deleteFree(freeboardVO);
		
		log.info("result: " + result);
		map.put("result", result+"");
				
		return map;
	}
	
	@ResponseBody
	@PostMapping("/{projId}/deleteSelFree")
	public int ckDelFree(@RequestParam(value = "ckbox[]") List<String> ckArr, Authentication authentication, FreeboardVO freeboardVO, @PathVariable String projId) {
		
		log.info("선택 삭제 -----------------");
		
		UserDetails userdetail = (UserDetails)authentication.getPrincipal();
		String userEmail = userdetail.getUsername();
		String userCode = this.issueService.getMemCode(userEmail); // memcode가져오기
		
		freeboardVO.setWriter(userCode);
		
		int result = 0;
		int projBdId = 0;
		
		for(String i : ckArr) {
			projBdId = Integer.parseInt(i);
			freeboardVO.setProjBdId(projBdId);
			freeboardservice.ckDelFree(freeboardVO);
		}
		result = 1;
		
		return result;
	}
	
}
