package com.ezen.mall.domain.member.dao;

import com.ezen.mall.domain.member.dto.Member;

import java.sql.SQLException;
import java.util.List;

public interface MemberDao {
    public void create(Member member) throws Exception;
    public Member findById(String id) throws SQLException;
    public boolean findByIdNPasswd(String id, String pw) throws SQLException;
    public List<Member> findAll() throws SQLException;
}
