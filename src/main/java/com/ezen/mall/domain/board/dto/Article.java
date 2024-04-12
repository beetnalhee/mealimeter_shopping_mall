package com.ezen.mall.domain.board.dto;


/**
 * 게시글 캡슐화
 * JavaBean 규약에 따라 작성
 */
public class Article {
    private int articleId;
    private int boardId;
    private String userId;
    private String subject;
    private String content;
    private String regdate;
    private int hitcount;
    private String passwd;
    private String attachFile;
    private int groupNo;
    private int levelNo;
    private int orderNo;
    private int adminNo;

    public Article(){}

    public Article(int articleId, int boardId, String userId, String subject, String content, String regdate, int hitcount, String passwd, String attachFile, int groupNo, int levelNo, int orderNo, int adminNo) {
        this.articleId = articleId;
        this.boardId = boardId;
        this.userId = userId;
        this.subject = subject;
        this.content = content;
        this.regdate = regdate;
        this.hitcount = hitcount;
        this.passwd = passwd;
        this.attachFile = attachFile;
        this.groupNo = groupNo;
        this.levelNo = levelNo;
        this.orderNo = orderNo;
        this.adminNo = adminNo;
    }

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public int getBoardId() {
        return boardId;
    }

    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getAttachFile() {
        return attachFile;
    }

    public void setAttachFile(String attachFile) {
        this.attachFile = attachFile;
    }

    public int getAdminNo() {
        return adminNo;
    }

    public void setAdminNo(int adminNo) {
        this.adminNo = adminNo;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public int getHitcount() {
        return hitcount;
    }

    public void setHitcount(int hitcount) {
        this.hitcount = hitcount;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public int getGroupNo() {
        return groupNo;
    }

    public void setGroupNo(int groupNo) {
        this.groupNo = groupNo;
    }

    public int getLevelNo() {
        return levelNo;
    }

    public void setLevelNo(int levelNo) {
        this.levelNo = levelNo;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

    @Override
    public String toString() {
        return "Article{" +
                "articleId=" + articleId +
                ", boardId=" + boardId +
                ", userId='" + userId + '\'' +
                ", subject='" + subject + '\'' +
                ", content='" + content + '\'' +
                ", regdate='" + regdate + '\'' +
                ", hitcount=" + hitcount +
                ", passwd='" + passwd + '\'' +
                ", attachFile='" + attachFile + '\'' +
                ", groupNo=" + groupNo +
                ", levelNo=" + levelNo +
                ", orderNo=" + orderNo +
                ", adminNo=" + adminNo +
                '}';
    }
}
