package kr.co.poppy.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.Address;
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

	
	/**
	 * 주문 데이터 상세 조회
	 * 
	 * @param Orders 조회할 주문의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Orders getOrdersItem(Orders input) throws Exception {
		Orders result = null;

		try {
			result = sqlSession.selectOne("OrdersMapper.selectItem", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 주문 데이터 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Orders> getOrdersList(Orders input) throws Exception {
		List<Orders> result = null;

		try {
			result = sqlSession.selectList("OrdersMapper.selectList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 주문 데이터가 저장되어 있는 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getOrdersCount(Orders input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("OrdersMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 주문 데이터 등록하기
	 * 
	 * @param Orders 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int addOrders(Orders input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("OrdersMapper.insertItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;
	}

	/**
	 * 주문 데이터 수정하기
	 * 
	 * @param Orders 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int editOrders(Orders input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("OrdersMapper.updateItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 주문 데이터 삭제하기
	 * 
	 * @param Address 삭제할 주문의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteOrders(Orders input) throws Exception {
		int result = 0;

		try {
			// 주문 삭제 전 자신을 참조하는 회원들의 memno 컬럼을 null 로 수정
			sqlSession.update("MembersMapper.unsetOrders", input);

			result = sqlSession.delete("OrdersMapper.deleteItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}

		return result;
	}

}
