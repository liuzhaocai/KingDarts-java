package com.wangtiansoft.KingDarts.modules.user.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.wangtiansoft.KingDarts.common.bean.PageBean;
import com.wangtiansoft.KingDarts.common.utils.SQLUtil;
import com.wangtiansoft.KingDarts.core.support.common.BaseService;
import com.wangtiansoft.KingDarts.modules.user.service.UserBalanceService;
import com.wangtiansoft.KingDarts.persistence.base.BaseMapper;
import com.wangtiansoft.KingDarts.persistence.dao.master.UserBalanceMapper;
import com.wangtiansoft.KingDarts.persistence.entity.UserBalance;

@Transactional
@Service("userBalanceService")
public class UserBalanceServiceImpl extends BaseService<UserBalance, Integer> implements UserBalanceService{

	@Autowired
	private UserBalanceMapper userBalanceMapper;
	
	@Override
    public BaseMapper getBaseMapper() {
        return userBalanceMapper;
    }
	
	@Override
    public Page<Map> queryUserConsumptionDetails(Map paramMap, PageBean pageBean) {
        paramMap.put(SQLUtil.SQL_OrderSQL, SQLUtil.orderByCondition(pageBean));
        PageHelper.startPage(pageBean.getPage(), pageBean.getRows());
        return (Page<Map>) userBalanceMapper.queryUserConsumptionDetails(paramMap);
    }

	@Override
	public Float getUserBalanceCount(Map paramMap) {
		return userBalanceMapper.getUserBalanceCount(paramMap);
	}
}
