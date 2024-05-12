package dao;

import common.SqliteConnect;
import dto.HistoryDTO;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class HistoryDAO extends SqliteConnect {
    public HistoryDAO() {
        super();
    }

    public void saveHistory(Double lat, Double lnt) {

        try {
            String sql = " insert into HISTORY " +
                    " (LAT, LNT, REG_DT) " +
                    " values (?, ?, ?) ";

            psmt = con.prepareStatement(sql);
            psmt.setDouble(1, lat);
            psmt.setDouble(2, lnt);
            psmt.setString(3, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
            psmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<HistoryDTO> getHistoryList() {
        List<HistoryDTO> list = new ArrayList<>();

        try {
            String sql = " select * " +
                    " from HISTORY " +
                    " order by id desc ";

            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();

            while (rs.next()) {
                HistoryDTO dto = new HistoryDTO();
                dto.setId(rs.getInt("ID"));
                dto.setLat(rs.getDouble("LAT"));
                dto.setLnt(rs.getDouble("LNT"));
                dto.setRegDt(rs.getString("REG_DT"));

                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteHistory(int id) {
        boolean result = false;

        try {
            String sql = " delete from HISTORY " +
                    " where ID = ? ";

            psmt = con.prepareStatement(sql);
            psmt.setInt(1, id);

            int affected = psmt.executeUpdate();
            if (affected > 0) {
                result = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
