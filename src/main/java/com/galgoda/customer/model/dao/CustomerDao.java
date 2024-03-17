package com.galgoda.customer.model.dao;

import static com.galgoda.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.customer.model.vo.Wishlist;
import com.galgoda.member.model.vo.Customer;

public class CustomerDao {
	
	private Properties prop = new Properties();
	
	public CustomerDao() {
		try {
			prop.loadFromXML(new FileInputStream(CustomerDao.class.getResource("/db/mappers/customer-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Reservation> selectReservation(Connection conn, int userNo) {
		
		List<Reservation> reservations = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				reservations.add(new Reservation(rset.getInt("res_no")
										       , rset.getInt("hotel_no")
										       , rset.getString("hotel_name")
										       , rset.getInt("user_no")
										       , rset.getInt("ro_no")
										       , rset.getString("date_in")
										       , rset.getString("date_out")
										       , rset.getDate("res_date")
										       , rset.getString("res_status")
										       , rset.getString("req")
										       , rset.getString("reason_cancel")
										       , rset.getString("pay_method")
										       , rset.getInt("pay")
										       , rset.getDate("pay_date")
										       , rset.getInt("res_people")
										       , rset.getString("res_name")
										       , rset.getString("res_phone")
										       , rset.getString("res_email")
										       , rset.getString("img_path")
										       , rset.getString("ro_name")
										       , rset.getString("op_name")));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reservations;
	}
	
	public List<Wishlist> selectWishlist(Connection conn, int userNo) {
		
		List<Wishlist> wishlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWishlist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				wishlist.add(new Wishlist(rset.getInt("wish_no")
						                , rset.getInt("user_no")
						                , rset.getInt("hotel_no")
						                , rset.getString("hotel_name")
						                , rset.getDate("reg_date")
						                , rset.getString("img_path")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return wishlist;
	}
	
	public Customer selectCustomer(Connection conn, String userId) {
		
		Customer ct = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCustomer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ct = new Customer(rset.getInt("user_no")
						        , rset.getString("user_id")
						        , rset.getString("user_name")
						        , rset.getString("user_eng_name")
						        , rset.getString("user_pwd")
						        , rset.getString("birth_date")
						        , rset.getString("email")
						        , rset.getString("phone")
						        , rset.getString("zipcode")
						        , rset.getString("address")
						        , rset.getString("address_detail")
						        , rset.getString("etc")
						        , rset.getDate("regist_date")
						        , rset.getDate("modify_date")
						        , rset.getString("status"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return ct;
		
	}
	
	public int updatePersonalInfo(Connection conn, Customer ct) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePersonalInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ct.getUserName());
			pstmt.setString(2, ct.getUserPwd());
			pstmt.setString(3, ct.getPhone());
			pstmt.setString(4, ct.getEmail());
			pstmt.setString(5, ct.getZipcode());
			pstmt.setString(6, ct.getAddress());
			pstmt.setString(7, ct.getAddressDetail());
			pstmt.setString(8, ct.getEtc());
			pstmt.setString(9, ct.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int deleteCustomer(Connection conn, String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCustomer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
}