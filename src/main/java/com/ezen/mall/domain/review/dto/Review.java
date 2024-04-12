package com.ezen.mall.domain.review.dto;

public class Review {
    int reviewId;
    String subject;
    String content;
    String regdate;
    String attachFile;
    int orderNo;
    int orderId;
    String userId;
    int boardId;
    int productId;

    public Review() {}

    public Review(int reviewId, String subject, String content, String regdate, String attachFile, int orderNo, int orderId, String userId, int boardId, int productId) {
        this.reviewId = reviewId;
        this.subject = subject;
        this.content = content;
        this.regdate = regdate;
        this.attachFile = attachFile;
        this.orderNo = orderNo;
        this.orderId = orderId;
        this.userId = userId;
        this.boardId = boardId;
        this.productId = productId;
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
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

    public String getAttachFile() {
        return attachFile;
    }

    public void setAttachFile(String attachFile) {
        this.attachFile = attachFile;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getBoardId() {
        return boardId;
    }

    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Override
    public String toString() {
        return "Review{" +
                "reviewId=" + reviewId +
                ", subject='" + subject + '\'' +
                ", content='" + content + '\'' +
                ", regdate='" + regdate + '\'' +
                ", attachFile='" + attachFile + '\'' +
                ", orderNo=" + orderNo +
                ", orderId=" + orderId +
                ", userId='" + userId + '\'' +
                ", boardId=" + boardId +
                ", productId=" + productId +
                '}';
    }
}
