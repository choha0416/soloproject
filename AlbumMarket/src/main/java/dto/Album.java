package dto;

import java.io.Serializable;
//VO 
public class Album implements Serializable{
	
	
	public Album() {
		super();
	}
	
	
	
	public Album(String albumId, String name, int unitPrice) {
		super();
		this.albumId = albumId;
		this.name = name;
		this.unitPrice = unitPrice;
	}




	private String albumId; //앨범 아이디
	private String name; //앨범명
	private int unitPrice; //가격
	private String singer; //가수
	private String description; //설명
	private String publisher; //배급사
	private String category; //분류
	private long unitInStock; //재고개수
	private String releaseDate; //발매일(월/년)
	private String condition; //신제품 구제품 리퍼브 제품
	
	


	public String getAlbumId() {
		return albumId;
	}



	public void setAlbumId(String albumId) {
		this.albumId = albumId;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public int getUnitPrice() {
		return unitPrice;
	}



	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}



	public String getSinger() {
		return singer;
	}



	public void setSinger(String singer) {
		this.singer = singer;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getPublisher() {
		return publisher;
	}



	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public long getUnitInStock() {
		return unitInStock;
	}



	public void setUnitInStock(long unitInStock) {
		this.unitInStock = unitInStock;
	}



	public String getReleaseDate() {
		return releaseDate;
	}



	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}



	public String getCondition() {
		return condition;
	}



	public void setCondition(String condition) {
		this.condition = condition;
	}
	
}
