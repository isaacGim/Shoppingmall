package order_list.controller;

import java.util.List;

import order_list.bean.Order_listDTO;

public interface Order_listService {
	// 주문 항목 추가하기
	public int insertOrder_list(Order_listDTO order_listDTO);
	// 주문 항목 리스트
	public List<Order_listDTO> getOrder_listList(int startNum, int endNum);
	// 주문 항목 상세보기
	public Order_listDTO getOrder_list (int order_list_num);
	// 주문 항목 총 갯수 가지고 오기
	public int getOrder_listTotalA ();
}
