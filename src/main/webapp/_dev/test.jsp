<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String DB_URL = "jdbc:cubrid:192.168.0.77:50000:bovis:::?charset=utf-8";
	String DB_USER = "bovis";
	String DB_PASSWORD = "bovis123";

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "";

	try {
		Class.forName("cubrid.jdbc.driver.CUBRIDDriver");

		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

		stmt = conn.createStatement();
		
		sql = "select 1 from db_root";
		rs = stmt.executeQuery(sql);
		if(rs.next()){
			out.println(rs.getObject(1));
			out.println("<br />");
		}else{
			out.println("rs is null");
			out.println("<br />");
		}
		
		rs.close();
		stmt.close();
		conn.close();

		out.println("db test end");
	} catch (Exception e) {
		out.println(e.getMessage());
	}
%>