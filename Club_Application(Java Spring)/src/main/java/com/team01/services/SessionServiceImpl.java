package com.team01.services;

import java.util.ArrayList;
import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import com.team01.model.Sessions;
import com.team01.repositories.SessionRepo;
@Component
@Service
public class SessionServiceImpl implements SessionService {
@Resource
private SessionRepo sessionRepo;
	@Override
	public ArrayList<Sessions> findAll() {
		ArrayList<Sessions> l = (ArrayList<Sessions>) sessionRepo.findAll();
		return l;
	}

	@Override
	public Sessions findSessions(Integer flNo) {
		return sessionRepo.findOne(flNo);
	}

	@Override
	public Sessions createSessions(Sessions session) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Sessions changeSessions(Sessions session) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void removeSessions(Sessions session) {
		// TODO Auto-generated method stub

	}
	


}
