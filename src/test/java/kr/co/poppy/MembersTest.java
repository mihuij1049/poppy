package kr.co.poppy;

import java.util.Calendar;

import org.apache.ibatis.session.SqlSession;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.poppy.model.Members;

/** JUnit에 의한 테스트 클래스로 정의 */
// import org.junit.runner.RunWith;
// import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
/** Spring 의 설정 파일들을 읽어들이도록 설정 (**은 `모든` 이라는 의미) */
// import org.springframework.test.context.ContextConfiguration;
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
/** 웹 어플리케이션임을 명시 */
// import org.springframework.test.context.web.WebAppConfiguration;
@WebAppConfiguration
/** 메서드 이름 순서로 실행하도록 설정 (설정하지 않을 경우 무작위 순서로 실행됨) */
// import org.junit.FixmethodOrder;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class MembersTest {
	/** MyBatis의 SQL세션 주입 설정 */
	// import org.springframework.beans.factory.annotation.Autowired;
	@Autowired
	private SqlSession sqlSession;
	
	Calendar c = Calendar.getInstance();
	String date = String.format("%04d-%02d-%02d %02d:%02d:%02d", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1,
			c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE), c.get(Calendar.SECOND));
	
	/** 회원 가입 테스트 */
	@Test
	public void testA() {
		Members input = new Members();
		input.setUserid("jwims");
		input.setUserpw("12345");
		input.setUsername("허임스");
		input.setUserphone("010-1122-3535");
		input.setUseremail("test@ezen.co.kr");
		input.setRegdate(date);
		input.setEditdate(date);
		sqlSession.insert("MembersMapper.add_members", input);
	}
	
	/** 회원 정보 상세 조회 */
	@Test
	public void testB() {
		Members input = new Members();
		input.setMemno(1);
		sqlSession.selectOne("MembersMapper.select_item", input);
	}
	
	/** 회원 정보 수정 */
	@Test
	public void testC() {
		Members input = new Members();
		input.setMemno(1);
		input.setUserphone("010-2211-5353");
		input.setUseremail("testagain@ezen.co.kr");
		input.setEditdate(date);
		sqlSession.update("MembersMapper.edit_members", input);
	}
	
	/** 회원 탈퇴 */
	@Test
	public void testD() {
		Members input = new Members();
		input.setMemno(2);
		// 회원에 참조된 약관동의서 폐기 
		sqlSession.delete("AgreeMapper.deleteItem", input);
		// 회원이 주문한 주문내역에 주소지 참조 해제
		sqlSession.update("OrdersMapper.unsetAddress", input);
		// 회원이 주문한 주문내역 참조 해제
		sqlSession.update("OrdersMapper.unsetMembers", input);
		// 회원에 참조된 주소록 폐기
		sqlSession.delete("AddressMapper.delete_members_item", input);
		// 회원이 작성한 게시글 참조해제
		sqlSession.update("BbsMapper.unsetMembers", input);
		// 회원이 작성한 댓글 삭제
		sqlSession.delete("CommentsMapper.delete_members_item", input);
		// 회원이 보유한 적립금 참조 해제
		sqlSession.update("PointsMapper.unsetMembers", input);
		// 회원의 상품 좋아요 목록 참조 해제
		sqlSession.update("HeartMapper.unsetMembers", input);
		// 회원의 포토리뷰 좋아요 목록 참조 해제
		sqlSession.update("RvheartMapper.unsetMembers", input);
		// 회원이 보유한 장바구니 내역 삭제
		sqlSession.delete("CartMapper.delete_members_item", input);
		// 회원 탈퇴에 의한 회원정보 삭제
		sqlSession.delete("MembersMapper.delete_members", input);
	}
	
}
