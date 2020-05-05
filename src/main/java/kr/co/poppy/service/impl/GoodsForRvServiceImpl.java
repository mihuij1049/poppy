package kr.co.poppy.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.GoodsForRv;
import kr.co.poppy.service.GoodsForRvService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GoodsForRvServiceImpl implements GoodsForRvService {
	/** MyBatis */
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 상품 데이터 목록 조회
	 * 
	 * @param Goods 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 */
	public List<GoodsForRv> getGoodsList(GoodsForRv input) throws Exception {
		List<GoodsForRv> result = null;
		try {
			result = sqlSession.selectList("GoodsForRvMapper.selectList", input);
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

}
