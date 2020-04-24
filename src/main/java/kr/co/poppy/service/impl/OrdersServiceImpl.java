package kr.co.poppy.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.Orders;
import kr.co.poppy.service.OrdersService;
import lombok.extern.slf4j.Slf4j;

/** 주문 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Service
@Slf4j
public class OrdersServiceImpl implements OrdersService {
	
	/** MyBatis */
	@Autowired
	SqlSession sqlSession;

	@Override
	public Orders getOrdersItem(Orders input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Orders> getOrdersList(Orders input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getOrdersCount(Orders input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addOrders(Orders input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editOrders(Orders input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOrders(Orders input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
