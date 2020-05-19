package kr.co.poppy.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.Cart;
import kr.co.poppy.service.CartService;
import lombok.extern.slf4j.Slf4j;

/** 장바구니 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Service
@Slf4j
public class CartServiceImpl implements CartService {
	/** MyBatis */
	@Autowired
	SqlSession sqlSession;

	@Override
	public Cart getCartItem(Cart input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 장바구니 데이터 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Cart> getCartList(Cart input) throws Exception {
		List<Cart> result = null;
		try {
			result = sqlSession.selectList("CartMapper.selectList", input);

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
	 * 장바구니 데이터 목록 조회
	 * @Param  담는 상품의 갯수(int), 옵션이 선택된 상품번호 gddetailno, 담는 사람의 정보 memno  
	 * @return int
	 */
	@Override
	public int addCartItem(Cart input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("CartMapper.insertItem", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;
	}

	/**
	 * 장바구니 데이터가 저장되어 있는 개수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getCartCount(Cart input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("CartMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	/**
	 * 장바구니 데이터의 중복저장을 방지하기 위한 단일 개수 조회
	 * 
	 * @param 특정회원 Memno 과 특정 상품 gddetailno 를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getCartItemCount(Cart input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("CartMapper.selectItemCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int editCart(Cart input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 장바구니 데이터 삭제하기
	 *
	 * @param Cart 삭제할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteCart(Cart input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("CartMapper.deleteItem", input);

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
