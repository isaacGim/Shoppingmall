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
	// 상품 전체 목록 보기
	public List<ItemDTO> getItemList();
	// 상품 전체 객수
	public int getItemsCount();
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
	// 아이템 인덱스, 사이즈 칼러 상품코드로 알아내기
	public int getItemIndex(String item_code, String item_color, String item_size);
	// 아이템 가격 알아보기
	public ItemDTO getItemByIndex(int item_index);
	// 아이템 리스트 가져오기 메인트로
	public List<ItemDTO> getItemsToMain();
	// 관리자 페이지 리스트
	public List<ItemDTO> getAdminItemsList(int startNum, int endNum);
	// 상품 인덱스로 삭제
	public int deleteItemByIndex(int item_index);
}
