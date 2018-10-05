package review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import review.bean.ReviewDTO;
import review.dao.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	ReviewDAO reviewDAO;
	
	@Override
	public int insertReview(ReviewDTO reviewDTO) {
		return reviewDAO.insertReview(reviewDTO);
	}

	@Override
	public int updateReview(ReviewDTO reviewDTO) {
		return reviewDAO.updateReview(reviewDTO);
	}

	@Override
	public int deleteReview(int review_num) {
		return reviewDAO.deleteReview(review_num);
	}

	@Override
	public int updateReview_reSeq(int review_ref, int review_seq) {
		return reviewDAO.updateReview_reSeq(review_ref, review_seq);
	}

	@Override
	public List<ReviewDTO> reviewList(int startNum, int endNum) {
		return reviewDAO.reviewList(startNum, endNum);
	}

	@Override
	public ReviewDTO reviewView(int review_num) {
		return reviewDAO.reviewView(review_num);
	}

	@Override
	public int getReviewTotalA() {
		return reviewDAO.getReviewTotalA();
	}

}
