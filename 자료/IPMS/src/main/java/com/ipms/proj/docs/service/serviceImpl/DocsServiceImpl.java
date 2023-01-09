package com.ipms.proj.docs.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.commons.ftp.FtpUtil;
import com.ipms.proj.docs.mapper.DocsMapper;
import com.ipms.proj.docs.service.DocsService;
import com.ipms.proj.docs.vo.DocsVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DocsServiceImpl implements DocsService{
	
	@Autowired
	private DocsMapper docsMapper;
	
	// 폴더 조회 
	@Override
	public List<DocsVO> selectDocs(DocsVO docsVO) {
		
		List<DocsVO> docsList = docsMapper.selectDocs(docsVO);
		
		if(docsList == null) {
			return null;
		}
		
		if( !docsList.isEmpty() && docsList != null ) {
			// 데이터 잘 불러왔을 때
			log.debug( "DocsServiceImpl - selectDocs() : st -> {}", docsList.get(0).getFoldName() );
			for(int i = 0; i < docsList.size(); i++) {
				if( docsList.get(i).getDeleteYn().equals("y")) {
					docsList.remove(i);
				}
			}
		}
		
		return docsList;
	}

	@Override
	public int insertFolder(DocsVO docsVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 폴더 생성
//	@Override
//	public int insertFolder(DocsVO docsVO) {
//		
//		log.info("DocsServiceImpl - insertFolder() : docsVO.getFoldName() -> {}", docsVO.getFoldName());
//		
//		FtpUtil.docsMkdir(docsVO.getFoldName());
//		
//		int result = docsMapper.insertFolder(docsVO);
//		
//		return result;
//	}
	

}
