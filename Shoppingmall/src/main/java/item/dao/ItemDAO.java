package item.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import item.bean.ItemDTO;

@Repository
public class ItemDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 상품 추가
	public int insert(ItemDTO itemDTO) {
		return sqlSession.insert("mybatis.item.insertItem", itemDTO);
	}
	// 상품 수정
	public int updateItem(ItemDTO itemDTO, String old_item_code) {
		Map<String, Object> map = new HashMap<>();
		map.put("itemDTO", itemDTO);
		map.put("old_item_code", old_item_code);
		return sqlSession.update("mybatis.item.updateItem", map);
	}
	// 상품 삭제
	public int deleteItem(String item_code) {
		return sqlSession.delete("mybatis.item.deleteItem", item_code);
	}
	
	// 상품 인덱스로 삭제
	public int deleteItemByIndex(int item_index) {
		return sqlSession.delete("mybatis.item.deleteItemByIndex", item_index);
	}
	
	// 상품 보기 (상세보기)
	public ItemDTO getItem(String item_name) {
		return sqlSession.selectOne("mybatis.item.getItem", item_name); 
	}
	// 상품 보기 카테고리 (대분류)
	public List<ItemDTO> getItemsByCategory(String item_category) {
		return sqlSession.selectList("mybatis.item.getItemsByCategory", item_category);
	}
	// 상품 보기 카테고리 (소분류)
	public List<ItemDTO> getItemsByDetailCategory(String item_category, String item_detail_category) {
		Map<String, String> map = new HashMap<>();
		map.put("item_category", item_category);
		map.put("item_detail_category", item_detail_category);
		return sqlSession.selectList("mybatis.item.getItemsByDetailCategory", map);
	}
	// 상품 전체 보기
	public List<ItemDTO> getItemList() {
		return sqlSession.selectList("mybatis.item.getItemList");
	}
	
	// 관리자 페이지 리스트
	public List<ItemDTO> getAdminItemsList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.item.getAdminItemsList", map);
	}
	
	// 상품 전체 객수
	public int getItemsCount() {
		return sqlSession.selectOne("mybatis.item.getItemsCount");
	}
	/** Best Item 관련 메소드 */
	// item_category 기준으로 item_index 값 불러오기
	public List<Integer> getItemsIndex(String item_category) {
		return sqlSession.selectOne("mybatis.item.getItemsIndex", item_category);
	}
	// item_index를 담은 item_code를 추출
	public String getItem_code(int item_index) {
		return sqlSession.selectOne("mybatis.item.getItem_code", item_index);
	}
	// item_index를 기준으로 count 얻기
	public int getItemIndexCount(int item_index) {
		return sqlSession.selectOne("mybatis.item.getItemIndexCount", item_index);
	}
	// item_category 가져오기
	public List<String> getCategories() {
		return sqlSession.selectList("mybatis.item.getCategories");
	}
	// item 갯수 가져오기
	public int getTotalItem() {
		return sqlSession.selectOne("mybatis.item.getTotalItem");
	}
	// 아이템 인덱스, 사이즈 칼러 상품코드로 알아내기
	public int getItemIndex(String item_code, String item_color, String item_size) {
		Map<String, String> map = new HashMap<>();
		map.put("item_code", item_code);
		map.put("item_color", item_color);
		map.put("item_size", item_size);
		return sqlSession.selectOne("mybatis.item.getItemIndex", map);
	}

	// 아이템 가격 알아보기
	public ItemDTO getItemByIndex(int item_index) {
		return sqlSession.selectOne("mybatis.item.getItem", item_index);
	}
	
	// 아이템 리스트 가져오기 메인으로
	public List<ItemDTO> getItemsToMain() {
		return sqlSession.selectList("mybatis.item.getItemsToMain");
	}
}
