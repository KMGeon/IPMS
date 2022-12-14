package com.ipms.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import com.ipms.main.login.vo.MemVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomUser extends User {

	private static final long serialVersionUID = 1L;

	private MemVO member;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CustomUser(MemVO vo) {

		super(vo.getMemEmail(), vo.getMemPasswd(), vo.getMemAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getMemAuth())).collect(Collectors.toList()));
		this.member = vo;
	}
}
