package kr.co.poppy.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.Address;
import kr.co.poppy.model.Orders;
import kr.co.poppy.service.AddressService;
import lombok.extern.slf4j.Slf4j;

/** 주소 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Service
@Slf4j
public class AddressServiceImpl implements AddressService {

	/** MyBatis */
	@Autowired
	SqlSession sqlSession;

	/**
	 * 주소 데이터 상세 조회
	 * 
	 * @param Address 조회할 주소의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Address getAddressItem(Address input) throws Exception {
		Address result = null;

		try {
			result = sqlSession.selectOne("AddressMapper.selectItem", input);

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
	 * 주소 데이터 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Address> getAddressList(Address input) throws Exception {
		List<Address> result = null;

		try {
			result = sqlSession.selectList("AddressMapper.selectList", input);

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
	 * 주소 데이터가 저장되어 있는 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getAddressCount(Address input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("AddressMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 주소 데이터 등록하기
	 * 
	 * @param Address 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int addAddress(Address input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("AddressMapper.insertItem", input);

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
	 * 주소 데이터 수정하기
	 * 
	 * @param Address 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int editAddress(Address input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("AddressMapper.updateItem", input);

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
	 * 주소 데이터 삭제하기
	 * 
	 * @param Address 삭제할 교수의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteAddress(Address input) throws Exception {
		int result = 0;

		try {
			// 주소 삭제 전 자신을 참조하는 회원들의 memno 컬럼을 null 로 수정
			sqlSession.update("MembersMapper.unsetAddress", input);

			result = sqlSession.delete("AddressMapper.deleteItem", input);

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
	
	/**
	 * 주소 데이터 주문번호로 상세 조회
	 * @param Orders  조회할 주소의 주문번호를 담고 있는 Beans (서브쿼리 요청 변수)
	 * @return 조회된 데이터가 저장된 Beans
	 */
	@Override
	public Address getAddressItem(Orders input) throws Exception {
		Address result = null;

		try {
			result = sqlSession.selectOne("AddressMapper.get_addr_item", input);

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
