package com.blap.blapweb.DAO;

import java.util.List;

public interface BucketlistDAO {
	
	public int getIncompleteCount(int bucket_id);
	public int getOngoingCount(int bucket_id);
	public int getCompleteCount(int bucket_id);
}