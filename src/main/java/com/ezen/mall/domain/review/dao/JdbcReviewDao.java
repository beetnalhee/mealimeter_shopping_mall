package com.ezen.mall.domain.review.dao;

import com.ezen.mall.domain.board.dao.Board;
import com.ezen.mall.domain.board.dto.Article;
import com.ezen.mall.domain.common.database.ConnectionFactory;
import com.ezen.mall.domain.review.dto.Review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JdbcReviewDao implements ReviewDao {
    public ConnectionFactory connectionFactory = ConnectionFactory.getInstance();
    public Connection conn = null;
    public PreparedStatement pstmt = null;
    public ResultSet rs = null;

    @Override
    public void createReview(Review review) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO review (review_id, subject, content, attach_file, order_no, order_id, user_id, board_id, product_id)")
                .append(" VALUES(review_seq.nextval,?,?,'nakji.jpg', 0 , 0, ?, 100, ?)");

        conn = connectionFactory.getConnection();
        pstmt = null;

        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, review.getSubject());
            pstmt.setString(2, review.getContent());
            pstmt.setString(3, review.getUserId());
            pstmt.setInt(4, review.getProductId());
            pstmt.executeUpdate();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public List<Review> findreviewByAll() throws SQLException {
        List<Review> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT review_id, subject, content, regdate, attach_file, order_no, order_id, user_id, board_id, product_id")
                .append(" FROM review")
                .append(" ORDER BY review_id desc");

        conn = connectionFactory.getConnection();
        try {
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Review review = new Review();
                review.setReviewId(rs.getInt("review_id"));
                review.setSubject(rs.getString("subject"));
                review.setContent(rs.getString("content"));
                review.setRegdate(rs.getString("regdate"));
                review.setAttachFile(rs.getString("attach_file"));
                review.setOrderNo(rs.getInt("order_no"));
                review.setOrderId(rs.getInt("order_id"));
                review.setUserId(rs.getString("user_id"));
                review.setBoardId(rs.getInt("board_id"));
                review.setProductId(rs.getInt("product_id"));
                list.add(review);
            }
        } finally {
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

    public static void main(String[] args) throws SQLException {
        ReviewDao reviewDao = new JdbcReviewDao();

//        Review review = new Review(100,"힘", "들", "2024-04-12", "j.jpg", 0, 0, "chan999", 100, 105);
//        review.setSubject("제발");
//        review.setContent("되라");
//        review.setOrderNo(1);
//        review.setOrderId(1234);
//        review.setUserId("chan999");
//        review.setBoardId(100);
//        review.setProductId(101);

//        reviewDao.createReview(review);
//        System.out.println("댓글등록 완료");
//
        List<Review> list = reviewDao.findreviewByAll();
        for (Review review : list) {
            System.out.println(review);
        }











    }
}


