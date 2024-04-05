package com.ezen.mall.domain.member.service;

import com.ezen.mall.domain.member.dao.JdbcMemberDao;
import com.ezen.mall.domain.member.dao.MemberDao;
import com.ezen.mall.domain.member.dto.Member;

import java.sql.SQLException;


public class MemberService {
    private MemberDao memberDao;

    public MemberService () {
        memberDao = new JdbcMemberDao();
    }

    public Member registerMember(Member member) throws Exception {
        memberDao.create(member);
        return memberDao.findById(member.getId());
    }

    public Member login(String id, String passwd) throws SQLException {
        Member loginMember = null;
        if(memberDao.findByIdNPasswd(id, passwd)){
            loginMember = memberDao.findById(id);
        }
        return loginMember;
    }

    public static void main(String[] args) throws SQLException {
        MemberService memberService = new MemberService();
        Member member = memberService.login("chan999", "9999");
    }
}
