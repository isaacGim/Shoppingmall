package review.controller;

import java.util.List;

import review.bean.ReviewDTO;

public interface ReviewService {
	/*		리뷰		*/
	// 글 쓰기
	public int insertReview (ReviewDTO reviewDTO);
	// 글 수정
	public int updateReview (ReviewDTO reviewDTO);
	// 글 삭제
	public int deleteReview (int review_num);
	// re_seq 증가
	public int updateReview_reSeq (int review_ref, int review_seq);
	// 게시판 목록 보기
	public List<ReviewDTO> reviewList (int startNum, int endNum);
	// 글 상세보기
	public ReviewDTO reviewView (int review_num);
	// 총글수 얻어오기
	public int getReviewTotalA ();
}
