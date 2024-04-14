package com.ezen.mall.domain.member.dao;

import com.ezen.mall.domain.common.database.ConnectionFactory;
import com.ezen.mall.domain.member.dto.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JdbcMemberDao implements MemberDao{
    private ConnectionFactory connectionFactory;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public JdbcMemberDao(){
        connectionFactory = ConnectionFactory.getInstance();
    }
    public void create(Member member) throws Exception{
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO users(user_id, passwd, user_name, email, phonenumber, zip_code, user_address)")
           .append(" VALUES(?, ?, ?, ?, ?, ?, ?)");

        conn = connectionFactory.getConnection();
        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPasswd());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getEmail());
            pstmt.setString(5, member.getPhonenumber());
            pstmt.setString(6, member.getZipCode());
            pstmt.setString(7, member.getUserAddress());
            pstmt.executeUpdate();

        } catch (SQLException e) {
                throw new Exception(e.getMessage());
        } finally {
            try {
                if(pstmt != null)  pstmt.close();
                if(conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public Member findById(String id) throws SQLException {
        Member member = null;
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT user_id, user_name, email, phonenumber, zip_code, user_address, TO_CHAR(regdate, 'yyyy-MM-DD HH24:MI:SS') regdate, grade_rating")
           .append(" FROM users")
           .append(" WHERE user_id = ?");

        conn = connectionFactory.getConnection();
        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                member = new Member();
                member.setId(rs.getString("user_id"));
                member.setName(rs.getString("user_name"));
                member.setEmail(rs.getString("email"));
                member.setPhonenumber(rs.getString("phonenumber"));
                member.setZipCode(rs.getString("zip_code"));
                member.setUserAddress(rs.getString("user_address"));
                member.setRegdate(rs.getString("regdate"));
                member.setGradeRating(rs.getString("grade_rating"));
            }
        }
         finally {
            try {
                if (pstmt != null) pstmt.close();
                if (rs != null) rs.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return member;
    }

    public boolean findByIdNPasswd(String id, String pw) throws SQLException {
        boolean isMember = false;
        Member member = null;
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT user_id, user_name, email")
                .append(" FROM users")
                .append(" WHERE user_id = ? AND passwd = ?");

        conn = connectionFactory.getConnection();
        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            rs = pstmt.executeQuery();
            isMember = rs.next();
        }
        finally {
            try {
                if (pstmt != null) pstmt.close();
                if (rs != null) rs.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return isMember;
    }

    @Override
    public List<Member> findAll() throws SQLException {
        List<Member> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT user_id, user_name, email, phonenumber, zip_code, user_address, TO_CHAR(regdate, 'yyyy-MM-DD HH24:MI:SS') regdate, grade_rating")
           .append(" FROM users");

        conn = connectionFactory.getConnection();
        try {
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Member member = new Member();
                member.setId(rs.getString("user_id"));
                member.setName(rs.getString("user_name"));
                member.setEmail(rs.getString("email"));
                member.setPhonenumber(rs.getString("phonenumber"));
                member.setZipCode(rs.getString("zip_code"));
                member.setUserAddress(rs.getString("user_address"));
                member.setRegdate(rs.getString("regdate"));
                member.setGradeRating(rs.getString("grade_rating"));
                list.add(member);
            }
        }
        finally {
            try {
                if (pstmt != null) pstmt.close();
                if (rs != null) rs.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    public static void main(String[] args) throws Exception {
        MemberDao memberDao = new JdbcMemberDao();
        Member member = memberDao.findById("butter");
        System.out.println(member);
//
//        List<Member> list = memberDao.findAll();
//        for (Member member : list) {
//            System.out.println(member);
        }

//        boolean isMember = memberDao.findByIdNPasswd("AAAAA","12345");
//        System.out.println(isMember);




//
//        Member member = new Member("Thu","1111","목요일","thu@gmail.com","010-111","11111","서울시 노원구");
//        memberDao.create(member);
//        System.out.println("회원가입 완료...");


    }

