package com.ipms.main.projectlistdetail.service.serviceImpl;

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


    @Override
    public int insertReply(ProjSmryCmtVO projSmryCmtVO) {
        return this.projSmryCmtMapper.insertReply(projSmryCmtVO);
    }

    @Override
    public int replyInsert(ProjSmryCmtVO vo) {
        return this.projSmryCmtMapper.replyInsert(vo);
    }

    public void replyreply(ProjSmryCmtVO vo) {
        ProjSmryCmtVO parent = projSmryCmtMapper.read(vo.getProjSmryCmtNum());
        vo.setReplyGroup(parent.getReplyGroup());
        vo.setReplySeq(parent.getReplySeq() + 1);
        vo.setReplyLevel(parent.getReplyLevel() + 1);
        this.projSmryCmtMapper.replySeqUpdate(parent);
        this.projSmryCmtMapper.replyInsert(vo) ;

    }


    @Override
    public int replySeqUpdate(ProjSmryCmtVO parent) {
        return this.projSmryCmtMapper.replySeqUpdate(parent);
    }

    @Override
    public List<ProjSmryCmtVO> getList() {
        return this.projSmryCmtMapper.getList();
    }

    @Override
    public ProjSmryCmtVO read(String projSmryCmtNum) {
        return this.projSmryCmtMapper.read(projSmryCmtNum);
    }
}
