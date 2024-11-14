package project1;

import java.io.*;
import java.util.*;

public class MainApp {
  
	public static void main(String[] args) throws Exception {
		Scanner scanner = new Scanner(System.in);

		List<Member> members;

		
		MainMenu mm = new MainMenu();
		
		System.out.println("====================영화 예매 사이트===================");
		System.out.print("\t\t"+"접속하시려면 1 회원가입을 하시려면 2"+"\n"+"\t\t" + "종료 하시려면 1,2를제외한 아무키를 입력해주세요: ");
		String start =scanner.nextLine();
		if(start.equals("1")) {
			mm.idck();
		} 
		if(start.equals("2")) {
			System.out.println("회원가입으로 이동합니다");
			new MemberSign().usersign();
			mm.idck();
		}
		else {
			System.out.println("프로그램을 종료합니다.");
	        scanner.close();
	        return;
		}
		
		
	}

}
