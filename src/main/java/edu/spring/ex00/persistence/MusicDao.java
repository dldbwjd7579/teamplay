package edu.spring.ex00.persistence;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import edu.spring.ex00.domain.Music;

public interface MusicDao {
	
	// 전체 검색 (차트 정렬) 
	List<Music> readAll(int number);
	
	// 검색 기능 
	List<Music> search(int type, String keyword);

	// mid로 음악찾기
	Music read(int mid);
	
	// mid로 mcount 찾기
	int readMcount(int mid);
	
	// mid로 mcount 업데이트
	int update(int mcount, int mid);
	
	// mid로 mgenre 찾기
	String readMgenre(int mid);
	
	// 최신앨범 가져오기 
	List<Music> newAlbum();
	
	
	
	
} // end interface MusicDao
