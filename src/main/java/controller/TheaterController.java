package controller;

import dbConn.ConnectionMaker;
import model.FilmDTO;
import model.TheaterDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TheaterController {

    private Connection connection;

    public TheaterController(ConnectionMaker connectionMaker) {
        this.connection = connectionMaker.makeConnection();
    }

    public ArrayList<TheaterDTO> selectAll() {
        ArrayList<TheaterDTO> list = new ArrayList<>();
        String query = "SELECT * FROM theater;";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            ResultSet resultSet = pstmt.executeQuery();
            while (resultSet.next()) {
                TheaterDTO t = new TheaterDTO();
                t.setId(resultSet.getInt("id"));
                t.setName(resultSet.getString("name"));
                t.setLocation(resultSet.getString("location"));
                t.setInformation(resultSet.getString("information"));
                t.setInformation2(resultSet.getString("information2"));
                list.add(t);
            }

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<TheaterDTO> selectCity(int city_id) {
        ArrayList<TheaterDTO> list = new ArrayList<>();
        String query = "SELECT * FROM theater where city_id = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, city_id);
            ResultSet resultSet = pstmt.executeQuery();
            while (resultSet.next()) {
                TheaterDTO t = new TheaterDTO();
                t.setId(resultSet.getInt("id"));
                t.setName(resultSet.getString("name"));
                t.setLocation(resultSet.getString("location"));
                t.setNumber(resultSet.getString("number"));
                t.setInformation(resultSet.getString("information"));
                t.setInformation2(resultSet.getString("information2"));
                list.add(t);
            }

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
