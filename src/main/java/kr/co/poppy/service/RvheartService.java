package kr.co.poppy.service;

import kr.co.poppy.model.Rvheart;

public interface RvheartService {
	
	/**
	 * 리뷰 좋아요 데이터가 저장되어 있는 갯수 조회
	 * @param Rvheart 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getRvheartCount(Rvheart input) throws Exception;
	
	/**
	 * 리뷰 좋아요 데이터 등록하기.
	 * @param Rvheart 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addRvheart(Rvheart input) throws Exception;
	
	/**
	 * 약관동의 데이터 삭제하기
	 * @param Rvheart 삭제할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteRvheart(Rvheart input) throws Exception;
}
