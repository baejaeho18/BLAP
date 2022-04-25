package com.blap.blapweb.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.blap.blapweb.DTO.BucketDTO;
import com.blap.blapweb.DTO.PageDTO;
import com.blap.blapweb.DTO.TagDTO;

@Service
public interface BucketService {
	public int insertBucket(BucketDTO dto);
	public int deleteBucket(int bucket_id);
	public int alldeleteBucket();
	public int updateBucket(BucketDTO dto);
	public List<BucketDTO> getBucketList();
	public BucketDTO getBucket(int bucket_id);
	public List<BucketDTO> getStateList();
	public List<BucketDTO> getTagCount();
	public List<BucketDTO> getTagList();
	public int countBucketList();
	public List<BucketDTO> selectBucketList(PageDTO dto);
	public List<BucketDTO> showRecently();
	public List<BucketDTO> showNeed();
	public int startBucket(int bucket_id);
	public int endBucket(int bucket_id);
	public List<BucketDTO> searchOneBucketByTag(TagDTO dto);
	
}