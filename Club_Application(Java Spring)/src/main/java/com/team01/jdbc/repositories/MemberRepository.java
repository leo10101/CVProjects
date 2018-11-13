package com.team01.jdbc.repositories;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.team01.jdbc.dao.DAO;

public class MemberRepository {
	public static ArrayList<HashMap> findByUserIdAndPassword(Integer userId, String password) throws ClassNotFoundException, SQLException{
		String sqlStt = String.format("SELECT * FROM Member WHERE UserId = %s AND UserPassword = '%s'", userId.toString(), password);
		return DAO.factoryCreate().Query(sqlStt);
	}
}
