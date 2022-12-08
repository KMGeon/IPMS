package com.ipms.proj.wiki.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.mapper.WikiMapper;
import com.ipms.proj.wiki.service.WikiService;
import com.ipms.vo.WikiVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class WikiServiceImpl implements WikiService{
	
	@Autowired
	WikiMapper wikiMapper;
	
	@Override
	public int insertWiki(WikiVO wikiVO) {
		log.info("wikiVO Service: "+wikiVO.toString());
		return wikiMapper.insertWiki(wikiVO);
	}
	
	@Override
	public List<WikiVO> selectHighWikiId(){
		return wikiMapper.selectHighWikiId();
	}
	
	@Override
	public List<WikiVO> selectWiki(String wikiId){
		return wikiMapper.selectWiki(wikiId);
	}
	
	@Override
	public WikiVO selectWikiDetail(String wikiId) {
		return wikiMapper.selectWikiDetail(wikiId);
	}
	
	@Override
	public int updateWiki(WikiVO wikiVO) {
		return wikiMapper.updateWiki(wikiVO);
	}
	
	@Override
	public int deleteWiki(String wikiVO) {
		return wikiMapper.deleteWiki(wikiVO);
	}
}
