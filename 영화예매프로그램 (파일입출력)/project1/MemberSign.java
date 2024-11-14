package project1;
import java.io.File;
import java.io.FileWriter;
import java.util.*;


public class MemberSign {
	public static String userid;
	public static String password;
	public static void usersign() throws Exception{
		Scanner us = new Scanner(System.in);
		// TODO Auto-generated method stub
		File file = new File("C:\\Temp\\user.txt");
		FileWriter fw = new FileWriter(file);
		System.out.println("생성할 아이디를 적어주세요");
		String userid = us.nextLine();
		fw.write(userid+",");
		System.out.println("생성할 비밀번호를 적어주세요");
		String userpw = us.nextLine();
		fw.write(userpw+"\n");
		fw.flush();
		fw.close();
		
		System.out.println(userid+"가 등록되었습니다");
	}

}
