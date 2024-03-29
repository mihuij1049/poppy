package kr.co.poppy.service;

import java.util.List;

import kr.co.poppy.model.Address;
import kr.co.poppy.model.Orders;

public interface OrdersService {
	/**
	 * 주문 데이터 상세 조회
	 * @param Orders 조회할 주문의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public  Orders getOrdersItem(Orders input) throws Exception;
	
	/**
	 * 주문 데이터 목록 조회
	 * @param Orders 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public  List<Orders> getOrdersList(Orders input) throws Exception;

	/**
	 * 주문 취소/교환/반품 데이터 목록 조회
	 * @param Orders 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public  List<Orders> getOrdersList2(Orders input) throws Exception;
	
	/**
	 * 주문 데이터가 저장되어 있는 갯수 조회
	 * @param Orders 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getOrdersCount(Orders input) throws Exception;
	
	/**
	 * 주문 데이터 등록하기
	 * @param Orders 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addOrders(Orders input) throws Exception;
	
	/**
	 * 주문 데이터 수정하기
	 * @param Orders 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editOrders(Orders input) throws Exception;
	
	/**
	 * 주문 데이터 삭제하기
	 * @param Orders 삭제할 주문의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteOrders(Orders input) throws Exception;

}
