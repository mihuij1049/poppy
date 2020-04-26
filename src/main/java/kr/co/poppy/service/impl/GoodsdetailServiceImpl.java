package kr.co.poppy.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.Goodsdetail;
import kr.co.poppy.service.GoodsdetailService;
import lombok.extern.slf4j.Slf4j;

/** 상품상세 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Service
@Slf4j

public class GoodsdetailServiceImpl implements GoodsdetailService {
	/** MyBatis */
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 상품상세 데이터 상세 조회
	 * 
	 * @param Goodsdetaildetail 조회할 상품상세의 일련번호를 담고 있는 Beans
	 * @return 조회할 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Goodsdetail getGoodsdetailItem(Goodsdetail input) throws Exception {
		Goodsdetail result = null;

		try {
			result = sqlSession.selectOne("GoodsdetailMapper.selectItem", input);
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

	/**
	 * 상품상세 데이터 목록 조회
	 * 
	 * @param Goodsdetail 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Goodsdetail> getGoodsdetailList(Goodsdetail input) throws Exception {
		List<Goodsdetail> result = null;
		try {
			result = sqlSession.selectList("GoodsdetailMapper.selectList", input);
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

	/**
	 * 상품상세 데이터가 저장되어있는 개수 조회
	 * 
	 * @param Goodsdetail 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getGoodsdetailCount(Goodsdetail input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("GoodsdetailMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 상품상세 데이터 등록하기
	 * @param Goodsdetail 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int addGoodsdetail(Goodsdetail input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("GoodsdetailMapper.insertItem", input);

			if (result == 0) {
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
	
	/**
	 * 상품상세 데이터 수정하기
	 * 
	 * @param Goodsdetail 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editGoodsdetail(Goodsdetail input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("GoodsdetailMapper.updateItem", input);

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

	/**
	 * 상품상세 데이터 삭제하기
	 * 
	 * @param Goodsdetail 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteGoodsdetail(Goodsdetail input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("GoodsdetailMapper.deleteItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		} 
		return result;
	}	
}
