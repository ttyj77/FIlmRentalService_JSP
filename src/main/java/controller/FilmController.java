package controller;

import dbConn.ConnectionMaker;
import model.FilmDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FilmController {
    private Connection connection;

    public FilmController(ConnectionMaker connectionMaker) {
        this.connection = connectionMaker.makeConnection();
    }


    public ArrayList<FilmDTO> selectAll() {
        ArrayList<FilmDTO> list = new ArrayList<>();
        String query = "select * from film order by id;";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            ResultSet resultSet = pstmt.executeQuery();
            while (resultSet.next()) {
                FilmDTO f = new FilmDTO();
                f.setId(resultSet.getInt("id"));
                f.setTitle(resultSet.getString("title"));
                f.setRating(resultSet.getString("rating"));
                f.setCountry(resultSet.getString("country"));
                f.setShowing(resultSet.getInt("showing"));
                f.setEnglish_title(resultSet.getString("english_title"));
                f.setSummary(resultSet.getString("summary"));
                f.setPoster_image(resultSet.getString("poster_image"));

                list.add(f);
            }

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public FilmDTO selectOne(int id) {
        FilmDTO f = null;
        String query = "select * from film where id = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, id);

            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                f = new FilmDTO();
                f.setId(resultSet.getInt("id"));
                f.setTitle(resultSet.getString("title"));
                f.setRating(resultSet.getString("rating"));
                f.setCountry(resultSet.getString("country"));
                f.setShowing(resultSet.getInt("showing"));
                f.setEnglish_title(resultSet.getString("english_title"));
                f.setSummary(resultSet.getString("summary"));
                f.setPoster_image(resultSet.getString("poster_image"));
                return f;
            }
            resultSet.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }
}

