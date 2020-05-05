package kr.co.poppy.service;

import java.util.List;

import kr.co.poppy.model.GoodsForRv;

public interface GoodsForRvService {
	
	/**
	 * 상품 데이터 목록 조회
	 * 
	 * @param bbstype과 memno를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<GoodsForRv> getGoodsList(GoodsForRv input) throws Exception;

}
