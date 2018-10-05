package board_qna.bean;

public class Board_qnaDTO {
	private int board_qna_num;			// 게시물 번호 seq
	private String board_qna_subject;	// 게시물 제목
	private String board_qna_content;	// 게시물 내용
	private String board_qna_img;		// 상품 이미지
	private String board_qna_writer;	// 작성자
	private int board_qna_ref;			// 관련글번호
	private int board_qna_lev;			// 답글레벨
	private int board_qna_seq;			// 관련글중 출력순서
	private String board_qna_date;		// 작성일
	private String board_qna_pwd;		// 패스워드
	public String getBoard_qna_pwd() {
		return board_qna_pwd;
	}
	public void setBoard_qna_pwd(String board_qna_pwd) {
		this.board_qna_pwd = board_qna_pwd;
	}
	public int getBoard_qna_num() {
		return board_qna_num;
	}
	public void setBoard_qna_num(int board_qna_num) {
		this.board_qna_num = board_qna_num;
	}
	public String getBoard_qna_subject() {
		return board_qna_subject;
	}
	public void setBoard_qna_subject(String board_qna_subject) {
		this.board_qna_subject = board_qna_subject;
	}
	public String getBoard_qna_content() {
		return board_qna_content;
	}
	public void setBoard_qna_content(String board_qna_content) {
		this.board_qna_content = board_qna_content;
	}
	public String getBoard_qna_img() {
		return board_qna_img;
	}
	public void setBoard_qna_img(String board_qna_img) {
		this.board_qna_img = board_qna_img;
	}
	public String getBoard_qna_writer() {
		return board_qna_writer;
	}
	public void setBoard_qna_writer(String board_qna_writer) {
		this.board_qna_writer = board_qna_writer;
	}
	public int getBoard_qna_ref() {
		return board_qna_ref;
	}
	public void setBoard_qna_ref(int board_qna_ref) {
		this.board_qna_ref = board_qna_ref;
	}
	public int getBoard_qna_lev() {
		return board_qna_lev;
	}
	public void setBoard_qna_lev(int board_qna_lev) {
		this.board_qna_lev = board_qna_lev;
	}
	public int getBoard_qna_seq() {
		return board_qna_seq;
	}
	public void setBoard_qna_seq(int board_qna_seq) {
		this.board_qna_seq = board_qna_seq;
	}
	public String getBoard_qna_date() {
		return board_qna_date;
	}
	public void setBoard_qna_date(String board_qna_date) {
		this.board_qna_date = board_qna_date;
	}
	

	
}
