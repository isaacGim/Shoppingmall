package orders.bean;
// 구매(주문)
public class OrdersDTO {
	private int order_num; 			// 주문번호
	private String order_date; 		// 주문 날짜
	private String id; 				// 고객 아이디	
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
