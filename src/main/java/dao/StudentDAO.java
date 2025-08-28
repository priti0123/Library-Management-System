package dao;

import model.Student;
import util.DBConnection;
import java.sql.*;
import java.util.*;

public class StudentDAO {
	public void addStudent(Student student) throws Exception {
	    Connection con = DBConnection.getConnection();
	    
	  
	   String enrollment = student.getEnrollment();
	   if( ! studentExistswithEnroll(enrollment)) {
		   PreparedStatement ps = con.prepareStatement(
				      "INSERT INTO students(enrollment, name, email, mob_no, department, course, gender, year, semester) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" );

				    ps.setString(1, student.getEnrollment());         // enroll_id
				    ps.setString(2, student.getName());       // name
				    ps.setString(3, student.getEmail());      // email
				    ps.setLong(4, student.getMob());          // mob_no
				    ps.setString(5, student.getDept());       // department
				    ps.setString(6, student.getCourse());     // course
				    ps.setString(7, student.getGender());     // gender
				    ps.setInt(8, student.getYear());          // year
				    ps.setInt(9, student.getSemester());      // semester

				    ps.executeUpdate();
				    con.close();
	   }
	}


    private boolean studentExistswithEnroll(String enrollment) throws Exception {
    	 Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement("SELECT enrollment FROM students WHERE enrollment = ?");
         ps.setString(1, enrollment);
         ResultSet rs = ps.executeQuery();
         boolean exists = false;
         if(rs.next()) {
        	 exists = true;
         }
         con.close();
         return exists;
	}


	public List<Student> getAllStudents() throws Exception {
        Connection con = DBConnection.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM students ORDER BY id ASC");
        List<Student> list = new ArrayList<>();
        while (rs.next()) {
            Student s = new Student();
            s.setId(rs.getInt("id"));
            s.setEnrollment(rs.getString("enrollment"));
            s.setName(rs.getString("name"));
            s.setEmail(rs.getString("email"));
            s.setMob(rs.getLong("mob_no"));
            s.setDept(rs.getString("department"));
            s.setCourse(rs.getString("course"));
            s.setYear(rs.getInt("year"));
            s.setSemester(rs.getInt("semester"));
            s.setGender(rs.getString("gender"));
            list.add(s);
        }
        con.close();
        return list;
    }

    public boolean studentExists(int id) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT id FROM students WHERE id = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        boolean exists = rs.next();
        con.close();
        return exists;
    }


	public void deleteStudent(String enrollment) throws Exception {
		        Connection con = DBConnection.getConnection();
		        PreparedStatement ps = con.prepareStatement("DELETE FROM students WHERE enrollment = ?");
		        ps.setString(1, enrollment);
		        ps.executeUpdate();
		        con.close();
		    }
	
	


}

