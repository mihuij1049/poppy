package kr.co.poppy.service;

import java.util.List;

import kr.co.poppy.model.Goods;

public interface GoodsService {
	
	/**
	 * 상품 데이터 상세 조회
	 * 
	 * @param Goods 조회할 상품의 일련번호를 담고 있는 Beans
	 * @return 조회할 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Goods getGoodsItem(Goods input) throws Exception;

	/**
	 * 상품 데이터 목록(전체상품) 조회
	 * 
	 * @param Goods 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Goods> getGoodsList(Goods input) throws Exception;
	
	/**
	 * 상품 데이터 목록(신상품) 조회
	 * 
	 * @param Goods 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Goods> getGoodsListNew(Goods input) throws Exception;

	/**
	 * 상품 데이터 목록(카테고리별) 조회
	 * 
	 * @param Goods 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Goods> getGoodsListCate(Goods input) throws Exception;
	
	/**
	 * 상품 데이터 목록(카테고리별-셀렉트) 조회
	 * 
	 * @param Goods 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Goods> getGoodsListCateS(Goods input) throws Exception;
	
	/**
	 * 상품 데이터 목록(검색별) 조회
	 * 
	 * @param Goods 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Goods> getGoodsListSearch(Goods input) throws Exception;
	
	/**
	 * 상품 데이터가 저장되어있는 개수 조회
	 * 
	 * @param Goods 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getGoodsCount(Goods input) throws Exception;
	
	/**
	 * 상품 데이터 등록하기
	 * @param Goods 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int addGoods(Goods input) throws Exception;

	/**
	 * 상품 데이터 수정하기
	 * 
	 * @param Goods 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editGoods(Goods input) throws Exception;

	/**
	 * 상품 데이터 삭제하기
	 * 
	 * @param Goods 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteGoods(Goods input) throws Exception;
}
