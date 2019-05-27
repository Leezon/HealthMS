package com.health.entity;

public class Sleep {
	private int id;
	private int ssleep;
	private int dsleep;
	private int awake;
	private String date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSsleep() {
		return ssleep;
	}
	public void setSsleep(int ssleep) {
		this.ssleep = ssleep;
	}
	public int getDsleep() {
		return dsleep;
	}
	public void setDsleep(int dsleep) {
		this.dsleep = dsleep;
	}
	public int getAwake() {
		return awake;
	}
	public void setAwake(int awake) {
		this.awake = awake;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
