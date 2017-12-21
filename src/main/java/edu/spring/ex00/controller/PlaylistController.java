package edu.spring.ex00.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.ex00.domain.Playlist;
import edu.spring.ex00.pagination.PageNumberMaker;
import edu.spring.ex00.pagination.PaginationCriteria;
import edu.spring.ex00.service.PlaylistService;

@RequestMapping(value="/playlist")
@RestController
public class PlaylistController {
	private static final Logger logger = LoggerFactory.getLogger(PlaylistController.class);
	@Autowired private PlaylistService playlistService;
	
	@RequestMapping(value="/all/{userid}", method=RequestMethod.GET)
	public ResponseEntity<List<Playlist>> readPlaylist(@PathVariable(name="userid")String userid, Integer page, Integer perPage){
		PaginationCriteria c = new PaginationCriteria();
		if(page != null) {c.setPage(page);}
		if(perPage != null) {c.setNumsPerPage(perPage);}
		
		List<Playlist> list = playlistService.selectByUserid(c, userid);
		ResponseEntity<List<Playlist>> entity = null;
		if(list != null) {
			System.out.println("playlist pagenation 길이 ::: " + list.size());
			entity = new ResponseEntity<List<Playlist>>(list, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<List<Playlist>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/check/{ptitle}", method=RequestMethod.GET)
	public ResponseEntity<List<Playlist>> readByPtitle(@PathVariable(name="ptitle")String ptitle){
		logger.info("select 하려는 ptitle ::: " + ptitle);
		List<Playlist> list = playlistService.selectByPtitle(ptitle);
		
		ResponseEntity<List<Playlist>> entity = null;
		if(list != null) {
			entity = new ResponseEntity<List<Playlist>>(list, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<List<Playlist>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ResponseEntity<String> createPlaylist(@RequestBody Playlist p){
		logger.info("insert 하려는 ptitle ::: " + p.getPtitle());
		ResponseEntity<String> entity = null;
		int result = playlistService.insert(p);
		if(result == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/{pid}", method=RequestMethod.DELETE)
	public ResponseEntity<String> deletePlaylist(@PathVariable(name = "pid")int pid){
		logger.info("delete 하려는 pid ::: " + pid);
		ResponseEntity<String> entity = null;
		int result = playlistService.delete(pid);
		if(result == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
}
