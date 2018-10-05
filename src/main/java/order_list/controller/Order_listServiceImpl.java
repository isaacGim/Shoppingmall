package order_list.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import order_list.bean.Order_listDTO;
import order_list.dao.Order_listDAO;

@Service
public class Order_listServiceImpl implements Order_listService {

	@Autowired
	Order_listDAO order_listDAO;
	
	@Override
	public int insertOrder_list(Order_listDTO order_listDTO) {
		return order_listDAO.insertOrder_list(order_listDTO);
	}

	@Override
	public List<Order_listDTO> getOrder_listList(int startNum, int endNum) {
		return order_listDAO.getOrder_listList(startNum, endNum);
	}

	@Override
	public Order_listDTO getOrder_list(int order_list_num) {
		return order_listDAO.getOrder_list(order_list_num);
	}

	@Override
	public int getOrder_listTotalA() {
		return order_listDAO.getOrder_listTotalA();
	}

}
