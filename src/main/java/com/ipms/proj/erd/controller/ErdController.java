package com.ipms.proj.erd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.proj.erd.service.ErdService;
import com.ipms.proj.erd.vo.ErdVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class ErdController {

	@Autowired
	ErdService erdService;
	
	
	@GetMapping("/{projId}/erd")
	public String erdGet(@RequestParam(required = false) Integer erdNum,Model model,@PathVariable String projId) {
		
		ErdVO erdVO = new ErdVO();
		ErdVO num = new ErdVO();
		if(erdNum == null) {
			erdVO = new ErdVO();
		}else {
			erdVO.setErdNum((int)erdNum);
		}
		num.setProjId(projId);
		erdVO.setProjId(projId);
		
		ErdVO erdData = erdService.selectErd(erdVO);
		List<ErdVO> listErdVer = erdService.selectVer(num);
		log.info("===============:"+listErdVer.toString());
		model.addAttribute("projId",projId);
		model.addAttribute("erdData",erdData);
		model.addAttribute("listErdVer",listErdVer);
		return "proj/erd/erd";
	}
	
	@ResponseBody
	@PostMapping("/{projId}/erdInsert")
	public String erdInsertPost(@RequestBody ErdVO erdVO) {
		log.info("erdVO: "+erdVO.toString());
		int result = erdService.insertErd(erdVO);
		String requist = "";
		if(result > 0) {
			requist = "성공";
		}else {
			requist = "실패";
		}
		
		return requist;
	}
	
	@ResponseBody
	@PostMapping("/{projId}/erdVer")
	public List<ErdVO> erdVer(@RequestBody(required = false) ErdVO erdVO,@PathVariable String projId){
		erdVO.setProjId(projId);
		List<ErdVO> result = erdService.selectVer(erdVO);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/{projId}/erdUpdate")
	public String erdUpdate(@RequestBody ErdVO erdVO) {
		int result = erdService.erdUpdate(erdVO);
		String upadteResult = "";
		if(result > 0) {
			upadteResult ="성공";
		}else {
			upadteResult ="실패";
		}
		return upadteResult;
	}
	
	@ResponseBody
	@PostMapping("/{projId}/erdDelete")
	public String erdDelete(@RequestBody ErdVO erdVO) {
		int result = erdService.erdDelete(erdVO);
		String upadteResult = "";
		if(result > 0) {
			upadteResult ="성공";
		}else {
			upadteResult ="실패";
		}
		return upadteResult;
		
	}
}
