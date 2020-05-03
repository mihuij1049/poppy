package kr.co.poppy.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.Imgs;
import kr.co.poppy.service.ImgsService;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ImgsServiceImpl implements ImgsService {
	
	/** MyBatis */
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 이미지 데이터 상세 조회
	 * @param	조회할 이미지의 일련번호를 담고 있는 Beans
	 * @return	조회된 데이터가 저장된 Beans
	 * @throws 	Exception
	 */
	@Override
	public Imgs getImgsItem(Imgs input) throws Exception {
		Imgs result = null;
		try {
			result = sqlSession.selectOne("ImgsMapper.selectItem", input);
			if(result==null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 결과가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	@Override
	public List<Imgs> getImgsList(Imgs input) throws Exception {
		List<Imgs> result = null;

        try {
            result = sqlSession.selectList("ImgsMapper.selectList", input);

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

	/** 이미지 데이터 등록하기
	 * @param	이미지 저장할 정보를 담고 있는 Beans
	 * @throws 	Exception
	 */
	@Override
	public int addImgs(Imgs input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.insert("ImgsMapper.insertItem", input);
			if(result==0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new NullPointerException("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;
	}

	/** 이미지 수정하기 
	 * @param	이미지 수정할 정보를 담고 있는 Beans 
	 * @throw	Exception
	 */
	@Override
	public int editImgs(Imgs input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.update("ImgsMapper.updateItem", input);
			if(result==0) {
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
	 * 이미지 데이터 삭제하기
	 * @param 	삭제할 이미지의 일련번호를 담고 있는 Beans
	 * @throws	Exception
	 */
	@Override
	public int deleteImgs(Imgs input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.delete("ImgsMapper.deleteItem", input);
			if(result==0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new NullPointerException("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return result;
	}

}
