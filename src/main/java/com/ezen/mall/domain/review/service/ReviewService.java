package com.ezen.mall.domain.review.service;

import com.ezen.mall.domain.review.dto.Review;

import java.util.List;

public interface ReviewService {

    public void writeReview(Review review);

    public List<Review> reviewList();

}
