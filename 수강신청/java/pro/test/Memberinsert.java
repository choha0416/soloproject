package pro.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * Servlet implementation class Memberinsert
 */
@WebServlet("/memin")
public class Memberinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Memberinsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandle(request, response);
    }

    private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");
        PrintWriter writer = response.getWriter();
        
        // 클라이언트로부터 JSON 데이터를 읽기
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;

        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        String jsonData = sb.toString(); 

        JSONParser parser = new JSONParser();
        JSONObject jsonObject = null;
        try {
            jsonObject = (JSONObject) parser.parse(jsonData);  // JSONParser로 파싱
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // JSON에서 데이터를 추출
        String id = (String) jsonObject.get("id");           // user_id
        String idf = (String) jsonObject.get("idf");         // user_id_field
        String pw = (String) jsonObject.get("pw");           // password
        String name = (String) jsonObject.get("name");       // name
        String email = (String) jsonObject.get("email");     // email

        System.out.println("======회원정보======");
        System.out.println("id = " + id);
        System.out.println("user_id_field = " + idf);
        System.out.println("pw = " + pw);
        System.out.println("name = " + name);
        System.out.println("email = " + email);
        System.out.println("=================");

        JSONObject responseJson = new JSONObject();
        int row = 0;
        InsertU_m logDAO = new InsertU_m(); // InsertU_m 객체 사용

        try {
            // 사용자 정보 삽입
            row = logDAO.insertU(id, idf, pw, name, email);  // DB에 데이터 삽입
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (row > 0) {
            responseJson.put("message", "회원가입이 성공적으로 처리되었습니다.");
        } else {
            responseJson.put("message", "회원가입에 실패했습니다.");
        }

        // 응답 JSON을 클라이언트에게 전달
        writer.print(responseJson.toString());
        writer.flush();
    }
}