package kr.co.poppy.service;

import java.util.List;

import kr.co.poppy.model.Orderdetail;
import kr.co.poppy.model.Orders;

public interface OrderdetailService {
	/**
	 * 상세주문 데이터 상세 조회
	 * @param Orderdetail 조회할 주문의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public  Orderdetail getOrderdetailItem(Orderdetail input) throws Exception;

	/**
	 * 상세주문 데이터 목록 조회
	 * @param Orderdetail 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public  List<Orderdetail> getOrderdetailList(Orderdetail input) throws Exception;
	
	/**
	 * 상세주문 데이터가 저장되어 있는 갯수 조회
	 * @param Orderdetail 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getOrderdetailCount(Orderdetail input) throws Exception;
	
	/**
	 * 주문 데이터 등록하기
	 * @param Orderdetail 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addOrderdetail(Orderdetail input) throws Exception;
	
	/**
	 * 상세주문 데이터 수정하기
	 * @param Orderdetail 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editOrderdetail(Orderdetail input) throws Exception;
	
	/**
	 * 상세주문 데이터 삭제하기
	 * @param Orderdetail 삭제할 상세주문의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteOrderdetail(Orderdetail input) throws Exception;


}
