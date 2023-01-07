package com.ipms.proj.wiki.mapper;


import java.util.List;

import com.ipms.proj.wiki.vo.WikiVO;


public interface WikiMapper {
	
	public int insertWiki(WikiVO wikiVO);
	
	public List<WikiVO> selectHighWikiId(String projId);
	
	public List<WikiVO> selectWiki(WikiVO wikiVO);
	
	public WikiVO selectWikiDetail(String wikiId);
	
	public int updateWiki(WikiVO wikiVO);
	
	public int deleteWiki(String wikiVO);
}
