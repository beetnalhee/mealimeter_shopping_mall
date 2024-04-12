package com.ezen.mall.domain.review.service;

import com.ezen.mall.domain.review.dao.JdbcReviewDao;
import com.ezen.mall.domain.review.dao.ReviewDao;
import com.ezen.mall.domain.review.dto.Review;

import java.sql.SQLException;
import java.util.List;

public class ReviewServiceImpl implements ReviewService{
    ReviewDao reviewDao = new JdbcReviewDao();


    @Override
    public void writeReview(Review review) {
        try {
            reviewDao.createReview(review);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Review> reviewList() {
        try {
            return reviewDao.findreviewByAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
