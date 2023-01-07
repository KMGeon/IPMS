package com.ipms.proj.projSetting.mapper;

import com.ipms.main.newProject.vo.ProjVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProjSettingMapper {
List<ProjVO>listProjectSettings(String projId);
int modifyProjectSettings(ProjVO projVO);
int withdrawalProject(String projId);
}
