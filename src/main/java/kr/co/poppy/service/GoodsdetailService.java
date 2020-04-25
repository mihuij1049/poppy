package kr.co.poppy.service;

import java.util.List;

import kr.co.poppy.model.Goodsdetail;

public interface GoodsdetailService {
	/**
	 * 상품상세 데이터 상세 조회
	 * 
	 * @param Goodsdetaildetail 조회할 상품상세의 일련번호를 담고 있는 Beans
	 * @return 조회할 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Goodsdetail getGoodsdetailItem(Goodsdetail input) throws Exception;

	/**
	 * 상품상세 데이터 목록 조회
	 * 
	 * @param Goodsdetail 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Goodsdetail> getGoodsdetailList(Goodsdetail input) throws Exception;

	/**
	 * 상품상세 데이터가 저장되어있는 개수 조회
	 * 
	 * @param Goodsdetail 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getGoodsdetailCount(Goodsdetail input) throws Exception;

	/**
	 * 상품상세 데이터 수정하기
	 * 
	 * @param Goodsdetail 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editGoodsdetail(Goodsdetail input) throws Exception;

	/**
	 * 상품상세 데이터 삭제하기
	 * 
	 * @param Goodsdetail 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteGoodsdetail(Goodsdetail input) throws Exception;

}
