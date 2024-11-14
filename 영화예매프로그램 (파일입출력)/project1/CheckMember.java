package project1;

import java.util.*;

public class CheckMember {
    private Scanner scanner;
    private List<Member> members;
    MainMenu mm = new MainMenu();
    public CheckMember(Scanner scanner, List<Member> members) {
        this.scanner = scanner;
        this.members = members;
    }

    public void execute() {
        System.out.println();
        for (Member member : members) {
            //System.out.println(member.memberId); 
            System.out.print("아이디를 입력하세요");
            String gid = scanner.nextLine();
            if(gid.equals(member.memberId)) {
            	System.out.println("o");
            	mm.menu();
            }else {
            	System.out.print("아이디를 다시입력하세요");
            	mm.idck();                
            }
        }
       
    }
}