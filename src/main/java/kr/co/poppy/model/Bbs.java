package kr.co.poppy.model;

import lombok.Data;

@Data
public class Bbs {
	/** 게시글 일련번호 */
	private int bbsno;
	/** 게시글 종류(A:공지사항, B:QnA, C:포토리뷰 */
	private String bbstype;
	/** 제목 */
	private String bbstitle;
	/** 내용 */
	private String bbscontent;
	/** 공개글 여부 (0:false default(공개글), 1: true(비밀글) */
	private int qnasec;
	/** 비밀글일 경우 비밀번호 4자리 */
	private String qnapw;
	/** 좋아요를 받은 횟수(누적) */
	private String rvlike;
	/** 등록일시 */
	private String regdate;
	/** 최종 변경일시 */
	private String editdate;
	/** 회원 일련번호 */
	private int memno;
	/** 상품 일련번호 */
	private int goodsno;
	
	/** Join을 위한 변수 */
	// 회원 이름
	private String username;
	// 회원 아이디
	private String userid;
	// 상품 이름
	private String gname;
	// 이미지 일련번호
	private int imgsno;
	// 이미지 이름
	private String imgname;
	// 이미지 경로
	private String imgpath;
	// 이미지 종류
	private String imgtype;
	// 이미지 확장자
	private String imgext;
	
	/** 게시판 목록에 댓글 갯수를 위한 변수 */
	private int cmtcount;
	
	 // 3) 페이지 구현을 위한 static 변수
    /** LIMIT 절에서 사용할 조회 시작 위치 */
    private static int offset;
    
    /** LIMIT 절에서 사용할 조회할 데이터 수 */
    private static int listCount;
    
    public static int getOffset() {
        return offset;
    }
    
    public static void setOffset(int offset) {
        Bbs.offset = offset;
    }
    
    public static int getListCount() {
        return listCount;
    }
    
    public static void setListCount(int listCount) {
        Bbs.listCount = listCount;
    }
}
