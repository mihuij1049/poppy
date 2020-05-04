package kr.co.poppy.service;

import java.util.List;

import kr.co.poppy.model.Address;
import kr.co.poppy.model.Orders;


public interface AddressService {
	/**
	 * 주소 데이터 상세 조회
	 * @param Address 조회할 주소의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public  Address getAddressItem(Address input) throws Exception;

	/**
	 * 주소 데이터 목록 조회
	 * @param Address 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public  List<Address> getAddressList(Address input) throws Exception;
	
	/**
	 * 주소 데이터가 저장되어 있는 갯수 조회
	 * @param Address 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getAddressCount(Address input) throws Exception;
	
	/**
	 * 주소 데이터 등록하기
	 * @param Address 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addAddress(Address input) throws Exception;
	
	/**
	 * 주소 데이터 수정하기
	 * @param Address 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editAddress(Address input) throws Exception;
	
	/**
	 * 주소 데이터 삭제하기
	 * @param Address 삭제할 주소의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteAddress(Address input) throws Exception;
	
	/**
	 * 주소 데이터 주문번호로 상세 조회
	 * @param Orders  조회할 주소의 주문번호를 담고 있는 Beans (서브쿼리 요청 변수)
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public  Address getAddressItem(Orders input) throws Exception;
	
}
