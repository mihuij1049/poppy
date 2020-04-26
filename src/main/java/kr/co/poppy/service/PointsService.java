package kr.co.poppy.service;

import kr.co.poppy.model.Orders;
import kr.co.poppy.model.Points;

public interface PointsService {

	/** 상품 구매시 적립금 발생
	 * 
	 * @Param 적립금이 발생한 orderno
	 * @return int 
	 * @throws Exception
	 */
	public int addPoints(Orders input) throws Exception;
	
	/** 주문의 적립금 정보 조회
	 * @Param 주문정보(orderno)를 담은 Beans 객체
	 * @return 적립금 정보를 담은 Beans 객체
	 * @throws Exception  
	 */
	public Points getPointsOdItem(Points input) throws Exception;
	
	/** 회원의 적립금 정보 조회
	 * @Param 회원정보(memno)를 담은 Beans 객체
	 * @return 적립금 정보를 담은 Beans 객체
	 * @throws Exception  
	 */
	public Points getPointsMbItem(Points input) throws Exception;
	
	/** 미가용 -> 가용으로 적립금 전환
	 * @Param 적립금 일련번호(pointno)를 담고 있는 Beans
	 * @return int
	 * @throws Exception 
	 */
	public int editPoints(Points input) throws Exception;
	
	/** 적립금 사용으로 인한 적립금 소멸
	 * @Param 적립금 일련번호(pointno)를 담고 있는 Beans
	 * @return int
	 * @throws Exception 
	 */
	public int editUsePoints(Points input) throws Exception;
}
