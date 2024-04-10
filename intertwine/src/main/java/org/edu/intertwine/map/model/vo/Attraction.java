package org.edu.intertwine.map.model.vo;

import java.sql.Date;

public class Attraction implements java.io.Serializable{

	private static final long serialVersionUID = 7106792525915830032L;

	private int attractionId;
	private String attractionName;
	private String attractionAddress;
	private float attractionLat;
	private float attractionLon;
	private int attractionPark;
	private String attractionDescription;
	private String attractionInstitutionName;
	private String attractionInstitutionPhone;
	private java.sql.Date attractiondate;
	
	public Attraction() {
		super();
	}

	public Attraction(int attractionId, String attractionName, String attractionAddress, float attractionLat,
			float attractionLon, int attractionPark, String attractionDescription, String attractionInstitutionName,
			String attractionInstitutionPhone, Date attractiondate) {
		super();
		this.attractionId = attractionId;
		this.attractionName = attractionName;
		this.attractionAddress = attractionAddress;
		this.attractionLat = attractionLat;
		this.attractionLon = attractionLon;
		this.attractionPark = attractionPark;
		this.attractionDescription = attractionDescription;
		this.attractionInstitutionName = attractionInstitutionName;
		this.attractionInstitutionPhone = attractionInstitutionPhone;
		this.attractiondate = attractiondate;
	}

	public int getAttractionId() {
		return attractionId;
	}

	public void setAttractionId(int attractionId) {
		this.attractionId = attractionId;
	}

	public String getAttractionName() {
		return attractionName;
	}

	public void setAttractionName(String attractionName) {
		this.attractionName = attractionName;
	}

	public String getAttractionAddress() {
		return attractionAddress;
	}

	public void setAttractionAddress(String attractionAddress) {
		this.attractionAddress = attractionAddress;
	}

	public float getAttractionLat() {
		return attractionLat;
	}

	public void setAttractionLat(float attractionLat) {
		this.attractionLat = attractionLat;
	}

	public float getAttractionLon() {
		return attractionLon;
	}

	public void setAttractionLon(float attractionLon) {
		this.attractionLon = attractionLon;
	}

	public int getAttractionPark() {
		return attractionPark;
	}

	public void setAttractionPark(int attractionPark) {
		this.attractionPark = attractionPark;
	}

	public String getAttractionDescription() {
		return attractionDescription;
	}

	public void setAttractionDescription(String attractionDescription) {
		this.attractionDescription = attractionDescription;
	}

	public String getAttractionInstitutionName() {
		return attractionInstitutionName;
	}

	public void setAttractionInstitutionName(String attractionInstitutionName) {
		this.attractionInstitutionName = attractionInstitutionName;
	}

	public String getAttractionInstitutionPhone() {
		return attractionInstitutionPhone;
	}

	public void setAttractionInstitutionPhone(String attractionInstitutionPhone) {
		this.attractionInstitutionPhone = attractionInstitutionPhone;
	}

	public java.sql.Date getAttractiondate() {
		return attractiondate;
	}

	public void setAttractiondate(java.sql.Date attractiondate) {
		this.attractiondate = attractiondate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Attraction [attractionId=" + attractionId + ", attractionName=" + attractionName
				+ ", attractionAddress=" + attractionAddress + ", attractionLat=" + attractionLat + ", attractionLon="
				+ attractionLon + ", attractionPark=" + attractionPark + ", attractionDescription="
				+ attractionDescription + ", attractionInstitutionName=" + attractionInstitutionName
				+ ", attractionInstitutionPhone=" + attractionInstitutionPhone + ", attractiondate=" + attractiondate
				+ "]";
	}

	

	
	
	
}
