package com.ezen.mall.domain.board.dao;

import com.ezen.mall.domain.board.dto.Article;
import com.ezen.mall.domain.common.database.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JdbcArticleDao implements ArticleDao{
    public ConnectionFactory connectionFactory = ConnectionFactory.getInstance();
    public Connection conn = null;
    public PreparedStatement pstmt = null;
    public ResultSet rs = null;

    @Override
    public List<Board> findByBoardAll() throws SQLException {
        List<Board> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT board_id, category, board_title, descriptions")
                .append(" FROM board")
                .append(" ORDER BY board_id");

        conn = connectionFactory.getConnection();
        try {
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Board board = new Board();
                board.setBoardId(rs.getInt("board_id"));
                board.setCategory(rs.getInt("category"));
                board.setBoardTitle(rs.getString("board_title"));
                board.setDescriptions(rs.getString("descriptions"));
                list.add(board);
            }
        }
        finally {
            try {
                if(pstmt != null) pstmt.close();
                if(rs != null) rs.close();
                if(conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    @Override
    public void createArticle(Article article) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO article (article_id, board_id, user_id, subject, content, passwd, group_no, level_no, order_no)")
            .append(" VALUES (article_seq.NEXTVAL, ?, ?, ?, ?, ?, article_seq.CURRVAL, 0, 0)");

        conn = connectionFactory.getConnection();
        pstmt = null;

        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, article.getBoardId());
            pstmt.setString(2, article.getUserId());
            pstmt.setString(3, article.getSubject());
            pstmt.setString(4, article.getContent());
            pstmt.setString(5, article.getPasswd());
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
    public List<Article> findByAll(int rowCount, int requestPage, String type, String value) throws SQLException {
        List<Article> list = new ArrayList<>();
        if(type != null && type.equals("")) {
            type = null;
        }
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT article_id, board_id, subject, user_id, group_no, level_no, order_no, regdate, hitcount ")
                .append(" FROM   (SELECT article_id, board_id, CEIL(rownum / ?) request_page, subject, user_id, group_no, level_no, order_no, TO_CHAR(regdate, 'YYYY-MM-DD') regdate, hitcount")
                .append(" FROM   (SELECT article_id, board_id, subject, user_id, group_no, level_no, order_no, regdate, hitcount ")
                .append(" FROM   article ")
                .append(" WHERE  board_id = 100");
        if(type != null) {
            value = "%"+value+"%";
            switch (type){
                case "t" : sql.append(" AND subject LIKE ?"); break;
                case "c" : sql.append(" AND content LIKE ?"); break;
                case "w" : sql.append(" AND user_id LIKE ?"); break;
                case "tc" : sql.append(" AND user_id LIKE ? OR content LIKE ?"); break;
                case "tcw" : sql.append(" AND user_id LIKE ? OR content LIKE ? OR subject LIKE ?"); break;
            }
        }
        sql.append(" ORDER  BY article_id DESC, group_no DESC, order_no ASC")
                .append("       )) ")
                .append(" WHERE  request_page = ?");

        conn = connectionFactory.getConnection();
        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, rowCount);
            if(type == null){
                pstmt.setInt(2, requestPage);
            }else {
                switch (type) {
                    case "tc":
                        pstmt.setString(2, value);
                        pstmt.setString(3, value);
                        pstmt.setInt(4, requestPage);
                        break;
                    case "tcw":
                        pstmt.setString(2, value);
                        pstmt.setString(3, value);
                        pstmt.setString(4, value);
                        pstmt.setInt(5, requestPage);
                        break;
                    default:
                        pstmt.setString(2, value);
                        pstmt.setInt(3, requestPage);
                        break;
                }
            }

            rs = pstmt.executeQuery();
            while (rs.next()) {
                Article article = new Article();
                article.setArticleId(rs.getInt("article_id"));
                article.setBoardId(rs.getInt("board_id"));
                article.setSubject(rs.getString("subject"));
                article.setUserId(rs.getString("user_id"));
                article.setGroupNo(rs.getInt("group_no"));
                article.setLevelNo(rs.getInt("level_no"));
                article.setOrderNo(rs.getInt("order_no"));
                article.setHitcount(rs.getInt("hitcount"));
                article.setRegdate(rs.getString("regDate"));
                list.add(article);
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


    @Override
    public Article findArticle(int articleId) {
        Article article = null;
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT article_id, board_id, subject, user_id, content, TO_CHAR(regdate, 'YYYY-MM-DD HH:MI') regdate, hitcount , group_no, level_no, order_no")
                .append(" FROM   (SELECT article_id, board_id, subject, user_id, content, regdate, hitcount, group_no, level_no, order_no ")
                .append(" FROM   article ")
                .append(" WHERE  board_id = 100)")
                .append(" WHERE  article_id = ?");

        try {
            conn = connectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, articleId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                article = new Article();
                article.setArticleId(rs.getInt("article_id"));
                article.setBoardId(rs.getInt("board_id"));
                article.setSubject(rs.getString("subject"));
                article.setUserId(rs.getString("user_id"));
                article.setContent(rs.getString("content"));
                article.setOrderNo(rs.getInt("order_no"));
                article.setGroupNo(rs.getInt("group_no"));
                article.setLevelNo(rs.getInt("level_no"));
                article.setHitcount(rs.getInt("hitcount"));
                article.setRegdate(rs.getString("regDate"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (rs != null) rs.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return article;
    }

    @Override
    public int findByArticleCount(String type, String value) throws SQLException {
        int count = 0;
        StringBuilder sql = new StringBuilder();
        if(type != null && type.equals("")) {
            type = null;
        }
        sql.append(" SELECT count(*) count")
                .append(" FROM ARTICLE");

        if (type != null) {
            value = "%" + value + "%";
            switch (type) {
                case "t": sql.append(" WHERE subject LIKE ?"); break;
                case "c": sql.append(" WHERE content LIKE ?"); break;
                case "w": sql.append(" WHERE user_id LIKE ?"); break;
                case "tc": sql.append(" WHERE user_id LIKE ? OR content LIKE ?"); break;
                case "tcw": sql.append(" WHERE user_id LIKE ? OR content LIKE ? OR subject LIKE ?"); break;
            }
        }

        conn = connectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql.toString());
            if (type != null) {
                switch (type) {
                    case "tc":
                        pstmt.setString(1, value);
                        pstmt.setString(2, value);
                        break;
                    case "tcw":
                        pstmt.setString(1, value);
                        pstmt.setString(2, value);
                        pstmt.setString(3, value);
                        break;
                    default:
                        pstmt.setString(1, value);
                        break;
                }
            }
            try {
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("count");
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
            return count;
    }

    @Override
    public void updateArticleHitCount(int articleId) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE ARTICLE")
                .append(" SET hitcount = hitcount + 1")
                .append("  WHERE BOARD_ID = 100 AND ARTICLE_ID = ?");

        conn = connectionFactory.getConnection();
        pstmt = null;

        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1,  articleId);
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
}
