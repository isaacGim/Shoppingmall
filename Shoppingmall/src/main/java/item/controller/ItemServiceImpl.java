package item.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import item.bean.ItemDTO;
import item.dao.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	ItemDAO itemDAO;
	
	@Override	// 상품 추가
	public int insertItem(ItemDTO itemDTO) {
		return itemDAO.insert(itemDTO);
	}

	@Override	// 상품 수정
	public int updateItem(ItemDTO itemDTO, String old_item_code) {
		return itemDAO.updateItem(itemDTO, old_item_code);
	}

	@Override	// 상품 삭제
	public int deleteItem(String item_code) {
		return itemDAO.deleteItem(item_code);
	}
	
	@Override
	public int deleteItemByIndex(int item_index) {
		return itemDAO.deleteItemByIndex(item_index);
	}

	@Override	// 상품 보기 (상세보기)
	public ItemDTO getItem(String item_name) {
		return itemDAO.getItem(item_name);
	}

	@Override	// 상품 보기 카테고리 (대분류)
	public List<ItemDTO> getItemsByCategory(String item_category) {
		return itemDAO.getItemsByCategory(item_category);
	}

	@Override	// 상품 보기 카테고리 (소분류)
	public List<ItemDTO> getItemsByDetailCategory(String item_category, String item_detail_category) {
		return itemDAO.getItemsByDetailCategory(item_category, item_detail_category);
	}
	@Override	// 상품 전체 목록 보기
	public List<ItemDTO> getItemList() {
		return itemDAO.getItemList();
	}
	
	@Override
	public List<ItemDTO> getAdminItemsList(int startNum, int endNum) {
		return itemDAO.getAdminItemsList(startNum, endNum);
	}
	
	@Override
	public int getItemsCount() {
		return itemDAO.getItemsCount();
	}

	
	@Override
	public List<Integer> getItemsIndex(String item_category) {
		return itemDAO.getItemsIndex(item_category);
	}

	@Override
	public String getItem_code(int item_index) {
		return itemDAO.getItem_code(item_index);
	}

	@Override
	public int getItemIndexCount(int item_index) {
		return itemDAO.getItemIndexCount(item_index);
	}

	@Transactional
	@Override
	public List<String> getBestItems() {	
		List<String> category_list = getCategories();
		List<String> total_best_list = new ArrayList<>();
		
		for(String category : category_list) {
			List<String> list = getDetailedBestItems(category);
			total_best_list.addAll(list);
		}
		
		return total_best_list;
	}

	@Transactional
	@Override
	public List<String> getDetailedBestItems(String item_category) {
		// 대분류 카테고리 클릭시 그에 따른 index들 리스트 추출
		List<Integer> item_index_list = getItemsIndex(item_category);
		Map<String, Integer> map = new HashMap<>();
		
		for(;;) {
			// index 리스트가 사이즈가 0이될시 for문 break
			if(item_index_list.size() == 0) break;
			
			// 비교될 item_code를 가져온다.
			String item_code_base = getItem_code(item_index_list.get(0));
			
			// 돌아갈 리스트랑 삭제될 리스트를 따로 돌리게 하기위해서 생성
			List<Integer> clone_list = new ArrayList<>();
			clone_list.addAll(item_index_list);
			// 같은 코드이면 값이 누적되는 변수
			int count = 0;
			
			for(int index : clone_list) {
				String item_code = getItem_code(index);
				
				// 기준이되는 item_code랑 똑같을 시 count에 더해주고 리스트에서 삭제한다.
				if(item_code.equals(item_code_base)) {
					count += getItemIndexCount(index);
					item_index_list.remove(index);
				}
			}
			
			// 끝날 시 키값에는 item_code value값에는 팔린 갯수 
			map.put(item_code_base, count);
		}
		
		//value 값 판 갯수에 따라서 내림차순으로 sorting
		TreeMap<String, Integer> sortedMap = new TreeMap<>(new ValueComparator(map));
		sortedMap.putAll(map);
		
		List<String> result_list = new ArrayList<>();
		
		int count = 0;	
		for(String key : sortedMap.keySet()) {
			count++;
			result_list.add(key);
			if(count >= 5) break;
		}
		
		return result_list;	
	}

	@Override
	public List<String> getCategories() {
		return itemDAO.getCategories();
	}

	@Override
	public int getTotalItem() {
		return itemDAO.getTotalItem();
	}

	@Override
	public int getItemIndex(String item_code, String item_color, String item_size) {
		return itemDAO.getItemIndex(item_code, item_color, item_size);
	}

	@Override
	public ItemDTO getItemByIndex(int item_index) {
		return itemDAO.getItemByIndex(item_index);
	}

	@Override
	public List<ItemDTO> getItemsToMain() {
		return itemDAO.getItemsToMain();
	}
	
}





























