package kr.co.poppy.model;

import lombok.Data;

@Data
public class Imgs {
	/** 이미지 일련번호 */
	private int imgsno;
	/** 이미지 이름 */
	private String imgname;
	/** 이미지 확장자 */
	private String imgext;
	/** 이미지 경로 */
	private String imgpath;
	/** 이미지 용량 */
	private int imgsize;
	/** 이미지 타입(A:상품이미지--> bbstype=B, B:광고이미지, C:포토리뷰게시판이미지--> bbstype=C */
	private String imgtype;
	/** 등록일시 */
	private String regdate;
	/** 최종변경일시 */
	private String editdate;
	
	
	/** Join을 위한 변수 */
	// 상품 일련번호
	private int goodsno;
	// 게시글 일련번호
	private int bbsno;
	// 카테고리 타입
	private String cate1;
	

}
