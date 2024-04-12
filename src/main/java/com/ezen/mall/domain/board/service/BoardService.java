package com.ezen.mall.domain.board.service;

import com.ezen.mall.domain.board.dao.Board;
import com.ezen.mall.domain.board.dto.Article;

import java.sql.SQLException;
import java.util.List;

/**
 * 게시판 관련 비즈니스 로직 선언
 */
public interface BoardService {
    /**
     * 게시판 목록 반환
     * @return
     */
    public List<Board> boardList();

    // 신규 글쓰기
    public void writeArticle(Article article);


    // 게시글 목록 반환
    public List<Article> articleList(int rowCount, int requestPage, String type, String value);

    // 게시글 갯수 반환
    public int getArticleCount(String type, String value);

    public Article printArticle(int articleId) throws SQLException;

}
