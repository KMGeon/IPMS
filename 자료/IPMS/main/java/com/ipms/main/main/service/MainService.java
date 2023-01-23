package com.ipms.main.main.service;

import com.ipms.main.alert.vo.AlrmVO;

public interface MainService {
    int deleteAlrm(AlrmVO alrmVO);

    int countAlrm(String memCode);
}
