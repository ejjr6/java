package net.koreate.branch.vo;

import lombok.Data;

@Data
public class AreaVO {

	private String nsi;			// 시/구 코드번호(임시)
	private String si;			// 시/구
	
	private String ngu;			// 구/군 코드번호(임시)
	private String gu;			// 구/군
}
