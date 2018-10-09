package review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import review.bean.ReviewDTO;

@Repository
public class ReviewDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	// Review 글 쓰기
	public int insertReview(ReviewDTO reviewDTO) {
		return sqlSession.insert("mybatis.board.insertReview", reviewDTO);
	}
	// Review 글 수정
	public int updateReview(ReviewDTO reviewDTO) {
		return sqlSession.update("mybatis.board.updateReview", reviewDTO);
	}
	// Review imagefile 수정
	public int updateReviewImage(int review_num) {
		return sqlSession.update("mybatis.board.updateReviewImage", review_num);
	}
	// Review 글 삭제
	public int deleteReview(int review_num) {
		return sqlSession.delete("mybatis.board.deleteReview", review_num);
	}
	// Review lev , re_seq 값 증가
	public int updateReview_reSeq(int review_ref, int review_seq) {
		Map<String, Integer> map = new HashMap<>();
		map.put(String.valueOf(review_ref), review_ref);
		map.put(String.valueOf(review_seq), review_seq);
		return sqlSession.update("mybatis.board.updateReview_reSeq", map);
	}
	// Review 게시판 목록 보기
	public List<ReviewDTO> reviewList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.board.reviewList", map);
		
	}
	// Review 글 상세보기
	public ReviewDTO reviewView(int review_num) {
		return sqlSession.selectOne("mybatis.board.reviewView", review_num);
	}	
	// Review 총 글 수  얻어오기
	public int getReviewTotalA () {
		return sqlSession.selectOne("mybatis.board.getReviewTotalA");
	}
	
}
