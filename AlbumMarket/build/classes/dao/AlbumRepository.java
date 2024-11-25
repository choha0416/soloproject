package dao;

import java.util.ArrayList;
import dto.Album; //패키지명 변경할것
//DAO로 변경될 예정
public class AlbumRepository {
	private ArrayList<Album> listOfAlbums = new ArrayList<Album>();
	private static AlbumRepository instance = new AlbumRepository();
	
	public AlbumRepository() {
		Album album1 = new Album("HEIZE1106","FALLIN'",20000);
		album1.setSinger("헤이즈(Heize)");
		album1.setDescription("\"떨어뜨린 것을 주우려 몸을 숙이다 남아있던 "
				+ "작은 조각들마저 왈칵 쏟아져 버릴 때, 반드시 기억해 내야한다. "
				+ "오직 붙잡을 수 있는 것은 내 마음 하나뿐이라는 걸.\"");
		album1.setPublisher("지니뮤직, Stone Music Entertainment");
		album1.setCategory("발라드,알앤비/소울");
		album1.setUnitInStock(2000);
		album1.setReleaseDate("2024/11/06");
		
		
		Album album2 = new Album("LEEBADA1113","Blue Ocean",15000);
		album2.setSinger("이바다(LEEBADA)");
		album2.setDescription("\"저는 사람이 인생을 살아가며 우정을 나누고 사랑하게 되는 일련의 과정들이, "
				+ "어쩌면 그림을 그리는 것과 비슷하다고 생각해요. 아름다운 수채화, "
				+ "그 위에 표현된 그림들은 누가 그리는 가에 따라 같은 꽃이라도 느낌이 다르고, "
				+ "누가 보느냐에 따라 느끼는 감정들이 다른 것처럼, 이별과 사랑, 그리고 삶을 통해 "
				+ "경험한 이야기 들을 슬프지만 아름답게 담아내고 싶었어요\"");
		album2.setPublisher("(주)뮤직카우, NUPLAY");
		album2.setCategory("발라드,알앤비/소울");
		album2.setUnitInStock(2000);
		album2.setReleaseDate("2018/11/13");
		
		
		Album album3 = new Album("ROTHY1105","너의 계절이 돌아올거야",13000);
		album3.setSinger("로시(Rothy)");
		album3.setDescription("\"너의 계절이 돌아올거야\" 라는 제목으로 발매된 이 노래는 그동안 김이나와의 호흡을"
				+ "통해 웰-메이드 노래를 발표한 로시가 또 다른 최고의 작사가인 심현보와 호흡을 맞춰 또 다른 위안의 메시지를"
				+ "전달할 예정이다.");
		album3.setPublisher("카카오엔터테인먼트");
		album3.setCategory("발라드");
		album3.setUnitInStock(2000);
		album3.setReleaseDate("2023/11/05");
		
		
		listOfAlbums.add(album1);
		listOfAlbums.add(album2);
		listOfAlbums.add(album3);
		
	}
	
	public ArrayList<Album> getAllAlbums() {
		return listOfAlbums;
	}
	
	public Album getAlbumById(String albumId) {
		Album albumById = null;
		
		for (int i=0; i<listOfAlbums.size(); i++) {
			Album album = listOfAlbums.get(i);
			if (album != null && album.getAlbumId() != null && album.getAlbumId().equals(albumId)) {
				albumById=album;
				break;
			}
		}
		return albumById;
	}
	
	public static AlbumRepository getInstance() {
		return instance; //추가내용 삭제하고 싶을경우 주석 실행 후 주석 지우고 다시 실행
	}
	
	public void addAlbum(Album album) {
		listOfAlbums.add(album);
	}
}
