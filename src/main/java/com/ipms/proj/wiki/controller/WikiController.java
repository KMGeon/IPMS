package com.ipms.proj.wiki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.proj.wiki.service.WikiService;
import com.ipms.vo.WikiVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class WikiController {
	
	@Autowired
	WikiService wikiService;
	
	@GetMapping("/wiki")
	public String wikiMain(Model model,@RequestParam(required = false)String wikiId) {
		log.info("wikiId: "+wikiId);
		List<WikiVO> wikiList;
		WikiVO wikiDetail;
		
		List<WikiVO> highWikiId = this.wikiService.selectHighWikiId();
		if(highWikiId == null) {
		}else {
			model.addAttribute("highWikiId",highWikiId);
		}
		
		if(wikiId == null) {
			wikiList = wikiService.selectWiki(null); 
		}else {
			wikiList = wikiService.selectWiki(wikiId);
			wikiList.remove(0);
			wikiDetail = wikiService.selectWikiDetail(wikiId);
			model.addAttribute("wikiDetail",wikiDetail);
		}
		
		model.addAttribute("list",wikiList);
		return "proj/wiki/wiki";
	}
	
	@GetMapping("/wikiInsert")
	public String wikiInsertGet(Model model) {
		List<WikiVO> highWikiId = this.wikiService.selectHighWikiId();
		if(highWikiId == null) {
		}else {
			model.addAttribute("highWikiId",highWikiId);
		}
		
		log.info("highWikiId: "+highWikiId.toString());
		
	
		
		
		return "proj/wiki/wikiInsert";
	}
	
	@PostMapping("/wikiInsert")
	public String wikiInsertPost(WikiVO wikiVO) {
		if(wikiVO.getHighWikiId() == "") {
			wikiVO.setHighWikiId(null);
		}
		log.info("wikiVO: "+wikiVO.toString());
		int result = wikiService.insertWiki(wikiVO);
		
		if(result > 0) {
			return "redirect:/proj/wiki";			
		}else {
		}
		return "redirect:/proj/wiki";
		
	}
	
	@ResponseBody
	@PostMapping("/wikiTree")
	public List<WikiVO> wikiTree(){
		List<WikiVO> wikiTree = wikiService.selectWiki(null);
		log.info("wikiTree: "+wikiTree.toString());
		
		return wikiTree;
	}
	
	@GetMapping("/updateWiki")
	public String wikiUpdate(Model model,String wikiId) {
		WikiVO wikiVO = wikiService.selectWikiDetail(wikiId);
		List<WikiVO> highWikiId = this.wikiService.selectHighWikiId();
		
		model.addAttribute("highWikiId",highWikiId);
		model.addAttribute("list",wikiVO);
		return "proj/wiki/wikiUpdate";
	}
	
	@PostMapping("/wikiUpdate")
	public String wikiUpdatePost(WikiVO wikiVO) {
		int result = wikiService.updateWiki(wikiVO);
		
		if(result > 0) {
			return "redirect:/proj/wiki";
		}
			return "redirect:/proj/wiki";
	}
	
	@GetMapping("/wikiDelete")
	public String wikiDelete(String wikiId) {
		int result = wikiService.deleteWiki(wikiId);
		
		if(result > 0) {
			return "redirect:/proj/wiki";
		}
			return "redirect:/proj/wiki";
	}
}
