package scmn;

import java.util.Scanner;

public class StudentScManagement {
    private ScoreInsert si = new ScoreInsert(); // ScoreInsert 객체 초기화
    private ScoreUpdate su = new ScoreUpdate();
    private ScoreList sl = new ScoreList();
    private Scanner scanner = new Scanner(System.in);
    UserLogInOut ulio = new UserLogInOut();
    User us;
    public void ssm() {
    	
    	
    	   User us = ulio.userLgI();

           //System.out.println(us.getUserGrade());
           if(us.getUserGrade()==12345) {
           
        	   System.out.print("1.성적 입력하기|2.성적 수정하기|3.석차 확인하기|4.로그아웃하기 ");
               String cho = scanner.nextLine();

               switch (cho) {
                   case "1":
                       System.out.println("성적 입력창으로 이동합니다");
                       si.insertS(); // 메서드 호출
                       break;
                   case "2":
                       System.out.println("성적 수정창으로 이동합니다");
                       su.updateS();
                       break;
                   case "3":
                       System.out.println("전체 석차를 확인합니다");
                       sl.listS();
                       break;
                   case "4":
                       System.out.println("로그아웃합니다");
                       us=null;
                       //System.out.println(us);
                       MainMenu mm = new MainMenu(); // MainMenu 객체 생성
                       mm.mainMn(); // MainMenu 실행
                       break; 
                   default:
                       ssm(); // 잘못된 입력 시 다시 호출
               }
        	   
        	   
           } else {
           	System.out.println("접근권한이 없습니다");
           	 MainMenu mm = new MainMenu(); // MainMenu 객체 생성
                mm.mainMn(); // MainMenu 실행
           }
    	
    	
        
    }
}