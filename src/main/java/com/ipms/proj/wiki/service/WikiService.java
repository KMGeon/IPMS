package com.ipms.proj.wiki.service;

import java.util.List;

import com.ipms.vo.WikiVO;

public interface WikiService {

	public int insertWiki(WikiVO wikiVO);

	public List<WikiVO> selectHighWikiId();

	public List<WikiVO> selectWiki(String wikiId);

	public WikiVO selectWikiDetail(String wikiId);

	public int updateWiki(WikiVO wikiVO);

	public int deleteWiki(String wikiVO);

}
