package notice.bean;

public class NoticeDTO {
	private int notice_num;			// 게시물 번호 seq
	private String notice_subject;	// 게시물 제목
	private String notice_content;	// 게시물 내용
	private String notice_writer;	// 작성자
	private int notice_hit;			// 조회수 hit
	private String notice_date;		// 작성일
	private int next_notice_seq;
	private int prev_notice_seq;
	private String next_notice_subject;
	private String prev_notice_subject;
	
	
	
	public int getNext_notice_seq() {
		return next_notice_seq;
	}
	public void setNext_notice_seq(int next_notice_seq) {
		this.next_notice_seq = next_notice_seq;
	}
	public int getPrev_notice_seq() {
		return prev_notice_seq;
	}
	public void setPrev_notice_seq(int prev_notice_seq) {
		this.prev_notice_seq = prev_notice_seq;
	}
	public String getNext_notice_subject() {
		return next_notice_subject;
	}
	public void setNext_notice_subject(String next_notice_subject) {
		this.next_notice_subject = next_notice_subject;
	}
	public String getPrev_notice_subject() {
		return prev_notice_subject;
	}
	public void setPrev_notice_subject(String prev_notice_subject) {
		this.prev_notice_subject = prev_notice_subject;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public int getNotice_hit() {
		return notice_hit;
	}
	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	
}
