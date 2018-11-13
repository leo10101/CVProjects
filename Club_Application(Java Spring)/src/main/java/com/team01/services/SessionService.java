package com.team01.services;

import java.util.ArrayList;



import com.team01.model.Sessions;

public interface SessionService {
	ArrayList<Sessions> findAll();

	Sessions findSessions(Integer flNo);

	Sessions createSessions(Sessions session);
	Sessions changeSessions(Sessions session);

	void removeSessions(Sessions session);
	

}
