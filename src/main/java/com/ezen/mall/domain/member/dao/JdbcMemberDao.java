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
        sql.append("INSERT INTO member(member_id, password, name, email)")
                .append(" VALUES (?, ?, ?, ?)");

        conn = connectionFactory.getConnection();
        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPasswd());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getEmail());
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
        sql.append("SELECT member_id, name, email, TO_CHAR(regdate, 'yyyy-MM-DD HH24:MI:SS') regdate")
                .append(" FROM member")
                .append(" WHERE member_id = ?");

        conn = connectionFactory.getConnection();
        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                member = new Member();
                member.setId(rs.getString("member_id"));
                member.setName(rs.getString("name"));
                member.setEmail(rs.getString("email"));
                member.setRegdate(rs.getString("regdate"));
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
        sql.append("SELECT member_id, name, email")
                .append(" FROM member")
                .append(" WHERE member_id = ? AND password = ?");

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
        sql.append("SELECT member_id, name, email, TO_CHAR(regdate, 'yyyy-MM-DD HH24:MI:SS') regdate")
                .append(" FROM member");

        conn = connectionFactory.getConnection();
        try {
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Member member = new Member();
                member.setId(rs.getString("member_id"));
                member.setName(rs.getString("name"));
                member.setEmail(rs.getString("email"));
                member.setRegdate(rs.getString("regdate"));
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
}
