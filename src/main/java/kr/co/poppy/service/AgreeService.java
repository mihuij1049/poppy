package kr.co.poppy.service;

import kr.co.poppy.model.Agree;

public interface AgreeService {
	/**
	 * 약관동의 데이터 등록하기.
	 * @param Agree 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addAgree(Agree input) throws Exception;
	
	/**
	 * 약관동의 데이터 수정하기.
	 * @param Agree 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editAgree(Agree input) throws Exception;
	
	/**
	 * 약관동의 데이터 삭제하기
	 * @param Agree 삭제할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteAgree(Agree input) throws Exception;
	
	/**
	 * 약관동의 데이터 조회하기
	 * @param 동의한 시간(regdate)을 담고 있는 Beans
	 * @return Agree Beans
	 * @throws Exception
	 */
	public Agree getAgreeItem(Agree input) throws Exception;
}
