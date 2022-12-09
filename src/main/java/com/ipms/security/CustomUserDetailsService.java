package com.ipms.security;

import com.ipms.main.vo.MemVO;
import com.ipms.mapper.MemMapper;
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

		log.warn("Load User By UserName : " + userName);

		// userName means userid
		MemVO vo = memberMapper.read(userName);

		log.warn("queried by member mapper: " + vo);

		return vo == null ? null : new CustomUser(vo);
	}

}
