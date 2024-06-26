package com.galgoda.customerService.model.dao;

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

import com.galgoda.common.model.vo.PageInfo;
import com.galgoda.customerService.model.vo.Notice;

public class NoticeDao {
	
	private Properties prop = new Properties();
	
	public NoticeDao() {
		try {
			prop.loadFromXML(new FileInputStream(Notice.class.getResource("/db/mappers/customerService-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Notice> selectNoticeList(Connection conn, PageInfo pi){
		List<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("notice_no")
						          , rset.getString("notice_title")
						          , rset.getString("notice_content")
						          , rset.getString("regist_date")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public Notice selectNotice(Connection conn, int noticeNo) {
		Notice n = new Notice();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n.setNoticeNo(rset.getInt("NOTICE_NO"));
				n.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				n.setNoticeContent(rset.getString("NOTICE_CONTENT"));
				n.setRegistDate(rset.getString("REGIST_DATE"));
				if(rset.getInt("MEM_NO") != 0) {
					n.setMemNo(rset.getInt("MEM_NO"));
				}
				if(rset.getInt("ADMIN_NO") != 0) {
					n.setAdminNo(rset.getInt("ADMIN_NO"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return n;
	}
	
	public int insertHotelNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertHotelNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getMemNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int insertAdminNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAdminNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getAdminNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteNotice(Connection conn, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectNoticeListCount(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
}
