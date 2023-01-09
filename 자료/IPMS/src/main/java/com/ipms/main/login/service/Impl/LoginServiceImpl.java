package com.ipms.main.login.service.Impl;

import com.ipms.main.login.mapper.MemMapper;
import com.ipms.main.login.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
@Autowired
MemMapper memMapper;
}
