package com.ipms.main.projectlistdetail.service.serviceImpl;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.newProject.mapper.ProjMapper;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.main.projectlistdetail.mapper.ProjSmryCmtMapper;
import com.ipms.main.projectlistdetail.service.ProjectListDetailService;
import com.ipms.main.projectlistdetail.vo.ProjSmryCmtVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectListDetailImpl implements ProjectListDetailService {
    @Autowired
    ProjSmryCmtMapper projSmryCmtMapper;
    @Autowired
    ProjMapper projMapper;

    @Override
    public List<MemVO> getDetailLeaderInfo(String projId) {
        return this.projMapper.getDetailLeaderInfo(projId);
    }

    @Override
    public int projectsAlreadyApplied(ProjVO projVO) {
        return this.projMapper.projectsAlreadyApplied(projVO);
    }

    @Override
    public int joinProject(ProjVO projVO) {
        return this.projMapper.joinProject(projVO);
    }

    @Override
    public ProjSmryCmtVO read(String projSmryCmtNum) {
        return this.projSmryCmtMapper.read(projSmryCmtNum);
    }
    
    
    

	@Override
	public List<ProjSmryCmtVO> projCmtList(String projId) {
		return this.projSmryCmtMapper.projCmtList(projId);
	}

	@Override
	public int projCmtInsert(ProjSmryCmtVO projSmryCmtVO) {
		return this.projSmryCmtMapper.projCmtInsert(projSmryCmtVO);
	}

	@Override
	public int projCmtInsert2(ProjSmryCmtVO projSmryCmtVO) {
		return this.projSmryCmtMapper.projCmtInsert2(projSmryCmtVO);
	}

	@Override
	public int projCmtUpdate(ProjSmryCmtVO projSmryCmtVO) {
		return this.projSmryCmtMapper.projCmtUpdate(projSmryCmtVO);
	}

	@Override
	public int projCmtDel(ProjSmryCmtVO projSmryCmtVO) {
		return this.projSmryCmtMapper.projCmtDel(projSmryCmtVO);
	}
}
