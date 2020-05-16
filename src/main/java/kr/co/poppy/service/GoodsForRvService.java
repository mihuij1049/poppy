package kr.co.poppy.service;

import java.util.List;
import java.util.Map;

import kr.co.poppy.model.GoodsForRv;

public interface GoodsForRvService {
	
	/**
	 * 포토리뷰 작성 상품 데이터 목록 조회
	 * 
	 * @param bbstype과 memno를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<GoodsForRv> getGoodsList(GoodsForRv input) throws Exception;
	
	/**
	 * 관심상품 데이터 목록 조회
	 * 
	 * @param memno를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<GoodsForRv> getGoodsLikeList(GoodsForRv input) throws Exception;
	
	/**
	 * 관심상품 데이터 상세(detail) 목록 조회
	 * 
	 * @param memno를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<GoodsForRv> getGoodsLikeListDetail(GoodsForRv input) throws Exception;
	
	/**
	 * 최근본상품 데이터 목록 조회
	 * 
	 * @param memno를 담고 있는 List<Beans>를 넣은 HashMap
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<GoodsForRv> getRecentList(Map<String, Object> input) throws Exception;

}
