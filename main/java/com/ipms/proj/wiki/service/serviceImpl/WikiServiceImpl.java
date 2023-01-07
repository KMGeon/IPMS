package com.ipms.proj.wiki.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ipms.proj.wiki.mapper.WikiMapper;
import com.ipms.proj.wiki.service.WikiService;
import com.ipms.proj.wiki.vo.WikiVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class WikiServiceImpl implements WikiService{
	
	@Autowired
	WikiMapper wikiMapper;
	
	@Override
	public int insertWiki(WikiVO wikiVO) {
		log.info("wikiVO Service: "+wikiVO.toString());
		return wikiMapper.insertWiki(wikiVO);
	}
	
	@Override
	public List<WikiVO> selectHighWikiId(String projId){
		return wikiMapper.selectHighWikiId(projId);
	}
	
	@Override
	public List<WikiVO> selectWiki(WikiVO wikiVO){
		return wikiMapper.selectWiki(wikiVO);
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
