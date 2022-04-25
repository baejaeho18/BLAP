package com.blap.blapweb.DAOImpl;


import java.util.List;

import com.blap.blapweb.DTO.BucketDTO;
import com.blap.blapweb.DTO.PageDTO;
import com.blap.blapweb.DTO.TagDTO;
import com.blap.blapweb.DAO.BucketDAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BucketDAOImpl implements BucketDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertBucket(BucketDTO dto) {
		System.out.println("insertBucket() 기능 처리");
		
		int result = sqlSession.insert("Bucket.insertBucket", dto);
		System.out.println("insertBucket() 기능 처리!!");
		return result;
	}
	public int deleteBucket(int bucket_id) {
//		System.out.println("===> JDBC로 deleteBucket() 기능 처리");
		
		int result = sqlSession.delete("Bucket.deleteBucket", bucket_id);
		return result;
	}
	public int alldeleteBucket() {
		int result = sqlSession.delete("Bucket.alldeleteBucket");
		return result;
	}
	public int updateBucket(BucketDTO dto) {
//		System.out.println("updateBucket() 기능 처리");
		
		int result = sqlSession.update("Bucket.updateBucket", dto);
		return result;
	}
	public int startBucket(int bucket_id) {
//		System.out.println("startBucket() 기능 처리");
		int result = sqlSession.update("Bucket.startBucket", bucket_id);
		return result;
	}
	public int endBucket(int bucket_id) {
//		System.out.println("endBucket() 기능 처리");
		int result = sqlSession.update("Bucket.endBucket", bucket_id);
		return result;
	}
	public List<BucketDTO> getBucketList(){
		List<BucketDTO> result = sqlSession.selectList("Bucket.getBucketList");
		return result;
	}

	public BucketDTO getBucket(int bucket_id) {
		BucketDTO result = sqlSession.selectOne("Bucket.getBucket", bucket_id);
		return result;
		
	}
	public List<BucketDTO> searchOneBucketByTag(TagDTO dto){
		List<BucketDTO> list = sqlSession.selectList("Bucket.searchOneBucketByTag", dto);
		return list;
	}
	

	public List<BucketDTO> getStateList() {
		// TODO Auto-generated method stub
		List<BucketDTO> result = sqlSession.selectList("Bucket.getStateList");
		return result;
	}
	
	public List<BucketDTO> getTagCount(){
		List<BucketDTO> result = sqlSession.selectList("Bucket.getTagCount");
		return result;
	}
	
	public List<BucketDTO> getTagList() {
		// TODO Auto-generated method stub
		List<BucketDTO> result = sqlSession.selectList("Bucket.getTagList");
		return result;
	}
	
	
	public int countBucketList() {
		int result = sqlSession.selectOne("Bucket.countBucketList");
		return result;
	}
	
	public List<BucketDTO> selectBucketList(PageDTO dto) {
		// TODO Auto-generated method stub
		List<BucketDTO> result = sqlSession.selectList("Bucket.selectBucketList",dto);
		return result;
	}
	
	public List<BucketDTO> showRecently(){
		List<BucketDTO> result = sqlSession.selectList("Bucket.showRecently");
		return result;
	}
	
	public List<BucketDTO> showNeed(){
		List<BucketDTO> result = sqlSession.selectList("Bucket.showNeed");
		return result;
	}
	

}