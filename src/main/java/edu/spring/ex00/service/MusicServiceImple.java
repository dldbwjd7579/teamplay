package edu.spring.ex00.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex00.domain.Music;
import edu.spring.ex00.persistence.GetDao;
import edu.spring.ex00.persistence.MusicDao;

@Service
public class MusicServiceImple implements MusicService {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(MemberServiceImple.class);
	
	// DI(의존성 주입)
	@Autowired private MusicDao musicDao;
	

	@Override
	public List<Music> selectAll(int number) {
	
		return musicDao.readAll(number);
	}

	@Override
	public List<Music> search(int type, String keyword) {
		logger.info("musicServiceImpe() 호출");
		
		return musicDao.search(type, keyword);
		
	}

	@Override
	public Music select(int mid) {
		return musicDao.read(mid);
	}

	@Override
	public int update_mcount(int mid) {
		int result = 0;
		int mcount = musicDao.readMcount(mid) + 1;
		result = musicDao.update(mcount, mid);
		return result;
	}

	@Override
	public String selectMgenre(int mid) {
		return musicDao.readMgenre(mid);
	}

	@Override
	public List<Music> getNewAlbums() {
		return musicDao.newAlbum();
	}
	
	// ★ 플레이리스트 곡 추가  
	@Override
	public int update_playlist(int pid, String mids) {
		return musicDao.update(pid, mids);
	}

	@Override
	public List<Music> selectByMdate(String startDate, String endDate, String genre) {
		return musicDao.read(startDate, endDate, genre);
	}

} // end class MusicServiceImple 
