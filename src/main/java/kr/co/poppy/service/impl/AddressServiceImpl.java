package kr.co.poppy.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.Address;
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

	@Override
	public int getAddressCount(Address input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addAddress(Address input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editAddress(Address input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAddress(Address input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
