package orders.controller;

import java.util.List;

import orders.bean.OrdersDTO;

public interface OrdersService {
	// 구매, 주문하기
	public int insertOrders(OrdersDTO ordersDTO);
	// 주문 번호로 [주문내역] 검색하기
	public OrdersDTO getByOrder_num(int order_num);
	// 아이디로 [주문내역] 검색하기
	public OrdersDTO getById(String id);
	// 구매 [주문내역] 리스트
	public List<OrdersDTO> OrdersList(int startNum, int endNum);
	// 구매, 주문내역 총 갯수 얻기
	public int getOrdersTotalA();
	// 가장 최근 구매 내역 확인
	public OrdersDTO ordersRecent();
}
