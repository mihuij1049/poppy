package kr.co.poppy.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Cart;
import kr.co.poppy.service.CartService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class KRTRestController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	@Autowired
	CartService cartService;

	/** 장바구니 선택 삭제 */
	@RequestMapping(value="/pay/cart_delete_list", method=RequestMethod.DELETE)
	public Map<String, Object> cart_delete_list(@RequestParam(value="delList[]") List<Integer> delList) {
		/** 1) 요청받은 파라미터가 null 이 아니라면? */

		if (delList != null) {

			// 리스트 객체 생성 및 할당
			List<Cart> cartList = new ArrayList<Cart>();

			// 전달받은 배열을 반복문으로 Cart객체의 cartno에 할당하여
			// Heart 객체를 리스트 객체에 할당
			for (int i = 0; i < delList.size(); i++) {
				Cart temp = new Cart();
				temp.setCartno(delList.get(i));
				cartList.add(temp);
			}
			// MyBatis의 파라미터로 전달할 Map 객체 생성 및 할당
			Map<String, Object> input = new HashMap<String, Object>();
			input.put("input", cartList);

			/** 2) 데이터 삭제하기 */
			try {
			 cartService.delete_list_Cart(input);
			} catch (Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		// 확인할 대상이 삭제된 결과값만 OK로 전달
		return webHelper.getJsonData();
	}

}
