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
import com.ipms.proj.wiki.vo.WikiVO;

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
		
		//wikiId가 null 이라면 모든 위키를 찾아온다
		if(wikiId == null) {
			wikiList = wikiService.selectWiki(null); 
		}else {
			wikiList = wikiService.selectWiki(wikiId);
			//현재 위키 아이디의 정보도 가져오므로 자기자신은 제거한다
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
		//high 위키 아이디가 없다면 데이터를 넘기지 않는다
		if(highWikiId == null) {
		}else {
			model.addAttribute("highWikiId",highWikiId);
		}
		
		log.info("highWikiId: "+highWikiId.toString());
		
	
		
		
		return "proj/wiki/wikiInsert";
	}
	
	@PostMapping("/wikiInsert")
	public String wikiInsertPost(WikiVO wikiVO) {
		//wikiVO에 highWikiId가 빈 문자열로 들어온다면 null을 세팅해준다.
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
	
	/**
	 * 위키의 트리구조를 그려주기위한 서비스
	 * @return List<WikiVO>
	 */
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
