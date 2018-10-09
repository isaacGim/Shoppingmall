package review.bean;

public class ReviewDTO {
	private int review_num;				// 게시물 번호 seq
	private String review_subject;		// 게시물 제목
	private String review_content;		// 게시물 내용
	private String review_img;			// 상품 이미지
	private String review_writer;		// 작성자 
	private String review_grade;		// GRADE // 별점
	private int review_like;			// LIKE
	private int review_ref;				// 관련글번호
	private int review_lev;				// 답글레벨
	private int review_seq;				// 관련글중 출력순서
	private String review_date;			// 작성일
	private int next_review_seq;
	private int prev_review_seq;
	private String next_review_subject;
	private String prev_review_subject;
	
	@Override
	public String toString() {
		return "ReviewDTO [review_num=" + review_num + ", review_subject=" + review_subject + ", review_content="
				+ review_content + ", review_img=" + review_img + ", review_writer=" + review_writer + ", review_grade="
				+ review_grade + ", review_like=" + review_like + ", review_ref=" + review_ref + ", review_lev="
				+ review_lev + ", review_seq=" + review_seq + ", review_date=" + review_date + ", next_review_seq="
				+ next_review_seq + ", prev_review_seq=" + prev_review_seq + ", next_review_subject="
				+ next_review_subject + ", prev_review_subject=" + prev_review_subject + "]";
	}

	public int getNext_review_seq() {
		return next_review_seq;
	}

	public void setNext_review_seq(int next_review_seq) {
		this.next_review_seq = next_review_seq;
	}

	public int getPrev_review_seq() {
		return prev_review_seq;
	}

	public void setPrev_review_seq(int prev_review_seq) {
		this.prev_review_seq = prev_review_seq;
	}

	public String getNext_review_subject() {
		return next_review_subject;
	}

	public void setNext_review_subject(String next_review_subject) {
		this.next_review_subject = next_review_subject;
	}

	public String getPrev_review_subject() {
		return prev_review_subject;
	}

	public void setPrev_review_subject(String prev_review_subject) {
		this.prev_review_subject = prev_review_subject;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getReview_subject() {
		return review_subject;
	}

	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_img() {
		return review_img;
	}

	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}

	public String getReview_writer() {
		return review_writer;
	}

	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}

	public String getReview_grade() {
		return review_grade;
	}

	public void setReview_grade(String review_grade) {
		this.review_grade = review_grade;
	}

	public int getReview_like() {
		return review_like;
	}

	public void setReview_like(int review_like) {
		this.review_like = review_like;
	}

	public int getReview_ref() {
		return review_ref;
	}

	public void setReview_ref(int review_ref) {
		this.review_ref = review_ref;
	}

	public int getReview_lev() {
		return review_lev;
	}

	public void setReview_lev(int review_lev) {
		this.review_lev = review_lev;
	}

	public int getReview_seq() {
		return review_seq;
	}

	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	
	
	
}
