package com.blap.blapweb.DTO;

public class TagCountDTO {
	private String Tag_name;
	private int Tag_count;
	public String getTag_name() {
		return Tag_name;
	}
	public void setTag_name(String tag_name) {
		Tag_name = tag_name;
	}
	public int getTag_count() {
		return Tag_count;
	}
	public void setTag_count(int tag_count) {
		Tag_count = tag_count;
	}
	@Override
	public String toString() {
		return "TagExpenditureDTO [Tag_name=" + Tag_name + ", Tag_count=" + Tag_count + "]";
	}
	
}