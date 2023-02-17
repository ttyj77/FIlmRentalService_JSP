package controller;

import dbConn.ConnectionMaker;
import model.ActorDTO;
import model.ReviewDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ActorController {
    private Connection connection;

    public ActorController(ConnectionMaker connectionMaker) {
        this.connection = connectionMaker.makeConnection();
    }


    public ArrayList<ActorDTO> actorList(int film_id) {
        ArrayList<ActorDTO> list = new ArrayList<>();
        String query = "SELECT * FROM actor where film_id = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, film_id);

            ResultSet resultSet = pstmt.executeQuery();
            while (resultSet.next()) {
                ActorDTO a = new ActorDTO();
                a.setActor_id(resultSet.getInt("actor_id"));
                a.setName(resultSet.getString("name"));
                a.setCasting(resultSet.getString("casting"));
                a.setImage(resultSet.getString("image"));
                list.add(a);
            }
            resultSet.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;


    }

}
