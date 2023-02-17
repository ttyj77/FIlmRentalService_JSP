package model;

import lombok.Data;

@Data
public class RunningTimeDTO {

    private int id;
    private int filmId;
    private int theaterId;
    private String runningTime;


}
