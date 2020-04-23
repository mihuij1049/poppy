package kr.co.poppy.serviceImpl;

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

	@Override
	public Address getAddressItem(Address input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Address> getAddressList(Address input) throws Exception {
		// TODO Auto-generated method stub
		return null;
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