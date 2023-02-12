package controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bdUtil.HallDAO;
import model.Hall;

@Controller
@MultipartConfig
@RequestMapping("/hall")
public class HallController {

	HallDAO hallDAO = new HallDAO();
	
	@RequestMapping("/add")
	@ResponseBody()
	protected String add(@RequestParam Map<String, String> req, @RequestParam("file") MultipartFile file ) throws IOException {
		Hall hall = new Hall();
		int brch_id = Integer.parseInt(req.get("brchId"));
		hall.setBrch_id(brch_id);
		String hall_type = req.get("hallType");
		hall.setHall_type(hall_type);
		String seat_type = req.get("hallSeat");
		hall.setSeat_type(seat_type);
		String air_cond = req.get("hallAir");
		hall.setAir_cond(air_cond);
		String sound_sys = req.get("hallSound");
		hall.setSound_sys(sound_sys);

		hall.setHall_condition("None");
		hall.setHall_status("Pending");
		hall.setHall_seat(Integer.parseInt(req.get("SeatNo")));
		InputStream fileContent = file.getInputStream();
		
		int rowAffected = hallDAO.add(hall, fileContent);
		
		return String.valueOf(rowAffected);
	}
	
	@PostMapping("/deleteHall")
	@ResponseBody()
	protected ModelAndView delete(@RequestParam Map<String, String> req) {
		ModelAndView model = new ModelAndView("redirect:/company");
		String currentId = req.get("currentID");
		int rowAffected = hallDAO.delete(Integer.parseInt(currentId));
		System.out.println(rowAffected);
		return model;
	}
}
