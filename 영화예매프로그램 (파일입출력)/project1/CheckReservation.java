package project1;

import java.util.List;
import java.util.Scanner;

public class CheckReservation {
    private Scanner scanner;
    private List<Movie> movies;

    public CheckReservation(Scanner scanner, List<Movie> movies) {
        this.scanner = scanner;
        this.movies = movies;
    }

    public void execute() {
        System.out.print("발급번호를 입력하세요: ");
        String issuedNumber = scanner.nextLine();
        
        boolean found = false;
        for (Movie movie : movies) {
            if (movie.getIssuedNumber() != null && movie.getIssuedNumber().equals(issuedNumber)) {
                System.out.println("예매 확인:");
                System.out.println("제목: " + movie.title + ", 영화 ID: " + movie.movieId + ", 발급번호: " + movie.getIssuedNumber());
                found = true;
                break;
            }
        } 
        if (!found) {
            System.out.println("해당 발급번호로 예매된 영화가 없습니다.");
        }
    }
}