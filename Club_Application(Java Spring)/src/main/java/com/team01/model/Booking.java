package com.team01.model;


import java.util.Date;


import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "booking" , schema = "sa46team01cab" )
public class Booking {
	@Id	
	@Column(name = "BookingNo")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer bookingNo;
	
	@Column(name = "MemberNo")
	private Integer memberNo;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "BookingDate")
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date bookingDate;

	
	@Column(name = "FacilityId")
	private Integer facilityId;

	public Integer getBookingNo() {
		return bookingNo;
	}
	public void setBookingNo(Integer bookingNo) {
		this.bookingNo = bookingNo;
	}

	@Column(name = "SessionNo")
	private Integer sessionNo;
	
	
	@Column(name = "Status")
	private String status;


	public Date getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}
	public Integer getFacilityId() {
		return facilityId;
	}
	public void setFacilityId(Integer facilityId) {
		this.facilityId = facilityId;
	}
	public Integer getSessionNo() {
		return sessionNo;
	}
	public void setSessionNo(Integer sessionNo) {
		this.sessionNo = sessionNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}
	
	
}
