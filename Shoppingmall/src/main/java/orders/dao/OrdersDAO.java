package orders.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import orders.bean.OrdersDTO;

@Repository
public class OrdersDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 구매, 주문하기
	public int insertOrders(OrdersDTO ordersDTO) {
		return sqlSession.insert("mybatis.orders.insertOrders", ordersDTO);
	}
	
	/* 		구매, 주문 리스트		 */
	// 주문번호로 [주문내역] 검색하기
	public OrdersDTO getByOrder_num(int order_num) {
		return sqlSession.selectOne("mybatis.orders.getByOrder_num", order_num);
	}
	// 아이디로 [주문내역] 검색하기
	public OrdersDTO getById(String id) {
		return sqlSession.selectOne("mybatis.orders.getById", id);
	}
	
	// 구매 [주문내역] 리스트
	public List<OrdersDTO> OrdersList(int startNum, int endNum ) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);	
		return sqlSession.selectList("mybatis.orders.OrdersList", map);
	}
	
	// 구매, 주문내역 총 갯수
	public int getOrdersTotalA() {
		return sqlSession.selectOne("mybatis.orders.getOrdersTotalA");
	}
	// 가장 최근 구매 내역 확인
	
	
}
