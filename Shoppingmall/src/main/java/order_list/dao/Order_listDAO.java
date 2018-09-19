package order_list.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import order_list.bean.Order_listDTO;

@Repository
public class Order_listDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 주문 항목 추가하기
	public int insertOrder_list(Order_listDTO order_listDTO) {
		return sqlSession.insert("mybatis.order_list.insertOrder_list", order_listDTO);
	}
	// 주문 항목 리스트
	public List<Order_listDTO> getOrder_listList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.order_list.getOrder_listList", map);
	}
	// 주문 항목 상세보기
	public Order_listDTO getOrder_list (int order_list_num) {
		return sqlSession.selectOne("mybatis.order_list.getOrder_list", order_list_num);
	}
	// 주문 항목 총 갯수 가지고 오기
	public int getOrder_listTotalA () {
		return sqlSession.selectOne("mybatis.order_list.getOrder_listTotalA");
	}
}
