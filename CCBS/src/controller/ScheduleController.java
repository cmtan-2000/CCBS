package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.ScheduleDAO;
import model.Schedule;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	ScheduleDAO schDAO = new ScheduleDAO();
	
	@RequestMapping("/add")
	@ResponseBody()
	protected String add (HttpServletRequest request) {
		
		String hall_id = request.getParameter("hall_id");
		String[] movie_id = request.getParameterValues("movie_id");
		String showtime_date = request.getParameter("showtime_date");
		int showtime_time = 600;
		
		if (movie_id != null) {
	      for (String value : movie_id) {
	        // process each value here
	        System.out.println(value);
	      }
	    }
		
		System.out.println(hall_id);
		System.out.println(movie_id);
		System.out.println(showtime_date);

		/*
		 * if(hall_id != null){ for(String hid: hall_id) { System.out.println(hid); } }
		 */
		
//		for(int i=0; i<6; i++) {
//			Schedule schedule = new Schedule();
////			schedule.setHall_id(Integer.parseInt(hall_id[i]));
////			System.out.println(hall_id[i]);
////			schedule.setMovie_id(Integer.parseInt(movie_id[i]));
////			System.out.println(movie_id[i]);
////			schedule.setShowtime_date(showtime_date[i]);
////			System.out.println(showtime_date[i]);
////			schedule.setShowtime_time(showtime_time);
//			showtime_time += 60; 	
//			
//			
////			schDAO.add(schedule);
//			
//		}
		
//		System.out.println(hall_id);
//		System.out.println(movie_id);
//		System.out.println(showtime_date);
		
//		return "REsult here";
		
		return "redirect:/company";
		
	}
}
