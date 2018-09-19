package orders.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import orders.bean.OrdersDTO;
import orders.dao.OrdersDAO;

@Service
public class OrdersServiceImpl implements OrdersService {
	
	@Autowired
	OrdersDAO ordersDAO;
	
	@Override
	public int insertOrders(OrdersDTO ordersDTO) {
		return ordersDAO.insertOrders(ordersDTO);
	}

	@Override
	public OrdersDTO getByOrder_num(int order_num) {
		return ordersDAO.getByOrder_num(order_num);
	}

	@Override
	public OrdersDTO getById(String id) {
		return ordersDAO.getById(id);
	}

	@Override
	public List<OrdersDTO> OrdersList(int startNum, int endNum) {
		return ordersDAO.OrdersList(startNum, endNum);
	}

	@Override
	public int getOrdersTotalA() {
		return ordersDAO.getOrdersTotalA();
	}

}
