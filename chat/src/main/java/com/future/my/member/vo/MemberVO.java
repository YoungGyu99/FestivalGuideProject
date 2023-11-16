package com.future.my.member.vo;

public class MemberVO {
	
	private String memId;
	private String memPw;
	private String memNm;


	public MemberVO(String memId, String memPw, String memNm) {
		this.memId = memId;
		this.memPw = memPw;
		this.memNm = memNm;
	}
	public MemberVO() {
	}
	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memNm=" + memNm + "]";
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	
	
	
}
