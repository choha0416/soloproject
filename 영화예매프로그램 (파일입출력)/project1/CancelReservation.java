package project1;
import java.util.*;
public class CancelReservation {
	private Scanner scanner;
	private List<Movie> movies;
	
	public CancelReservation(Scanner scanner, List<Movie> movies) {
		this.scanner = scanner;
		this.movies = movies;
	}
	
	public void excute() {
		System.out.println("예매를 취소하시려면 발급번호를 입력해주세요: ");
		String issuedNumber = scanner.nextLine();
		
		boolean found = false;
		for(Movie movie: movies) {
			if(movie.getIssuedNumber() != null && movie.getIssuedNumber().equals(issuedNumber)) {
				System.out.println("\t\t\t" +"예매권");
    			System.out.println("\t\t" +"영화제목: "+movie.title);
    			System.out.println("\t\t"+"발급번호: "+movie.getIssuedNumber());
    			System.out.println();
				System.out.println("해당 예매권이 취소되었습니다");
				movie.setIssuedNumber(null);
				found = true;
				break;
			}
			if(found != true) {
    			System.out.println("해당 발급번호로 예매된 영화가 없습니다");
    			System.out.print("재입력 하시려면 1번 종료하시려면 1번을 제외한 아무버튼을 눌러주세요. ");
    			String exitNumber = scanner.nextLine();
    			if(exitNumber.equals("1")) {
    				found = true;
    				excute();
    			} else {
    				break;
    			}
    		}
		}
	}
}
