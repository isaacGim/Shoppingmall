package item.controller;

import java.util.List;

import item.bean.ItemDTO;

public interface ItemService {
	// 상품 추가
	public int insertItem(ItemDTO itemDTO);
	// 상품 수정
	public int updateItem(ItemDTO itemDTO, String old_item_code);
	// 상품 삭제
	public int deleteItem(String item_code);
	// 상품 보기
	public ItemDTO getItem(String item_name);
	// 상품 보기 카테고리 (대분류)
	public List<ItemDTO> getItemsByCategory(String item_category);
	// 상품 보기 카테고리 (소분류)
	public List<ItemDTO> getItemsByDetailCategory(String item_category, String item_detail_category);
	// item_category 기준으로 item_index 값 불러오기
	public List<Integer> getItemsIndex(String item_category);
	// item_code 추출
	public String getItem_code(int item_index);
	// item_index를 기준으로 count 얻기
	public int getItemIndexCount(int item_index);
	// best_item 불러오기
	public List<String> getBestItems();
	// 세부 항목 best_item 불러오기
	public List<String> getDetailedBestItems(String item_category);
	// item_category 가져오기
	public List<String> getCategories();
	// item 갯수 가져오기
	public int getTotalItem();
}
