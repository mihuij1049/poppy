package kr.co.poppy.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.Bbs;
import kr.co.poppy.service.BbsService;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BbsServiceImpl implements BbsService {
	/** MyBatis */
	@Autowired
	SqlSession sqlSession;


	/**
	 * 공지사항 게시글 조회
	 * @param Bbs 게시글의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans throws Exception
	 */	
	@Override
	public Bbs getBbsItem(Bbs input) throws Exception {
		Bbs result = null;
		try {
			result = sqlSession.selectOne("BbsMapper.selectItem", input);
			if(result==null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다. selectItem");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 포토리뷰 게시글 조회
	 * @param Bbs 게시글의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans throws Exception
	 */	
	@Override
	public Bbs getBbsrv_Item(Bbs input) throws Exception {
		Bbs result = null;
		try {
			result = sqlSession.selectOne("BbsMapper.selectrv_Item", input);
			if(result==null) {
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
	 * 공지사항 / QNA/포토리뷰 게시글 목록
	 * @param Bbs 게시글의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans throws Exception
	 */	
	@Override
	public List<Bbs> getBbsList(Bbs input) throws Exception {
		List<Bbs> result = null;
		try {
			result = sqlSession.selectList("BbsMapper.selectList", input);
			if(result==null) {
				throw new NullPointerException("result=null");
			} 
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다. selectList");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 상품상세페이지 /포토리뷰 게시글 목록
	 * @param Bbs 게시글의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans throws Exception
	 */	
	@Override
	public List<Bbs> getBbsList_goods(Bbs input) throws Exception {
		List<Bbs> result = null;
		try {
			result = sqlSession.selectList("BbsMapper.selectList_goods", input);
			if(result==null) {
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
	 * 후기관리 글 목록
	 * @param Bbs 검색조건(memno)과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Bbs> getBbsList_myrv(Bbs input) throws Exception {
		List<Bbs> result = null;
		try {
			result = sqlSession.selectList("BbsMapper.selectList_myrv", input);
			if(result==null) {
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
	 * 게시글 갯수 조회
	 * @return	int
	 * @throws 	Exception
	 */
	@Override
	public int getBbsCount(Bbs input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("BbsMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/** 
	 * 게시글 등록하기
	 * @param	Bbs 저장할 정보를 담고 있는 Beans
	 * @throws	Exception	 
	 * */
	@Override
	public int addBbs(Bbs input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.insert("BbsMapper.insertItem", input);
			if(result==0) {
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

	/** 게시글 수정하기 
	 * @param	Bbs 수정할 정보를 담고 있는 Beans 
	 * @throw	Exception
	 */
	@Override
	public int editBbs(Bbs input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.update("BbsMapper.updateItem", input);
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
	 * 게시글 삭제하기
	 * @param	삭제할 게세글의 일련번호를 담고 있는 Beans
	 * @throws 	Exception
	 */
	@Override
	public int deleteBbs(Bbs input) throws Exception {
		int result = 0;
		try {
			// 게시글 삭제 전 bbs를 참조하는 rvheart, imgs, comments 삭제 */
			sqlSession.delete("RvheartMapper.delete_bbs_item", input);
			sqlSession.delete("CommentsMapper.delete_bbs_item", input);
			
			result = sqlSession.delete("BbsMapper.deleteItem", input);
			
			if(result==0) {
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
	public Bbs getNoticeItem(Bbs input) throws Exception {
		Bbs result = null;
		try {
			result = sqlSession.selectOne("BbsMapper.selectnoticeItem", input);
			if(result==null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다. noticeitem");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

}
