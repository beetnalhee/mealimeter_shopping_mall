package com.ezen.mall.domain.board.dao;

import com.ezen.mall.domain.board.dto.Article;

import java.sql.SQLException;
import java.util.List;


public interface ArticleDao {
    // boardDao 를 추가하여 게시판 목록을 출력하는 것이 더 맞음.
    public List<Board> findByBoardAll() throws SQLException;
    public void createArticle(Article article) throws SQLException;
    public List<Article> findByAll(int rowCount, int requestPage, String type, String value) throws SQLException;
    public int findByArticleCount(String type, String value) throws SQLException;
    public Article findArticle(int articleId);
    public void updateArticleHitCount(int articleId) throws SQLException;
}
