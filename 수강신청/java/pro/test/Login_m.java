package pro.test;

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

@WebServlet("/memlog")
public class Login_m extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login_m() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");
        PrintWriter writer = response.getWriter();

      
        SelectU login = new SelectU();
        List<User_m> users = login.selectU(null, null, null, null, null, null);

       
        String inputId = request.getParameter("_id");
        String inputPassword = request.getParameter("password");

        boolean loginSuccess = false;  
        JSONArray jsonArray = new JSONArray();

        
        for (User_m user : users) {
            if (user.getUser_id().equals(inputId) && user.getPassword().equals(inputPassword)) {
                JSONObject userJson = new JSONObject();
                userJson.put("id", user.getUser_id());
                userJson.put("name", user.getName());
                userJson.put("idf", user.getUser_id_field());
                userJson.put("email", user.getEmail());
                userJson.put("password", user.getPassword());
                userJson.put("role", user.getRole());

             
                jsonArray.add(userJson);
                loginSuccess = true;
                break; 
            }
        }

        // 로그인 실패 시 실패 메시지 전송
        if (!loginSuccess) {
            JSONObject errorJson = new JSONObject();
            errorJson.put("status", "failure");
            errorJson.put("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
            jsonArray.add(errorJson);
        }

        // 응답 데이터 전송
        writer.print(jsonArray.toString());
        writer.flush();
    }
}
