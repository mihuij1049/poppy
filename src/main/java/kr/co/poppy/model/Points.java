package kr.co.poppy.model;

import lombok.Data;

@Data
public class Points {
	// 적립금 일련번호
	private int pointno;
	// 가용 적립금
	private Integer avpoint;
	// 미가용 적립금
	private Integer napoint;
	// 사용한 적립금
	private Integer usedpoint;
	// 포인트 적립내용
	private String pointtype;
	// 등록일시
	private String regdate;
	// 최종변경일시
	private String editdate;
	// 외부 테이블 참조 
	private int memno;
	private int orderno;
	
    // 페이지 관련 static 변수
	// LIMIT 절에서 사용할 검색 시작 위치
	private static int offset;
	// LIMIT 절에서 사용할 검색할 데이터 수
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Points.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Points.listCount = listCount;
	}
}
