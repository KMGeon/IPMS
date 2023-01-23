package com.ipms.main.main.service;

import com.ipms.main.alert.vo.AlrmVO;

import java.util.List;

public interface MainService {
    int deleteAlrm(AlrmVO alrmVO);

    List<AlrmVO> getAlrmList(String memCode);

    int countAlrm(String memCode);
}
