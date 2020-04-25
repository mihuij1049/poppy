package kr.co.poppy.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.Address;
import kr.co.poppy.model.Orderdetail;
import kr.co.poppy.service.OrderdetailService;
import lombok.extern.slf4j.Slf4j;

/** 주문상세 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Service
@Slf4j
public class OrderdetailServiceImpl implements OrderdetailService {
	
	/** MyBatis */
	@Autowired
	SqlSession sqlSession;

	/**
	 * 주문상세 데이터 상세 조회
	 * 
	 * @param Orderdetail 조회할 주문상세의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Orderdetail getOrderdetailItem(Orderdetail input) throws Exception {
		Orderdetail result = null;

		try {
			result = sqlSession.selectOne("OrderdetailMapper.selectItem", input);

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
	 * 주문상세 데이터 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Orderdetail> getOrderdetailList(Orderdetail input) throws Exception {
		List<Orderdetail> result = null;

		try {
			result = sqlSession.selectList("OrderdetailMapper.selectList", input);

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
	 * 주문상세 데이터가 저장되어 있는 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getOrderdetailCount(Orderdetail input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("OrderdetailMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 주문상세 데이터 등록하기
	 * 
	 * @param Orderdetail 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int addOrderdetail(Orderdetail input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("OrderdetailMapper.insertItem", input);

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

	
	@Override
	public int editOrderdetail(Orderdetail input) throws Exception {
		return 0;
	}

	/**
	 * 주문상세 데이터 삭제하기
	 * 
	 * @param Orderdetail 삭제할 주문상세의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteOrderdetail(Orderdetail input) throws Exception {
		int result = 0;

		try {
			// 주문상세 삭제 전 자신을 참조하는 주문의 orderno 컬럼을 null 로 수정
			sqlSession.update("OrdersMapper.unsetOrderdetail", input);

			result = sqlSession.delete("OrderdetailMapper.deleteItem", input);

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
