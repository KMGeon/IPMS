package com.ipms.main.login.mapper;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.register.vo.CommonCodeVO;
import com.ipms.main.register.vo.TechStackVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemMapper {
    public int registerCheck(String memEmail);

    public int registerMember(MemVO memVO);

    public int loginMem(MemVO memvo);

    public MemVO read(String userName);

    public int UpdatePwd(MemVO memVO);

    public int authInsert(MemberAuth memberAuth);

    public int insertTechStack(TechStackVO techStackVO);
    //공통코드 뿌리기
    public List<CommonCodeVO> techStack();

    public List<MemVO> allGetMemCode();

}
