package project1;

import java.util.*;


import java.io.*;
public class MovieInfo {
    public List<Movie> loadFile(String filename) {
        List<Movie> movies = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(filename))) {
            String line;
            int count = 1; 
            while ((line = br.readLine()) != null) {
                String[] data = line.split(","); 
                if (data.length >= 3) { 
                    String movieId = data[2]; 
                    String title = data[1]; 
                    movies.add(new Movie(String.valueOf(count++), movieId, title)); 
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return movies; 
    }
}