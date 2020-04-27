package kr.co.poppy.helper;

import lombok.Data;

/** 
 * 업로드 된 파일의 정보를 저장하기 위한 JavaBeans
 * - 이 클래스의 객체가 업로드 된 파일의 수만큼 생성되어 List 형태로 보관된다
 */
@Data
public class UploadItem {
	private String fieldName;
	private String orginName;
	private String filePath;
	private String contentType;
	private long fileSize;
	private String thumbnail;

}
