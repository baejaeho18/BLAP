package com.blap.blapweb.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.blap.blapweb.DAO.BucketDAO;
import com.blap.blapweb.DAO.BudgetDAO;
import com.blap.blapweb.DTO.BucketDTO;
import com.blap.blapweb.DTO.PageDTO;
import com.blap.blapweb.DTO.TagDTO;
import com.blap.blapweb.Service.BucketService;

@Service 
public class BucketServiceImpl implements BucketService {

	@Autowired
	BucketDAO bucketDAO;
	@Autowired
	BudgetDAO budgetDAO;
	
	@Override
	public int insertBucket(BucketDTO dto) {
		// TODO Auto-generated method stub
		return bucketDAO.insertBucket(dto);
	}

	@Override
	public int deleteBucket(int bucket_id) {
		// TODO Auto-generated method stub
		return bucketDAO.deleteBucket(bucket_id);
	}
	
	@Override
	public int alldeleteBucket() {
		// TODO Auto-generated method stub
		return bucketDAO.alldeleteBucket();
	}

	@Override
	public int updateBucket(BucketDTO dto) {
		// TODO Auto-generated method stub
		return bucketDAO.updateBucket(dto);
	}

	@Override
	public List<BucketDTO> getBucketList() {
		// TODO Auto-generated method stub
		return bucketDAO.getBucketList();
	}

	@Override
	public BucketDTO getBucket(int bucket_id) {
		// TODO Auto-generated method stub
		return bucketDAO.getBucket(bucket_id);
	}

	@Override
	public List<BucketDTO> getStateList() {
		// TODO Auto-generated method stub
		return bucketDAO.getStateList();
	}

	@Override
	public List<BucketDTO> getTagList() {
		// TODO Auto-generated method stub
		return bucketDAO.getTagList();
	}
	
	@Override
	public List<BucketDTO> getTagCount(){
		return bucketDAO.getTagCount();
	}
	
	@Override
	public int countBucketList() {
		return bucketDAO.countBucketList();
	}

//	@Override
//	public List<BucketDTO> selectBucketList(PageDTO dto) {
//		return bucketDAO.selectBucketList(dto);
//	}
//	
	
	@Override
	   public List<BucketDTO> selectBucketList(PageDTO dto) {
	      List<BucketDTO> listInBudget =  bucketDAO.selectBucketList(dto);
	      for(BucketDTO pdto : listInBudget) {
			pdto.setTotal_expenditure(budgetDAO.getBudget(pdto.getBucket_id()));
	      }
	      return listInBudget;
	   }
	
	@Override
	public List<BucketDTO> showRecently() {
		// TODO Auto-generated method stub
		return bucketDAO.showRecently();
	}
	
	@Override
	public List<BucketDTO> showNeed() {
		// TODO Auto-generated method stub
		return bucketDAO.showNeed();
	}
	
	@Override
	public int startBucket(int bucket_id) {
		// TODO Auto-generated method stub
		return bucketDAO.startBucket(bucket_id);
	}
	
	@Override
	public int endBucket(int bucket_id) {
		// TODO Auto-generated method stub
		return bucketDAO.endBucket(bucket_id);
	}
	@Override
	public List<BucketDTO> searchOneBucketByTag(TagDTO dto){
		return bucketDAO.searchOneBucketByTag(dto);
	}
	

};