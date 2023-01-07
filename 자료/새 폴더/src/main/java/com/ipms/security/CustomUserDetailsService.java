package com.ipms.security;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.login.mapper.MemMapper;
import com.ipms.security.domain.CustomUser;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = { @Autowired })
	private MemMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {

			 MemVO mvo = this.memberMapper.read(userName);
			
			 if(mvo != null){
				 return new CustomUser(mvo);
			 }else{
				 throw  new UsernameNotFoundException("user with username"+userName);
			 }
	}
}
