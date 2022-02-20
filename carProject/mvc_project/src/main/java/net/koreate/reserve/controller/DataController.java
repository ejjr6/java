package net.koreate.reserve.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import net.koreate.reserve.service.AreaService;
import net.koreate.reserve.vo.CarVO;
import net.koreate.reserve.vo.ReserveVO;

@RestController
public class DataController {

	@Inject
	AreaService service;
	
	@PostMapping("/reservation/selectArea")
	public ResponseEntity<List<ReserveVO>> guList(ReserveVO vo)throws Exception{
		ResponseEntity<List<ReserveVO>> entity = null;
		//System.out.println(vo.getNsi());
		List<ReserveVO> guList = service.guList(vo.getNsi());
		
		entity = new ResponseEntity<>(guList,HttpStatus.OK);
		return entity;
	}
	
	
	@GetMapping("/reservation/car")
	public ResponseEntity<Object> keep()throws Exception{
		ResponseEntity<Object> entity = null;
		List<CarVO> carList = service.carList();
		
		try {
			entity = new ResponseEntity<>(carList,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("/reservation/{truck}")
	public ResponseEntity<Object> keep1(
			@PathVariable("truck") String truck
			)throws Exception{
		ResponseEntity<Object> entity = null;
		List<CarVO> truckList = service.truckList(truck);
		
		try {
			entity = new ResponseEntity<>(truckList,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PostMapping("/reservation/bus")
	public ResponseEntity<Object> keep2(CarVO vo)throws Exception{
		ResponseEntity<Object> entity = null;
		List<CarVO> busList = service.busList(vo.getCarType());
		
		try {
			entity = new ResponseEntity<>(busList,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
