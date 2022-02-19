package net.koreate.branch.vo;

import lombok.Data;

@Data
public class BranchVO {
	
	private int bno;				// 지점 번호(각 지점 고유번호)
	private String bName;			// 지점 이름
	private String bPhone;			// 지점 전화번호
	private String bAddr;			// 지점 주소
	
	
}
