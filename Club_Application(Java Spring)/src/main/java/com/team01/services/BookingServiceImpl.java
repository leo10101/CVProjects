package com.team01.services;

import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.data.repository.query.Param;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team01.model.Booking;

import com.team01.repositories.BookingRepo;

@Component
@Service
public class BookingServiceImpl implements BookingService {
	@Resource
	private BookingRepo bookingRepo;
	@Override
	@Transactional
	public ArrayList<Booking> findAllBooking() {
		ArrayList<Booking> ul = (ArrayList<Booking>) bookingRepo.findAll();
		return ul;
	}

	@Override
	@Transactional
	public Booking findBooking(Integer flNo) {
		return bookingRepo.findOne(flNo);
	}

	@Override
	@Transactional
	public Booking createBooking(Booking booking) {
		return bookingRepo.saveAndFlush(booking);
	}

	@Override
	@Transactional
	public Booking changeBooking(Booking booking) {
		return bookingRepo.saveAndFlush(booking);
	}

	@Override
	@Transactional
	public void removeBooking(Booking booking) {
		bookingRepo.delete(booking);

	}
	@Override
	@Transactional
	public ArrayList<Booking> findCoursesByEID(Integer eid)
	{
	return	bookingRepo.findCoursesByEID(eid);
		
	};
}
