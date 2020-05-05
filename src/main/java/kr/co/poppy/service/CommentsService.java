package kr.co.poppy.service;

import java.util.List;

import kr.co.poppy.model.Comments;

public interface CommentsService {
	
	/** 
	 * 댓글 다중행 조회
	 * @param	댓글 검색조건을 담고 있는 Beans
	 * @return	조회결과에 대한 컬렉션
	 * @throws 	Exception
	 */
	public List<Comments> getCommentsList(Comments input) throws Exception;
	
	/**
	 * 댓글 데이터 상세 조회
	 * @param Item 검색조건을 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Comments getCommentsItem(Comments input) throws Exception;
	
	/**
	 * 댓글 데이터 등록하기.
	 * @param Comment 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addComments(Comments input) throws Exception;
	
	/**
	 * 약관동의 데이터 삭제하기
	 * @param Comment 삭제할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteComments(Comments input) throws Exception;
	
	/**
	 * 게시글 데이터가 저장되어 있는 갯수 조회
	 * @param Bbs 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getCommentsCount(Comments input) throws Exception;

}

