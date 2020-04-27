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
	@Test
	public void testB() {
		Members input = new Members();
		input.setMemno(1);
		sqlSession.selectOne("MembersMapper.select_item", input);
	}
	@Test
	public void testC() {
		Members input = new Members();
		input.setMemno(1);
		input.setUserphone("010-2211-5353");
		input.setUseremail("testagain@ezen.co.kr");
		input.setEditdate(date);
		sqlSession.update("MembersMapper.edit_members", input);
	}
	@Test
	public void testD() {
		Members input = new Members();
		input.setMemno(6);
		sqlSession.delete("AgreeMapper.deleteItem", input);
		sqlSession.delete("MembersMapper.delete_members", input);
	}
	
}
