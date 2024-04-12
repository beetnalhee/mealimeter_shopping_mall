package com.ezen.mall.domain.board.dao;

public class Board {
    int boardId;
    int category;
    String boardTitle;
    String descriptions;

    public Board(){}

    public Board(int boardId, int category, String boardTitle, String descriptions) {
        this.boardId = boardId;
        this.category = category;
        this.boardTitle = boardTitle;
        this.descriptions = descriptions;
    }

    public int getBoardId() {
        return boardId;
    }

    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }


    public String getBoardTitle() {
        return boardTitle;
    }

    public void setBoardTitle(String boardTitle) {
        this.boardTitle = boardTitle;
    }

    public String getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    @Override
    public String toString() {
        return "Board{" +
                "boardId=" + boardId +
                ", category=" + category +
                ", title='" + boardTitle + '\'' +
                ", description='" + descriptions + '\'' +
                '}';
    }
}
