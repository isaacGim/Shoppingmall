package item.bean;

public class ItemDTO {
	private int item_index;			// 상품 인덱스
	private String item_code;		// 상품코드   상품번호 primary key 
	private String item_category;	// 상품분류
	private String item_detail_category;	// 상품상세분류
	private String item_name;		// 상품명
	private String item_img;		// 상품 이미지
	private String item_detail_img; // 상품 상세 이미지
	private String item_content;	// 상품 설명
	private String item_brand;		// 브랜드명
	private int item_price;			// 가격
	private int item_quantity;		// 재고량 (수량)
	private String item_color;		// color
	private String item_size;		// size
	private String item_date;		// 등록일
	
	public String getItem_detail_img() {
		return item_detail_img;
	}
	public void setItem_detail_img(String item_detail_img) {
		this.item_detail_img = item_detail_img;
	}
	public int getItem_index() {
		return item_index;
	}
	public void setItem_index(int item_index) {
		this.item_index = item_index;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getItem_category() {
		return item_category;
	}
	public void setItem_category(String item_category) {
		this.item_category = item_category;
	}
	public String getItem_detail_category() {
		return item_detail_category;
	}
	public void setItem_detail_category(String item_detail_category) {
		this.item_detail_category = item_detail_category;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_img() {
		return item_img;
	}
	public void setItem_img(String item_img) {
		this.item_img = item_img;
	}
	public String getItem_content() {
		return item_content;
	}
	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}
	public String getItem_brand() {
		return item_brand;
	}
	public void setItem_brand(String item_brand) {
		this.item_brand = item_brand;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getItem_quantity() {
		return item_quantity;
	}
	public void setItem_quantity(int item_quantity) {
		this.item_quantity = item_quantity;
	}
	public String getItem_color() {
		return item_color;
	}
	public void setItem_color(String item_color) {
		this.item_color = item_color;
	}
	public String getItem_size() {
		return item_size;
	}
	public void setItem_size(String item_size) {
		this.item_size = item_size;
	}
	public String getItem_date() {
		return item_date;
	}
	public void setItem_date(String item_date) {
		this.item_date = item_date;
	}
	
	
}
