package net.koreate.reserve.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.koreate.common.utils.ReserveCriteria;
import net.koreate.reserve.dao.AreaDAO;
import net.koreate.reserve.dao.ReserveDAO;
import net.koreate.reserve.vo.CarVO;
import net.koreate.reserve.vo.ReserveVO;

@Service
public class AreaService {

	@Resource(name="areaDAO")
	AreaDAO ad;
	
	@Resource(name="reserveDAO")
	ReserveDAO rd;
	
	public List<ReserveVO> siList(ReserveCriteria cri) throws Exception{
		return ad.siList(cri);
	}

	public List<ReserveVO> guList(String nsi) throws Exception{
		return ad.guList(nsi);
	}

	public List<CarVO> carList() throws Exception{
		return ad.carList();
	}

	public List<CarVO> truckList(String truck) throws Exception{
		return ad.truckList(truck);
	}

	public List<CarVO> busList(String carType) throws Exception{
		return ad.busList(carType);
	}

	public List<ReserveVO> guGunList(String ngu) throws Exception{
		return ad.guGunList(ngu);
	}


}
