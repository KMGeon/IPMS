package com.ipms.proj.wiki.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.main.login.vo.MemVO;
import com.ipms.proj.wiki.service.WikiService;
import com.ipms.proj.wiki.vo.WikiVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class WikiController {
	
	@Autowired
	WikiService wikiService;
	
	@GetMapping("/{projId}/wiki")
	public String wikiMain(Model model,@RequestParam(required = false)String wikiId,@PathVariable String projId) {
		log.info("wikiId: "+wikiId);
		
		List<WikiVO> wikiList;
		WikiVO wikiDetail;
		WikiVO wikiVO = new WikiVO();
		
		
		log.info(wikiVO.toString());
		List<WikiVO> highWikiId = this.wikiService.selectHighWikiId(projId);
		if(highWikiId == null) {
		}else {
			model.addAttribute("highWikiId",highWikiId);
		}
		
		//wikiId가 null 이라면 모든 위키를 찾아온다
		if(wikiId == null) {
			wikiVO.setProjId(projId);
			wikiList = wikiService.selectWiki(wikiVO); 
		}else {
			wikiVO.setProjId(projId);
			wikiVO.setWikiId(wikiId);
			wikiList = wikiService.selectWiki(wikiVO);
			//현재 위키 아이디의 정보도 가져오므로 자기자신은 제거한다
			wikiList.remove(0);
			wikiDetail = wikiService.selectWikiDetail(wikiId);
			model.addAttribute("wikiDetail",wikiDetail);
		}
		
		model.addAttribute("projId",projId);
		model.addAttribute("list",wikiList);
		return "proj/wiki/wiki";
	}
	
	@GetMapping("/{projId}/wikiInsert")
	public String wikiInsertGet(Model model,@PathVariable String projId) {
		List<WikiVO> highWikiId = this.wikiService.selectHighWikiId(projId);
		//high 위키 아이디가 없다면 데이터를 넘기지 않는다
		if(highWikiId == null) {
		}else {
			model.addAttribute("highWikiId",highWikiId);
		}
		
		log.info("highWikiId: "+highWikiId.toString());
		
		model.addAttribute("projId",projId);
		return "proj/wiki/wikiInsert";
	}
	
	@PostMapping("/{projId}/wikiInsert")
	public String wikiInsertPost(WikiVO wikiVO,@PathVariable String projId,@AuthenticationPrincipal MemVO memVO) {
		//wikiVO에 highWikiId가 빈 문자열로 들어온다면 null을 세팅해준다.
		
		wikiVO.setProjId(projId);
		if(wikiVO.getHighWikiId() == "") {
			wikiVO.setHighWikiId(null);
		}
		log.info("wikiVO: "+wikiVO.toString());
		int result = wikiService.insertWiki(wikiVO);
		
		if(result > 0) {
			return "redirect:/proj/"+projId+"/wiki";			
		}else {
		}
		return "redirect:/proj/"+projId+"/wiki";
		
	}
	
	/**
	 * 위키의 트리구조를 그려주기위한 서비스
	 * @return List<WikiVO>
	 */
	@ResponseBody
	@PostMapping("/{projId}/wikiTree")
	public List<WikiVO> wikiTree(@PathVariable String projId){
		WikiVO wikiVO = new WikiVO();
		wikiVO.setProjId(projId);
		List<WikiVO> wikiTree = wikiService.selectWiki(wikiVO);
		log.info("wikiTree: "+wikiTree.toString());
		
		return wikiTree;
	}
	
	@GetMapping("/{projId}/updateWiki")
	public String wikiUpdate(Model model,String wikiId,@PathVariable String projId) {
		WikiVO wikiVO = wikiService.selectWikiDetail(wikiId);
		
		
		model.addAttribute("projId",projId);
		model.addAttribute("list",wikiVO);
		return "proj/wiki/wikiUpdate";
	}
	
	@PostMapping("/{projId}/wikiUpdate")
	public String wikiUpdatePost(WikiVO wikiVO) {
		int result = wikiService.updateWiki(wikiVO);
		String projId = wikiVO.getProjId();
		if(result > 0) {
			return "redirect:/proj/"+projId+"/wiki";
		}
			return  "redirect:/proj/"+projId+"/wiki";
	}
	
	@GetMapping("/{projId}/wikiDelete")
	public String wikiDelete(String wikiId,@PathVariable String projId) {
		int result = wikiService.deleteWiki(wikiId);
		
		if(result > 0) {
			return "redirect:/proj/"+projId+"/wiki";
		}
			return "redirect:/proj/"+projId+"/wiki";
	}
}
