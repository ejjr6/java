package net.koreate.reserve.service;

import java.util.List;

import net.koreate.common.utils.ReserveCriteria;
import net.koreate.reserve.vo.ReserveVO;

public interface ReserveService {
	
	public List<ReserveVO> list(ReserveCriteria cri) throws Exception;
	
	public Object getPageMaker(ReserveCriteria cri) throws Exception;
}
