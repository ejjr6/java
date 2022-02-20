package net.koreate.reserve.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import net.koreate.common.utils.ReserveCriteria;
import net.koreate.reserve.vo.CarVO;
import net.koreate.reserve.vo.ReserveVO;

public interface AreaDAO {
	
	@Select("SELECT * FROM tbl_areaSi")
	public List<ReserveVO> siList(ReserveCriteria cri)throws Exception;

	@Select("SELECT * FROM tbl_areaGu WHERE nsi = #{nsi}")
	public List<ReserveVO> guList(String nsi)throws Exception;

	@Select("SELECT * FROM tbl_car")
	public List<CarVO> carList()throws Exception;

	@Select("SELECT * FROM tbl_car WHERE carType = #{truck}")
	public List<CarVO> truckList(String truck);

	@Select("SELECT * FROM tbl_car WHERE carType = #{carType}")
	public List<CarVO> busList(String carType);

	@Select("SELECT * FROM tbl_areaGu WHERE ngu = #{ngu}")
	public List<ReserveVO> guGunList(String ngu) throws Exception;

}
