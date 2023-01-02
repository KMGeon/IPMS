package com.ipms.proj.projSetting.service.serviceImpl;

import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.proj.projSetting.mapper.ProjSettingMapper;
import com.ipms.proj.projSetting.service.ProjSettingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

@Service
@Slf4j
public class ProjSettingServiceImpl implements ProjSettingService {
    @Autowired
    ProjSettingMapper projSettingMapper;


    @Transactional
    public  String projectCreate(@ModelAttribute ProjVO projVO, MultipartFile[] uploadFile) {
        String uploadFolder = "E:\\IdeaProjects\\ipms\\src\\main\\webapp\\resources\\upload\\img";
        for (MultipartFile multipartFile : uploadFile) {
            log.info("Upload File Name: " + multipartFile.getOriginalFilename());
            log.info("Upload File Size: " + multipartFile.getSize());

            File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
            try {
                multipartFile.transferTo(saveFile);
                projVO.setProjImgRoute(multipartFile.getOriginalFilename());
            } catch (Exception e) {
                log.error(e.getMessage());
            }
        }
        log.info("=======================================", projVO);
        if(this.projSettingMapper.modifyProjectSettings(projVO)==1){
            return "main/page";
        }return "main/page";
    }


    @Override
    public List<ProjVO> listProjectSettings(String projId) {
        return this.projSettingMapper.listProjectSettings(projId);
    }

    @Override
    public int modifyProjectSettings(ProjVO projVO) {
        return this.projSettingMapper.modifyProjectSettings(projVO);
    }
}
