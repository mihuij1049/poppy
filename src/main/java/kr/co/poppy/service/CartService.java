package kr.co.poppy.service;

import java.util.List;

import kr.co.poppy.model.Cart;

public interface CartService {
	/**
	 * 장바구니 데이터 상세 조회
	 * 
	 * @param Cart 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회할 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Cart getCartItem(Cart input) throws Exception;

	/**
	 * 장바구니 데이터 목록 조회
	 * 
	 * @param Cart 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Cart> getCartList(Cart input) throws Exception;

	/**
	 * 장바구니 데이터가 저장되어있는 개수 조회
	 * 
	 * @param Cart 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getCartCount(Cart input) throws Exception;

	/**
	 * 장바구니 데이터 수정하기
	 * 
	 * @param Cart 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editCart(Cart input) throws Exception;

	/**
	 * 장바구니 데이터 삭제하기
	 * 
	 * @param Cart 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteCart(Cart input) throws Exception;
}
