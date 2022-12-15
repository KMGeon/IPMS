package com.ipms.proj.wiki.service;

import java.util.List;

import com.ipms.proj.wiki.vo.WikiVO;

public interface WikiService {

	public int insertWiki(WikiVO wikiVO);

	

	

	public WikiVO selectWikiDetail(String wikiId);

	public int updateWiki(WikiVO wikiVO);

	public int deleteWiki(String wikiVO);

	public List<WikiVO> selectHighWikiId(String projId);



	public List<WikiVO> selectWiki(WikiVO wikiVO);

}
