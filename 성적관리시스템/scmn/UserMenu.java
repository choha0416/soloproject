package scmn;

import java.util.Scanner;

public class UserMenu {
    
    UserInsert usi = new UserInsert();
    UserUpdate usu = new UserUpdate();
    UserDelete usd = new UserDelete();
    Scanner scanner = new Scanner(System.in);
    
    public void userMn() {
        System.out.print("1. 회원가입 | 2. 회원정보 수정 | 3. 회원탈퇴 | 4. 메인 메뉴로 돌아가기\n");
        String cho = scanner.nextLine();
        
        switch(cho) {
            case "1":
                System.out.println("회원가입으로 이동합니다");
                usi.insertU(); // 회원가입
                break;

            case "2":
                System.out.println("회원정보 수정으로 이동합니다");
                usu.updateU(); // 정보 수정
                break;

            case "3":
                System.out.println("회원탈퇴로 이동합니다");
                usd.deleteU(); // 회원탈퇴
                break;

            case "4":
                System.out.println("메인 메뉴로 돌아갑니다");
                return; // 메인 메뉴로 돌아가기

            default:
                System.out.println("잘못된 선택입니다. 다시 선택해 주세요.");
                userMn(); // 다시 메뉴 표시
        }

        // 각 메서드가 끝난 후 유저 메뉴로 돌아가게
        userMn();
    }
}