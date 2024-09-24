package com.br.vita.reservation.model.dao;

import static com.br.vita.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.br.vita.member.model.vo.Member;
import com.br.vita.reservation.model.vo.Consultation;



public class ReservationDao {

   private Properties prop = new Properties();
   
   public ReservationDao() {
      
      String filePath = ReservationDao.class.getResource("/db/mappers/reservation-mapper.xml").getPath();

      try {
         prop.loadFromXML(new FileInputStream(filePath));

      } catch (InvalidPropertiesFormatException e) {
         e.printStackTrace();
      } catch (FileNotFoundException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }

   }

   public Member ComparisonMember(Connection conn, String userId,  String phone, String userName, String userSSN) {
      
       Member m = null;
       PreparedStatement pstmt = null;
       ResultSet rset = null;

       String sql = prop.getProperty("ComparisonMember");

       
           try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, phone);
         pstmt.setString(2, userName);
         pstmt.setString(3, userSSN);
         
         rset = pstmt.executeQuery();
         
            if (rset.next()) {
                   m = new Member (rset.getString("USER_ID")
                              ,   rset.getString("USER_TYPE")
                              ,   rset.getString("PHONE")
                              ,   rset.getString("USER_NAME")
                              ,   rset.getString("USER_SSN"));
               }
            
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
           
        return m;
        
       
   }
   
   public Member SSNBackNum (Connection conn, String userId,  String userSSN) {
	   
	   Member m = null;
       PreparedStatement pstmt = null;
       ResultSet rset = null;

       String sql = prop.getProperty("SSNBackNum");

       
           try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userSSN);
      
         
         rset = pstmt.executeQuery();
         
            if (rset.next()) {
                   m = new Member (rset.getString("USER_ID"));
               }
            
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
           
        return m;
   }

	public int Consultation(Connection conn, Consultation c) {
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("InsertCareApp");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getUserNo());
			pstmt.setString(2, c.getDoctorNo());
			pstmt.setString(3, c.getAppointmentTime());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}
   
	public boolean SelectConsultation(Connection conn, String userNo) {
		
		boolean hasAppointment = false;
		PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    
	    String sql = prop.getProperty("SelectConsultation");
	    
	    try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			
			 rset = pstmt.executeQuery();
	         
			 if (rset.next()) {
		            hasAppointment = true; 
		        }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		
	    return hasAppointment; 
	
		
	}

	
   
   
}
