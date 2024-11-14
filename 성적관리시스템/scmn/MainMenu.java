package scmn;

import java.util.Scanner;

public class MainMenu {
    Scanner scanner = new Scanner(System.in);
    UserMenu userMenu = new UserMenu(); // UserMenu 객체 생성
    StudentScManagement ss = new StudentScManagement();
    StudentSc ssc = new StudentSc();
    public void mainMn() {
        while (true) {
            System.out.println("1.학생 성적확인|2.교수 성적입력|3.회원메뉴|4.종료");
            String cho = scanner.nextLine();

            switch (cho) {
                case "1":
                    System.out.println("학생 성적 확인시스템으로 이동합니다");
                    ssc.stuScLi();
                    break;

                case "2":
                    System.out.println("교수 성적입력시스템으로 이동합니다");
                    ss.ssm();
                    break;

                case "3":
                    userMenu.userMn(); // UserMenu로 이동
                    break;

                case "4":
                    System.out.println("프로그램을 종료합니다.");
                    return; // 프로그램 종료
                default:
                    System.out.println("잘못된 입력입니다. 다시 시도해주세요.");
            }
        }
    }
}