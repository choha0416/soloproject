package scmn;

import java.sql.*;
import java.util.Scanner;

public class UserLogInOut {
    private User us; // 로그인된 사용자 정보
    private Scanner scanner = new Scanner(System.in);
    UserMenu userMenu = new UserMenu(); 
    public User userLgI() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521/xe",
                    "system",
                    "oracle"
            );

            System.out.print("아이디를 입력해 주세요: ");
            String usid = scanner.nextLine();
            System.out.print("비밀번호를 입력해 주세요: ");
            String uspw = scanner.nextLine();

            String sql = "SELECT userid, userpassword, usergrade FROM usersc WHERE userid = ? AND userpassword = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, usid);
            pstmt.setString(2, uspw);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String userId = rs.getString("userid");
                String userPassword = rs.getString("userpassword");
                int userGrade = rs.getInt("usergrade");

                us = new User(userId, userPassword); // User 객체 생성
                us.setUserGrade(userGrade); // 학년 설정
                us.setUserId(userId);
                if (userGrade >= 1 && userGrade <= 4) {
                    System.out.println("학생으로 로그인했습니다.");
                } else if (userGrade == 12345) {
                    System.out.println("교수로 로그인했습니다.");
                }
            } else {
                System.out.println("로그인 실패: 아이디 또는 비밀번호가 잘못되었습니다.");
                userLgI();
            }

            rs.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return us; // 로그인된 User 객체 반환
    }
    
    public void userLgO() {
        // 로그아웃 로직 구현
        us = null; // 로그인된 사용자 정보 초기화
        System.out.println("로그아웃 되었습니다.");
    }
}