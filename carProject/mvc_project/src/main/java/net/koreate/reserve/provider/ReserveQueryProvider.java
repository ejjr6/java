package net.koreate.reserve.provider;

import org.apache.ibatis.jdbc.SQL;

import net.koreate.common.utils.ReserveCriteria;

public class ReserveQueryProvider {

	public String searchSelectSql(ReserveCriteria cri) {
		
		SQL sql = new SQL();
		sql.SELECT("*");
		sql.FROM("tbl_reserve AS R NATURAL JOIN tbl_areaGu AS G");
		
		getSearchWhere(cri, sql);
		
		sql.LIMIT(cri.getStartRow()+", "+cri.getPerPageNum());
		
		String query = sql.toString();
		System.out.println(query);
		return query;
	}
	
	public String searchSelectCount(ReserveCriteria cri) {
		return new SQL() {
			{
				SELECT("count(*)");
				FROM("tbl_reserve AS R NATURAL JOIN tbl_areaGu AS G");
				getSearchWhere(cri, this);
			}
		}.toString();
	}
	
	// WHERE 조건 절 
	public void getSearchWhere(ReserveCriteria cri, SQL sql) {
		
		if(cri.getNsi() != null && !cri.getNsi().equals("")
				&&
		   cri.getNgu() != null && !cri.getNgu().equals("")) {
			sql.WHERE("R.nsi = '"+cri.getNsi()+"' AND R.ngu = '"+cri.getNgu()+"'");
			
			getKeyWhere(cri,sql);
			
			
		}else if(cri.getNsi() != null 
					&& 
				!cri.getNsi().equals("")){
			
			sql.WHERE("R.nsi ='"+cri.getNsi()+"'");
			
			getKeyWhere(cri,sql);
			
			
		}else if(cri.getKeyword() != null){
			getKeyWhere(cri,sql);
		}
	}	
	
	// keyword 검색 조건절
	public void getKeyWhere(ReserveCriteria cri, SQL sql) {
		if(cri.getKeyword() != null && !cri.getKeyword().equals("")) {
			sql.WHERE("addr LIKE CONCAT('%','"+cri.getKeyword()+"','%')").OR()
			.WHERE("bname LIKE CONCAT('%','"+cri.getKeyword()+"','%')");
		}
	}
	
}
