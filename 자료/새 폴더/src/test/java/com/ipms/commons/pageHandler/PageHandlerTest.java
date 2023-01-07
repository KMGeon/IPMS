package com.ipms.commons.pageHandler;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.newProject.mapper.ProjMapper;
import com.ipms.main.newProject.vo.ProjVO;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
public class PageHandlerTest {
@Inject
    ProjMapper projMapper;
    @Test
    public void testPage(){
        Criteria cri = new Criteria();
        List<ProjVO> list = this.projMapper.getListPage();
        log.info("123"+list.toString());
        list.forEach(b->log.info(String.valueOf(b)));
    }
@Test
    public void  testSearch(){
    Map<String,String>map = new HashMap<>();
    map.put("T","TTT");
    map.put("C","CCC");
    Map<String,Map<String,String>>outer = new HashMap<>();
//    outer("map",map);

}


}