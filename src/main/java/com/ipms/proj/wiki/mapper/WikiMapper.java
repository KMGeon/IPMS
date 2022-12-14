package com.ipms.proj.wiki.mapper;


import java.util.List;

import com.ipms.proj.wiki.vo.WikiVO;


public interface WikiMapper {
	
	public int insertWiki(WikiVO wikiVO);
	
	public List<WikiVO> selectHighWikiId();
	
	public List<WikiVO> selectWiki(String wikiId);
	
	public WikiVO selectWikiDetail(String wikiId);
	
	public int updateWiki(WikiVO wikiVO);
	
	public int deleteWiki(String wikiVO);
}
