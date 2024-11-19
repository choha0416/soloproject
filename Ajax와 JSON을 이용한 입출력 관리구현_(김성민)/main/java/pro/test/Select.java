package pro.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * Servlet implementation class Select
 */
@WebServlet("/json4")
public class Select extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Select() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
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
        LoginDAO logDAO = new LoginDAO();
        
        // selectU() 메서드 호출하여 사용자 목록 가져오기
        List<User> users = logDAO.selectU(null, null, null, null);
        
        // JSON 객체 생성
        JSONArray jsonArray = new JSONArray();
        
        for (User user : users) {
            JSONObject userJson = new JSONObject();
            userJson.put("id", user.getId());
            userJson.put("pw", user.getPw());
            userJson.put("name", user.getName());
            userJson.put("age", user.getAge());
            jsonArray.add(userJson);  // JSON 배열에 추가
        }
        
        // 응답 타입을 JSON으로 설정
        response.setContentType("application/json; charset=utf-8");
        
        // 응답 데이터 전송
        PrintWriter out = response.getWriter();
        out.print(jsonArray.toString());  // JSON 배열을 문자열로 변환하여 전송
        out.flush();
   
        // 응답 JSON을 클라이언트에게 전달

        

    }
}