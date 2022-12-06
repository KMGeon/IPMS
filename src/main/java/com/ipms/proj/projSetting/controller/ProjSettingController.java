package com.ipms.proj.projSetting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class ProjSettingController {
	
	@GetMapping("/settingManagement")
	public String setProj() {
		return "proj/projSetting/settingManagement";
	}
	
}
