package kr.co.poppy.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.Orders;
import kr.co.poppy.model.Points;
import kr.co.poppy.service.PointsService;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PointsServiceImpl implements PointsService {
	/** DB조회를 위한 MyBatis 객체 주입 */
	@Autowired
	SqlSession sqlSession;
	
	/** 구매 시 적립금 생성
	 * @Param 구매한 주문 정보를 담고있는 Beans 객체
	 * @return int
	 */
	@Override
	public int addPoints(Orders input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.insert("PointsMapper.add_points", input);
			if (result==0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;
	}

	/** 주문 정보에 대한 적립금조회
	 * @Param  주문정보(orderno)를 담고 있는 Beans 객체
	 * @return 적립금 정보를 담고 있는 Beans 객체
	 */
	@Override
	public Points getPointsOdItem(Points input) throws Exception {
		Points output = null;
		try {
			output = sqlSession.selectOne("PointsMapper.select_order_item", input);
			if (output == null) {
				throw new NullPointerException("output=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return output;
	}
	
	/** 회원 정보에 대한 적립금조회
	 * @Param 회원정보(memno)를 담고 있는 Beans 객체
	 * @return 적립금 정보를 담고 있는 Beans 객체
	 */
	@Override
	public List<Points> getPointsMbList(Points input) throws Exception {
		List<Points> output = null;
		try {
			output = sqlSession.selectList("PointsMapper.select_members_list", input);
			if (output == null) {
				throw new NullPointerException("output=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return output;
	}
	
	/**
	 * 적립금 데이터가 저장되어 있는 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getPointsCount(Points input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("PointsMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	/** 미가용 -> 가용 적립금 전환
	 * @Param 적립금 일련번호 (pointno) 를 담고 있는 Beans 객체
	 * @return 적립금 정보를 담고 있는 Beans 객체
	 */
	@Override
	public int editPoints(Points input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.update("PointsMapper.edit_points", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int editUsePoints(Points input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.update("PointsMapper.edit__use_points", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}
	
}
