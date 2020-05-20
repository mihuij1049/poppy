package kr.co.poppy.service;

import java.util.List;

import kr.co.poppy.model.Bbs;

public interface BbsService {

	public Bbs getBbsItem(Bbs input) throws Exception;
	
	public Bbs getBbsrv_Item(Bbs input) throws Exception;
	
	/**
	 * QNA 글목록
	 * @param Imgs 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Bbs> getBbsList(Bbs input) throws Exception;
	
	/**
	 * 공지사항 상세보기
	 * @param Imgs 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public Bbs getNoticeItem(Bbs input) throws Exception;
	
	/**
	 * 상품상세페이지 / 포토리뷰 글 목록
	 * @param Bbs 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Bbs> getBbsList_goods(Bbs input) throws Exception;
	
	/**
	 * 후기관리 글 목록
	 * @param Bbs 검색조건(memno)과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Bbs> getBbsList_myrv(Bbs input) throws Exception;
	
	public List<Bbs> getBbsList_myrv2(Bbs input) throws Exception;
	/**
	 * 게시글 데이터가 저장되어 있는 갯수 조회
	 * @param Bbs 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getBbsCount(Bbs input) throws Exception;
	
	/**
	 * 게시글 데이터 등록하기
	 * @param Bbs 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addBbs(Bbs input) throws Exception;
	
	/**
	 * 게시글 데이터 수정하기
	 * @param Bbs 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editBbs(Bbs input) throws Exception;
	
	/**
	 * 게시글 데이터 삭제하기
	 * @param Bbs 삭제할 주소의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteBbs(Bbs input) throws Exception;
	
	
}
