package net.koreate.reserve.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import net.koreate.common.utils.ReserveCriteria;
import net.koreate.reserve.service.AreaService;
import net.koreate.reserve.service.ReserveService;
import net.koreate.reserve.vo.ReserveVO;

@Controller
@RequestMapping("/reservation/*")
public class ReserveController {
	
	@Inject
	AreaService as;
	
	@Inject
	ReserveService rs;
	
	
	@GetMapping("carList")
	public void carList() {}
	
	
	@GetMapping("reserveList")
	public String reserveList(
			ReserveVO vo,
			ReserveCriteria cri,
			Model model
			) throws Exception{
		// list , pm 
		
		
		System.out.println(cri.getKeyword());
		
		model.addAttribute("list",rs.list(cri));
		model.addAttribute("pm",rs.getPageMaker(cri));
		
		model.addAttribute("reserve",vo);
		
		// 시/도 목록 가져오기
		model.addAttribute("areaList", as.siList(cri));
		
		// 구/군 목록 가져오기
		model.addAttribute("aList", as.guGunList(cri.getNgu()));
		
		return "reserveList";
	}
	
}
