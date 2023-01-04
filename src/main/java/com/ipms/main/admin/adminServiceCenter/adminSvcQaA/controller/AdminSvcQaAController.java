package com.ipms.main.admin.adminServiceCenter.adminSvcQaA.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.commons.vo.Criteria;
import com.ipms.commons.vo.PageVO;
import com.ipms.main.admin.adminServiceCenter.adminSvcQaA.service.AdminSvcQaAService;
import com.ipms.main.admin.adminServiceCenter.adminSvcQaA.vo.AdminSvcQaACommentVO;
import com.ipms.main.admin.adminServiceCenter.adminSvcQaA.vo.AdminSvcQaAVO;
import com.ipms.main.serviceCenter.svcQaA.vo.SvcQaAVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class AdminSvcQaAController {
	
	@Autowired
	AdminSvcQaAService adminSvcQaAService;
	
	@GetMapping("/adminSvcQaA")
	public String adminSvcQaA(Model model, String pageNum, String amount) {
		Criteria criteria;
        log.info("pageNum : {} , amount : {}", pageNum, amount);
        if (pageNum == null && amount == null) { // 처음 들어왔을 때
            criteria = new Criteria();
            log.info("처음 페이지 pageNum : {}", criteria.getPageNum());
        } else { // 페이징 숫자를 눌렀을 경우
            if (pageNum.equals("0")) {
                pageNum = "1";
            }
            criteria = new Criteria(Integer.parseInt(pageNum), Integer.parseInt(amount));
            log.info("두번쨰 페이지 pageNum : {}", criteria.getPageNum());
        }

        List<AdminSvcQaAVO> svcQaASelect = adminSvcQaAService.adminSvcQaASelect(criteria);

        int total = adminSvcQaAService.adminTotal();
        PageVO pageVO = new PageVO(criteria, total);
        model.addAttribute("adminSvcQaASelect", svcQaASelect);
        model.addAttribute("pageVO", pageVO);
		
		return "main/admin/adminSvcQaA";
		
	}
	
	// Q&A와 댓글을 각각 조회
	@GetMapping("/adminPopUp/adminSvcQaADetail")
	public String adminSvcQaADetail(String qnaNum, Model model) {
		
		if (qnaNum != null) {
            log.info("AdminSvcQaAController - adminSvcQaADetail -> qnaNum : {}", qnaNum);
        }
		
		// Q&A 조회
		AdminSvcQaAVO adminSvcQaAVO = adminSvcQaAService.adminSvcQaADetail(qnaNum);
		
		// 댓글 조회
		AdminSvcQaACommentVO adminSvcQaACommentVO = adminSvcQaAService.adminSvcQaACommentSelect(qnaNum);
		
        model.addAttribute("adminSvcQaAVO", adminSvcQaAVO);
        model.addAttribute("adminSvcQaACommentVO", adminSvcQaACommentVO);
		
		return "main/admin/adminPopUp/adminSvcQaADetail";
	}
	
	@ResponseBody
	@PostMapping(value = "/adminPopUp/adminSvcQaAReplyInsert")
	public int adminSvcQaAReplyInsert(@RequestBody AdminSvcQaACommentVO adminSvcQaACommentVO) {
		
		log.info("AdminSvcQaAController - adminSvcQaAReplyInsert 실행");
		
		if (adminSvcQaACommentVO != null) {
            log.info("AdminSvcQaAController - adminSvcQaAReplyInsert -> adminSvcQaACommentVO : {}", adminSvcQaACommentVO);
        }
		
		// 관리자 답변 등록
		int insertResult = adminSvcQaAService.adminSvcQaACommentInsert(adminSvcQaACommentVO);
		// 관리자 답변 후 Q&A 상태 변경
		int updateResult = adminSvcQaAService.adminSvcQaAStatusUpdate(adminSvcQaACommentVO.getQnaNum());
		
		if(insertResult > 0) {
			log.info("관리자 답변 등록 완료");
		}else {
			log.info("관리자 답변 등록 불가!!!");
		}
		
		if(updateResult > 0) {
			log.info("답변 상태 변경 완료");
		}else {
			log.info("답변 상태 변경 불가!!!");
		}
		
		return insertResult;
	}
	
}
