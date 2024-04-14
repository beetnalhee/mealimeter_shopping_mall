package com.ezen.mall.domain.review.dao;

import com.ezen.mall.domain.review.dto.Review;

import java.sql.SQLException;
import java.util.List;

public interface ReviewDao {

    public void createReview(Review review) throws SQLException;
    public List<Review> findreviewByAll() throws SQLException;
}
