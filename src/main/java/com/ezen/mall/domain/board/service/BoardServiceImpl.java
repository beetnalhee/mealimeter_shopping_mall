package com.ezen.mall.domain.board.service;

import com.ezen.mall.domain.board.dao.ArticleDao;
import com.ezen.mall.domain.board.dao.Board;
import com.ezen.mall.domain.board.dao.JdbcArticleDao;
import com.ezen.mall.domain.board.dto.Article;

import java.sql.SQLException;
import java.util.List;

public class BoardServiceImpl implements BoardService{

    ArticleDao articleDao = new JdbcArticleDao();

    @Override
    public List<Board> boardList() {
        try {
            return articleDao.findByBoardAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void writeArticle(Article article) {
        try {
            articleDao.createArticle(article);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void writeComment(Article article) {
        try {
            articleDao.createComment(article);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Article> articleList(int rowCount, int requestPage, String type, String value) {
        try {
            return articleDao.findByAll(rowCount, requestPage, type, value);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Article printArticle(int articleId) throws SQLException {
        Article article = new Article();
        article = articleDao.findArticle(articleId);
        articleDao.updateArticleHitCount(articleId);
        return article;
    }

    @Override
    public int getArticleCount(String type, String value) {
        int count = 0;
        try {
            count = articleDao.findByArticleCount(type, value);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return count;
    }

    public static void main(String[] args) {
        BoardService boardService = new BoardServiceImpl();
        Article article = new Article(650, 10, "chan999", "시험삼아", "해봅니다", "03/04/24", 10, "9999", 650, 0, 0);
        boardService.writeComment(article);
    }
}
