package com.ipms.proj.freeboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.proj.freeboard.service.FreeboardCmtService;
import com.ipms.proj.freeboard.vo.FreeboardCmtVO;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@RequestMapping("/proj")
@Controller
public class FreeboardCmtController {

	@Autowired
	FreeboardCmtService freeboardCmtService;
	
	// 댓글 등록
	@ResponseBody
	@PostMapping("/{projId}/insertFreeCmt")
	public int insertFreeCmt(@RequestBody FreeboardCmtVO freeboardCmtVO) {
		//insert Cmt: FreeboardCmtVO(projBdCmtId=0, projBdId=1, projBdCmtCts=ㅁㄴㅇㄹㄴ, writer=null, writerCmt=M003, projBdCmtWriteDate=null, highCmtId=null, lowRgstSeq=0, deleteYn=null)
		
		freeboardCmtVO.setWriter(freeboardCmtVO.getWriterCmt());	// 댓글작성자
		log.info("insert Cmt: " + freeboardCmtVO.toString());
		
		int result = this.freeboardCmtService.insertFreeCmt(freeboardCmtVO);
		log.info("result: " + result);
		
		return result;
	}
	
	
	// 댓글 수정
	@ResponseBody
	@PostMapping("/{projId}/updateFreeCmt")
	public int updateFreeCmt(@RequestBody FreeboardCmtVO freeboardCmtVO) {
		//freeboardCmtVO : FreeboardCmtVO(projBdCmtId=7, projBdId=0, projBdCmtCts=ㅇㅇㅇㄴㄴ, writer=null, writerCmt=null, projBdCmtWriteDate=null, highCmtId=null, lowRgstSeq=0, deleteYn=null)
		log.info("freeboardCmtVO : " + freeboardCmtVO.toString());
		
		int result = this.freeboardCmtService.updateFreeCmt(freeboardCmtVO);
		log.info("result: " + result);
		
		return result;
	}
	
	// 댓글 삭제
	@ResponseBody
	@PostMapping("/{projId}/deleteFreeCmt")
	public int deleteFreeCmt(@RequestBody FreeboardCmtVO freeboardCmtVO) {
		
		int result = this.freeboardCmtService.deleteFreeCmt(freeboardCmtVO);
		log.info("result: " + result);
		
		return result;
	}
	
//	@ResponseBody
//	@PostMapping("/proj/insertFreeCmt")
//	public ResponseEntity<String> insertFreeCmt(@ModelAttribute FreeboardCmtVO freeboardCmtVO) {
//		
//		log.info("insert Cmt: " + freeboardCmtVO.toString());
//		
////		int result = this.freeboardCmtService.insertFreeCmt(freeboardCmtVO);
////		log.info("result: " + result);
//				
////		return "redirect:/proj/freeBoardDetail?projBdId="+freeboardCmtVO.getProjBdId();
//		return new ResponseEntity<String>("1",null,HttpStatus.OK);
//	}

}
