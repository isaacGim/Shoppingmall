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

}
