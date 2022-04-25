package com.blap.blapweb.DTO;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
//import org.springframework.web.multipart.MultipartFile;

public class BucketDTO {
	private int bucket_id;
	private Date regdate;
	private int user_id;

	private String bucket_name;
	private Date start_date;
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	private Date goal_date;
	private Date end_date;
	private int need;
	private int preference;
	private int priority;
	
	private String memo;
	private int state;
	
	private String image;
	private int start;
	private int end;
//	private MultipartFile file;
	
	public int getBucket_id() {
		return bucket_id;
	}
	public void setBucket_id(int bucket_id) {
		this.bucket_id = bucket_id;
	}
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public String getBucket_name() {
		return bucket_name;
	}
	public void setBucket_name(String bucket_name) {
		this.bucket_name = bucket_name;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getGoal_date() {
		return goal_date;
	}
	public void setGoal_date(Date goal_date) {
		this.goal_date = goal_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public int getNeed() {
		return need;
	}
	public void setNeed(int need) {
		this.need = need;
	}
	public int getPreference() {
		return preference;
	}
	public void setPreference(int preference) {
		this.preference = preference;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
//	public MultipartFile getFile() {
//		return file;
//	}
//	public void setFile(MultipartFile file) {
//		this.file = file;
//	}
	@Override
	public String toString() {
		return "BucketDTO [bucket_id=" + bucket_id + ", regdate=" + regdate + ", user_id=" + user_id + ", bucket_name="
				+ bucket_name + ", start_date=" + start_date + ", goal_date=" + goal_date + ", end_date=" + end_date
				+ ", need=" + need + ", preference=" + preference + ", priority=" + priority + ", memo=" + memo
				+ ", state=" + state + ", image=" + image + ", start=" + start + ", end=" + end + "]";
	}

	private int total_expenditure;
	
	public int getTotal_expenditure() {
		return total_expenditure;
	}
	public void setTotal_expenditure(int total_expenditure) {
		this.total_expenditure = (int)Math.round(total_expenditure/10000.0);
	}


	
}