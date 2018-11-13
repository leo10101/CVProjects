package com.team01.model;

import javax.persistence.*;

@Entity
@Table(name = "facility", schema = "sa46team01cab")
public class Facility {

	@Id
	@Column(name = "FacilityId")
	private Integer facilityId;
	@Column(name = "Location")
	private String location;
	@Column(name = "CapPerSession")
	private Integer capPerSession;
	@Column(name = "FacilityName")
	private String facilityName;
	@Column(name = "FacilityDescription")
	private String facilityDescription;
	public String getFacilityName() {
		return facilityName;
	}
	public void setFacilityName(String facilityName) {
		this.facilityName = facilityName;
	}
	public String getFacilityDescription() {
		return facilityDescription;
	}
	public void setFacilityDescription(String facilityDescription) {
		this.facilityDescription = facilityDescription;
	}

	public Integer getFacilityId() {
		return facilityId;
	}

	public void setFacilityId(Integer facilityId) {
		this.facilityId = facilityId;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Integer getCapPerSession() {
		return capPerSession;
	}

	public void setCapPerSession(Integer capPerSession) {
		this.capPerSession = capPerSession;
	}

}
