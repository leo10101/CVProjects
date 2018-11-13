package com.team01.model;



import javax.persistence.*;


@Entity
@Table(name = "sessions", schema = "sa46team01cab")

public class Sessions  {

	@Id
	@Column(name = "SessionNo")
	private Integer sessionNo;

	@Column(name = "StartTime")	
	private String startTime;

	@Column(name = "EndTime")
	private String endTime;

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public Integer getSessionNo() {
		return sessionNo;
	}

	public void setSessionNo(Integer sessionNo) {
		this.sessionNo = sessionNo;
	}

}
