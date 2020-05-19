
package kr.co.poppy;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.poppy.helper.MailHelper;
import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.RetrofitHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Bbs;
import kr.co.poppy.model.Goods;
import kr.co.poppy.model.Members;
import kr.co.poppy.service.BbsService;
import kr.co.poppy.service.GoodsService;
import kr.co.poppy.service.GoodsdetailService;
import kr.co.poppy.service.ImgsService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	MailHelper mailHelper;
	
	@Autowired
	RetrofitHelper retrofitHelper;
	
	@Autowired GoodsService goodsService;
	@Autowired ImgsService imgsService;
	@Autowired GoodsdetailService goodsdetailService;
	@Autowired BbsService bbsService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = { "/","/index/index.do" }, method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		// 로그인한 유저 값 가져오기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		
		// 2) 데이터 조회
		// 굿즈데이터조회
		Goods input = new Goods();
		Bbs input2 = new Bbs();
				
		// 데이터저장할곳
		List<Goods> output1 = null;
		List<Goods> output2 = null;
		List<Bbs> output3 = null;
				
		try {
			// 데이터조회
			output1 = goodsService.getGoodsListBest(input);
			output2 = goodsService.getGoodsListNew(input);
			output3 = bbsService.getBbsList_myrv(input2);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		for (Goods item : output1) {
			String imgPath = item.getImgpath()+item.getImgname()+"."+item.getImgext();
			item.setImgpath(webHelper.getUploadPath(imgPath));
		}
		
		for (Goods item : output2) {
			String imgPath = item.getImgpath()+item.getImgname()+"."+item.getImgext();
			item.setImgpath(webHelper.getUploadPath(imgPath));
		}
		
		for (Bbs item : output3) {
			String imgPath = item.getImgpath()+item.getImgname()+"."+item.getImgext();
			item.setImgpath(webHelper.getUploadPath(imgPath));
		}
				
		// 3) 뷰처리
		model.addAttribute("output1", output1);
		model.addAttribute("output2", output2);
		model.addAttribute("output3", output3);
		
		return new ModelAndView("index/index");
	}

}
