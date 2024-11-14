package scmn;

import java.util.Scanner;
import java.sql.*;

public class UserInsert {
    
    private String userid;
    private String userpassword;
    Scanner scanner = new Scanner(System.in);
    User us = new User(userid, userpassword);

    public void insertU() {
        Connection conn = null;

        // 아이디 입력
        System.out.print("아이디를 입력해 주세요: ");
        String usid = scanner.nextLine();
        us.setUserId(usid);

        // 비밀번호 입력
        System.out.print("비밀번호를 입력해 주세요: ");
        String uspw = scanner.nextLine();
        us.setUserPassword(uspw);

        // 이름 입력
        System.out.print("이름을 입력해 주세요: ");
        String usnm = scanner.nextLine();
        us.setUserName(usnm);

        // 나이 입력
        System.out.println("나이를 입력해 주세요: ");
        int usag = Integer.parseInt(scanner.nextLine());
        us.setUserAge(usag);

        // 학년 입력
        System.out.println("학년을 입력해 주세요:");
        String usgdInput = scanner.nextLine();
        int usgd;

        // 학년 조건 체크
        if ("12345".equals(usgdInput)) {
            // 5자리 숫자 12345일 경우
            usgd = Integer.parseInt(usgdInput);
        } else {
            // 1~4일 경우
            usgd = Integer.parseInt(usgdInput);
            while (usgd < 1 || usgd > 4) {
                System.out.println("유효하지 않은 학년입니다. 1에서 4 사이의 숫자를 입력해 주세요:");
                usgd = Integer.parseInt(scanner.nextLine());
            }
        }

        us.setUserGrade(usgd);

        try {
            conn = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521/xe",
                    "system",
                    "oracle"
            );

            String sql = "INSERT INTO usersc(userid, username, userpassword, userage, usergrade) VALUES(?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, us.getUserId());
            pstmt.setString(2, us.getUserName());
            pstmt.setString(3, us.getUserPassword());
            pstmt.setInt(4, us.getUserAge());
            pstmt.setInt(5, us.getUserGrade());

            pstmt.executeUpdate();

            pstmt.close();
            System.out.println("등록이 완료되었습니다");
            System.out.println();
            System.out.println("\t\t아이디: " + us.getUserId());
            System.out.println("\t\t이름: " + us.getUserName());
            System.out.println("\t\t학년: " + us.getUserGrade());

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {}
            }
        }
    }
}