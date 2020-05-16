package kr.co.poppy.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.Bbs;
import kr.co.poppy.model.Goods;
import kr.co.poppy.service.GoodsService;
import lombok.extern.slf4j.Slf4j;

/** 상품 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Service
@Slf4j
public class GoodsServiceImpl implements GoodsService {
	/** MyBatis */
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 상품 데이터 상세 조회
	 * 
	 * @param Goods 조회할 상품의 일련번호를 담고 있는 Beans
	 * @return 조회할 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Goods getGoodsItem(Goods input) throws Exception {
		Goods result = null;

		try {
			result = sqlSession.selectOne("GoodsMapper.selectItem", input);
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
	 * 상품 데이터 목록(전체상품) 조회
	 * 
	 * @param Goods 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Goods> getGoodsList(Goods input) throws Exception {
		List<Goods> result = null;
		try {
			result = sqlSession.selectList("GoodsMapper.selectListAll", input);
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
	 * 상품 데이터 목록(베스트상품) 조회
	 * 
	 * @param Goods 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Goods> getGoodsListBest(Goods input) throws Exception {
		List<Goods> result = null;
		try {
			result = sqlSession.selectList("GoodsMapper.selectListBest", input);
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
	 * 상품 데이터 목록(신상품) 조회
	 * 
	 * @param Goods 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Goods> getGoodsListNew(Goods input) throws Exception {
		List<Goods> result = null;
		try {
			result = sqlSession.selectList("GoodsMapper.selectListNew", input);
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
	 * 상품 데이터 목록(카테고리별) 조회
	 * 
	 * @param Goods 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Goods> getGoodsListCate(Goods input) throws Exception {
		List<Goods> result = null;
		try {
			result = sqlSession.selectList("GoodsMapper.selectListCate", input);
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
	 * 상품 데이터 목록(카테고리별-셀렉트) 조회
	 * 
	 * @param Goods 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Goods> getGoodsListCateS(Goods input) throws Exception {
		List<Goods> result = null;
		try {
			result = sqlSession.selectList("GoodsMapper.selectListCateS", input);
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
	 * 상품 데이터 목록(카테고리별-2) 조회
	 * 
	 * @param Goods 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Goods> getGoodsListCate2(Goods input) throws Exception {
		List<Goods> result = null;
		try {
			result = sqlSession.selectList("GoodsMapper.selectListCate2", input);
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
	 * 상품 데이터 목록(카테고리별-셀렉트-2) 조회
	 * 
	 * @param Goods 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Goods> getGoodsListCateS2(Goods input) throws Exception {
		List<Goods> result = null;
		try {
			result = sqlSession.selectList("GoodsMapper.selectListCateS2", input);
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
	 * 상품 데이터 목록(검색별) 조회
	 * 
	 * @param Goods 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Goods> getGoodsListSearch(Goods input) throws Exception {
		List<Goods> result = null;
		try {
			result = sqlSession.selectList("GoodsMapper.selectListSearch", input);
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
	 * 상품 데이터가 저장되어있는 개수 조회
	 * 
	 * @param Goods 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getGoodsCount(Goods input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("GoodsMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 상품 데이터 등록하기
	 * @param Goods 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int addGoods(Goods input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("GoodsMapper.insertItem", input);

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
	 * 상품 데이터 수정하기
	 * 
	 * @param Goods 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editGoods(Goods input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("GoodsMapper.updateItem", input);

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
	 * 상품 데이터 삭제하기
	 * 
	 * @param Goods 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteGoods(Goods input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("GoodsMapper.deleteItem", input);

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

	@Override
	public List<Goods> selectqnagoods(Goods input) throws Exception {
		List<Goods> result = null;
		try {
			result = sqlSession.selectList("GoodsMapper.selectqnagoods", input);
			if(result==null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다. g-");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

}
