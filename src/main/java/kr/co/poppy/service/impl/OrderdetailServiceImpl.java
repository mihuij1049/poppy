package kr.co.poppy.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.Orderdetail;
import kr.co.poppy.service.OrderdetailService;
import lombok.extern.slf4j.Slf4j;

/** 상세주문 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Service
@Slf4j
public class OrderdetailServiceImpl implements OrderdetailService {
	
	/** MyBatis */
	@Autowired
	SqlSession sqlSession;

	@Override
	public Orderdetail getOrderdetailItem(Orderdetail input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Orderdetail> getOrderdetailList(Orderdetail input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getOrderdetailCount(Orderdetail input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addOrderdetail(Orderdetail input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editOrderdetail(Orderdetail input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOrderdetail(Orderdetail input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
