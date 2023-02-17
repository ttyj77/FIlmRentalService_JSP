package controller;

import dbConn.ConnectionMaker;
import model.FilmDTO;
import model.ReviewDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReviewController {

    private Connection connection;

    public ReviewController(ConnectionMaker connectionMaker) {
        this.connection = connectionMaker.makeConnection();
    }

    public int reviewCount(int filmId) {
        int num = 0;

        String query = "select count(*) from review re join film f on re.film_id = f.id where f.id = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, filmId);
            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                num = resultSet.getInt(1); //총 리뷰개수
            }
            pstmt.close();
            resultSet.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return num;
    }


    public ArrayList<ReviewDTO> selectOneReviewList(int film_id) {
        ArrayList<ReviewDTO> list = new ArrayList<>();
        String query = "SELECT * FROM film.review where film_id = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, film_id);

            ResultSet resultSet = pstmt.executeQuery();
            while (resultSet.next()) {
                ReviewDTO r = new ReviewDTO();
                r.setId(resultSet.getInt("id"));
                r.setScore(resultSet.getInt("score"));
                r.setReview(resultSet.getString("review"));
                r.setNickname(resultSet.getString("nickname"));
                r.setWriter_id(resultSet.getString("writer_id"));
                list.add(r);
            }
            resultSet.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


}
