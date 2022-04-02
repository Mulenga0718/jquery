package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.buyer.vo.BuyerVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class BuyerDaoImpl implements IBuyerDao{
	private SqlMapClient client;
	private static IBuyerDao dao;
	
	private BuyerDaoImpl() {
		client = SqlMapClientFactory.getsqlMapClient();
	}
	public static IBuyerDao getInstance() {
		if(dao == null) dao = new BuyerDaoImpl();
		return dao;
	}
	@Override
	public List<BuyerVO> selectByName() {
		List<BuyerVO> list = null;
		
		try {
			list = client.queryForList("buyer.selectByName");
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		
		return list;
	}

	@Override
	public BuyerVO idByDetail(String buyer_id) {
		BuyerVO vo = null;
		
		try {
			
			vo = (BuyerVO) client.queryForObject("buyer.idByDetail", buyer_id);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}

}
