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
	
	
//	@GetMapping("/freeboard")
//	public String freeboard() {
//		return "proj/freeboard/freeBoard";
//	}
//	
	
	// 자유 게시판 리스트
	@GetMapping("/freeboard")
	public String selectFree(Model model) {
		
		List<FreeboardVO> freeboardVOList = this.freeboardservice.selectFree();
		log.info("freeboardVOList: " + freeboardVOList);
		
		model.addAttribute("freeboardVOList", freeboardVOList);
		
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
	
//	@PostMapping("{projId}/attFile")
//	// 첨부 파일이 있는 경우 insert
//	public List<IntgAttachFileVO> attFile(MultipartFile[] uploadFile, FreeboardVO freeboardVO, @PathVariable String projId){
//		
//		log.info("multi: " + uploadFile[0].getOriginalFilename());
//		log.info("freeboardVO: " + freeboardVO.toString());
//		
//		List<IntgAttachFileVO> list = FileUploadUtil.fileUploadAction(uploadFile, freeboardVO.getProjId(), freeboardVO.getWriter());
//		
//		for(int i=0;i<list.size();i++) {
//			
//			int attachNum = freeboardservice.selectFreeNum();
//			
//			freeboardVO.setItgrnAttachFileNum(attachNum);
//			log.info("attachNum을 넣은 후: " + freeboardVO.toString());
//			
//			int result = freeboardservice.insertFree(freeboardVO);
//			
//			list.get(i).setIntgAttachFileNum(Integer.toString(attachNum));
//			
//			freeboardservice.insertFile(list.get(i));
//			
//		}
//		
//		log.info("처리 후 데이터: " + list.toString());
//		
//		return list;
//	}
//	
	
	@GetMapping("/freeBoardPL")
	public String freeBoardPL() {
		return "proj/freeboard/freeBoardPL";
	}

}
