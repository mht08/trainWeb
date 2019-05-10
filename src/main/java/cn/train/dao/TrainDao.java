package cn.train.dao;


import java.util.List;

import cn.train.entity.Traininfo;
import cn.train.entity.User;

/*
 * @ Copyright (c) Create by JASON  Date:2018-04-17  All rights reserved.
 *
 * @ class description：火车DAO接口
 *
 */
public interface TrainDao {
	
	public List<Traininfo> getTraininfoList();
	
	public Traininfo getTraininfoDetail(int trainNo);

	public int deleteTraininfoById(int id);
	
	public int addTraininfo(Traininfo Traininfo); 
	
	//修改火车信息
		public Integer  updateById(Traininfo Traininfo);

	
	
}


