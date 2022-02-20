package net.koreate.reserve.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.koreate.common.utils.ReserveCriteria;
import net.koreate.common.utils.ReservePageMaker;
import net.koreate.reserve.dao.ReserveDAO;
import net.koreate.reserve.vo.ReserveVO;

@Service
public class ReserveServiceImpl implements ReserveService {

	@Resource(name="reserveDAO")
	ReserveDAO rd;
	
	@Override
	public List<ReserveVO> list(ReserveCriteria cri) throws Exception {
		return rd.list(cri);
	}

	@Override
	public Object getPageMaker(ReserveCriteria cri) throws Exception {
		ReservePageMaker pm = new ReservePageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(rd.totalCount(cri));
		return pm;
	}

}
