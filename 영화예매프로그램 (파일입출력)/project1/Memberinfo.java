package project1;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Memberinfo {
    public List<Member> loadFile(String filename) {
        List<Member> members = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(filename))) {
            String line;
            int count = 1; 
            while ((line = br.readLine()) != null) {
                String[] data = line.split(","); 
                if (data.length >= 2) { 
                    String memberId = data[0]; 
                    String password = data[1]; 
                    members.add(new Member(memberId, password)); 
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return members; 
    }
}