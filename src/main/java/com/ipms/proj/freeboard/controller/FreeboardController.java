package com.ipms.proj.freeboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
import com.ipms.proj.freeboard.vo.FreeboardPageVO;
import com.ipms.proj.freeboard.service.FreeboardService;
import com.ipms.proj.freeboard.vo.FreeboardVO;
import com.ipms.util.FileUploadUtil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/proj")
public class FreeboardController {

	@Autowired
	FreeboardService freeboardservice;
	
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
	@GetMapping("/freeboard")
	public String freeList(Model model, String pageNum, String amount) {
		
		Criteria criteria;
		
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
		
//		String memCode = "M002";
//		criteria.setMemCode(memCode);
		
		List<FreeboardVO> freeSelect = freeboardservice.getFreePage(criteria);
		
		int total = freeboardservice.getTotal();
		
		FreeboardPageVO freeboardPageVO = new FreeboardPageVO(criteria, total);
		
		model.addAttribute("freeSelect", freeSelect);
		model.addAttribute("pageVO", freeboardPageVO);
		
		return "proj/freeboard/freeBoard";
		
	}
	

	@GetMapping("/freeBoardDetail")
	public String detailFree(@ModelAttribute FreeboardVO freeboardVO, Model model) {

		FreeboardVO data = this.freeboardservice.detailFree(freeboardVO);
		log.info("detailFree->freeboardVO: " + data.toString());
		
		model.addAttribute("data", data);
		
		return "proj/freeboard/freeBoardDetail";
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/freeBoardInsert")
	public String fInsert(Model model) {
		return "proj/freeboard/freeBoardInsert";
	}
	
	@PostMapping("/freeBoardInsertPost")
	public String freeInsert(@ModelAttribute FreeboardVO freeboardVO) {
		
		log.info("freeInsert->freeboardVO: " + freeboardVO.toString());
		
		// 글 입력
		int result = this.freeboardservice.insertFree(freeboardVO);
		log.info("result: " + result);
		
		return "redirect:/proj/freeBoardDetail?projBdId="+freeboardVO.getProjBdId();
	}
	
	@GetMapping("/freeBoardUpdate")
	public String fUpdate(@ModelAttribute FreeboardVO freeboardVO, Model model) {
	
		FreeboardVO data = this.freeboardservice.detailFree(freeboardVO);
		
		model.addAttribute("data", data);
		
		return "proj/freeboard/freeBoardUpdate";
	}
	
	@PostMapping("/freeBoardUpdatePost")
	public String freeUpdate(@ModelAttribute FreeboardVO freeboardVO) {
		
		log.info("freeUpdate -> freeboardVO: " + freeboardVO.toString());
		
		int result = this.freeboardservice.updateFree(freeboardVO);
		log.info("result: " + result);
		
		return "redirect:/proj/freeBoardDetail?projBdId="+freeboardVO.getProjBdId();
	}
	

	@ResponseBody
	@PostMapping("/freeBoardDelete")
	public Map<String, String> deleteFree(@RequestBody FreeboardVO freeboardVO){
		
		log.info("deleteFree->freeboardVO :" + freeboardVO);
		
		Map<String, String> map = new HashMap<String, String>();
		
		int result = this.freeboardservice.deleteFree(freeboardVO);
		
		log.info("result: " + result);
		map.put("result", result+"");
				
		return map;
	}
	
	@ResponseBody
	@PostMapping("/deleteSelFree")
	public int ckDelFree(@RequestParam(value = "ckbox[]") List<String> ckArr, FreeboardVO freeboardVO) {
		
		log.info("선택 삭제 -----------------");
		
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
	

	
	@GetMapping("/freeBoardPL")
	public String freeBoardPL() {
		return "proj/freeboard/freeBoardPL";
	}

}
