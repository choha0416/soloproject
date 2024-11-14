package project1;


public class Movie {
    String title;
    String movieId; // 영화 식별 번호
    String selectNumber; // 선택 번호
    String issuedNumber; // 랜덤 발급번호

  
    Movie(String selectNumber, String movieId, String title) {
        this.selectNumber = selectNumber;
        this.movieId = movieId;
        this.title = title;
        this.issuedNumber = null; 
    }

    public String generateNumber() {
        
        int randomIssuedNumber = (int) (Math.random() * 10000); 
        this.issuedNumber = String.valueOf(randomIssuedNumber); 
        return issuedNumber;
    }

    public String getIssuedNumber() {
        return issuedNumber;
    }

    public void setIssuedNumber(String issuedNumber) {
        this.issuedNumber = issuedNumber;
    }

    @Override
    public String toString() {
        return selectNumber + ". 제목: " + title + ", 영화 ID: " + movieId; 
    }
}