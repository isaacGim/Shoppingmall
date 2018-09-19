package order_list.bean;

public class Order_listDTO {
	private int order_list_num;			// 주문항목번호 primary key, sql
	private int order_list_quantity;	// 수량
	private int order_list_price;		// 가격
	private int item_index;				// 상품코드 F(item)
	private int order_num;				// 주문번호 F(orders)
	
	public int getOrder_list_num() {
		return order_list_num;
	}
	public void setOrder_list_num(int order_list_num) {
		this.order_list_num = order_list_num;
	}
	public int getOrder_list_quantity() {
		return order_list_quantity;
	}
	public void setOrder_list_quantity(int order_list_quantity) {
		this.order_list_quantity = order_list_quantity;
	}
	public int getOrder_list_price() {
		return order_list_price;
	}
	public void setOrder_list_price(int order_list_price) {
		this.order_list_price = order_list_price;
	}
	public int getItem_index() {
		return item_index;
	}
	public void setItem_index(int item_index) {
		this.item_index = item_index;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
}
