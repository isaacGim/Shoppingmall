package notice.controller;

import java.util.List;

import notice.bean.NoticeDTO;

public interface NoticeService {
	// 글쓰기
	public int insert(NoticeDTO noticeDTO);
	// 글 삭제
	public int delete(int noticeNum);
	// 글 수정
	public int update(NoticeDTO noticeDTO);
	//조회수 증가
	public int updateHit(int notice_num);
	// 글 보기
	public NoticeDTO noticeView(int notice_num);
	// 공지목록보기
	public List<NoticeDTO> noticeList(int startNum, int endNum);
	// 공지사항 총 글 얻기
	public int getNoticeTotalA ();
	
}
