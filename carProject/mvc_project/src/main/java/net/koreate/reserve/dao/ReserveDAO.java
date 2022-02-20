package net.koreate.reserve.dao;

import java.util.List;

import org.apache.ibatis.annotations.SelectProvider;

import net.koreate.common.utils.ReserveCriteria;
import net.koreate.reserve.provider.ReserveQueryProvider;
import net.koreate.reserve.vo.ReserveVO;

public interface ReserveDAO {


	@SelectProvider(type=ReserveQueryProvider.class, method="searchSelectSql")
	public List<ReserveVO> list(ReserveCriteria cri)throws Exception;

	@SelectProvider(type=ReserveQueryProvider.class, method="searchSelectCount")
	public int totalCount(ReserveCriteria cri)throws Exception;

	
}
