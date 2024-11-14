package project1;

import java.util.*;

public class ReserveMovie {
    private Scanner scanner;
    private List<Movie> movies;
  

    public ReserveMovie(Scanner scanner, List<Movie> movies) {
        this.scanner = scanner;
        this.movies = movies;
    }

    public void execute() {
    	
        System.out.println("현재 상영 중인 영화");
        System.out.println();
        for (Movie movie : movies) {
            System.out.println(movie); 
        }
        System.out.println();
        System.out.print("예매할 영화 번호를 입력하세요: ");
        String selectedNumber = scanner.nextLine();

        for (Movie movie : movies) {
            if (movie.selectNumber.equals(selectedNumber)) {
                String issuedNumber = movie.generateNumber(); 
                System.out.println();
                System.out.println();
                System.out.println("\t\t" +"예매 완료: " + movie.title); 
                System.out.println("\t\t" +"영화 ID: " + movie.movieId); 
                System.out.println("\t\t" +"발급번호: " + issuedNumber);
                System.out.println();
                System.out.println();
                return; 
            }
        }

        System.out.println("잘못된 영화 번호입니다.");
    }
}