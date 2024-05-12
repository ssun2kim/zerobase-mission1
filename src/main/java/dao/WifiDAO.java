package dao;

import common.ApiService;
import common.SqliteConnect;
import dto.WifiDTO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class WifiDAO extends SqliteConnect {

    public WifiDAO() {
        super();
    }

    public int saveWifi() throws IOException {
        int cnt = 0;

        ApiService apiService = new ApiService();
        int lastPage = 25;

        for (int i = 0; i < lastPage; i++) {
            String jsonString = apiService.getWifiInfoJson(i);
            List<WifiDTO> wifiDTOList = apiService.jsonStringToList(jsonString);

            for (WifiDTO dto : wifiDTOList) {
                boolean saveYn = false;
                try {
                    String sql = " delete from WIFI where X_SWIFI_MGR_NO = ? ";
                    psmt = con.prepareStatement(sql);
                    psmt.setString(1, dto.getMgrNo());
                    psmt.executeUpdate();

                    String sql2 = " insert into WIFI " +
                            " (X_SWIFI_MGR_NO, X_SWIFI_WRDOFC, X_SWIFI_MAIN_NM, X_SWIFI_ADRES1, X_SWIFI_ADRES2, " +
                            " X_SWIFI_INSTL_FLOOR, X_SWIFI_INSTL_TY, X_SWIFI_INSTL_MBY, X_SWIFI_SVC_SE, " +
                            " X_SWIFI_CMCWR, X_SWIFI_CNSTC_YEAR, X_SWIFI_INOUT_DOOR, X_SWIFI_REMARS3, LAT, LNT, WORK_DTTM) " +
                            " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

                    psmt = con.prepareStatement(sql2);
                    psmt.setString(1, dto.getMgrNo());
                    psmt.setString(2, dto.getWrdofc());
                    psmt.setString(3, dto.getMainNm());
                    psmt.setString(4, dto.getAdres1());
                    psmt.setString(5, dto.getAdres2());
                    psmt.setString(6, dto.getInstlFloor());
                    psmt.setString(7, dto.getInstlTy());
                    psmt.setString(8, dto.getInstlMby());
                    psmt.setString(9, dto.getSvcSe());
                    psmt.setString(10, dto.getCmcwr());
                    psmt.setString(11, dto.getCnstcYear());
                    psmt.setString(12, dto.getInoutDoor());
                    psmt.setString(13, dto.getRemars3());
                    psmt.setDouble(14, dto.getLat());
                    psmt.setDouble(15, dto.getLnt());
                    psmt.setString(16, dto.getWorkDttm());

                    psmt.executeUpdate();

                    saveYn = true;
                    if (saveYn) {
                        cnt++;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return cnt;
    }

    public List<WifiDTO> getWifiList(Double lat, Double lnt) {
        List<WifiDTO> wifiDTOList = new ArrayList<>();

        try {
            String sql = " select *, " +
                    " round(6371*acos(cos(radians(LAT))*cos(radians(?))*cos(radians(?) " +
                    " -radians(LNT))+sin(radians(LAT))*sin(radians(?))), 4) " +
                    " AS distance " +
                    " from WIFI " +
                    " order by DISTANCE " +
                    " limit 20 ";

            psmt = con.prepareStatement(sql);
            psmt.setDouble(1, lat);
            psmt.setDouble(2, lnt);
            psmt.setDouble(3, lat);

            rs = psmt.executeQuery();

            while (rs.next()) {
                WifiDTO dto = new WifiDTO();

                dto.setDistance(rs.getDouble("DISTANCE"));
                dto.setMgrNo(rs.getString("X_SWIFI_MGR_NO"));
                dto.setWrdofc(rs.getString("X_SWIFI_WRDOFC"));
                dto.setMainNm(rs.getString("X_SWIFI_MAIN_NM"));
                dto.setAdres1(rs.getString("X_SWIFI_ADRES1"));
                dto.setAdres2(rs.getString("X_SWIFI_ADRES2"));
                dto.setInstlFloor(rs.getString("X_SWIFI_INSTL_FLOOR"));
                dto.setInstlTy(rs.getString("X_SWIFI_INSTL_TY"));
                dto.setInstlMby(rs.getString("X_SWIFI_INSTL_MBY"));
                dto.setSvcSe(rs.getString("X_SWIFI_SVC_SE"));
                dto.setCmcwr(rs.getString("X_SWIFI_CMCWR"));
                dto.setCnstcYear(rs.getString("X_SWIFI_CNSTC_YEAR"));
                dto.setInoutDoor(rs.getString("X_SWIFI_INOUT_DOOR"));
                dto.setRemars3(rs.getString("X_SWIFI_REMARS3"));
                dto.setLat(rs.getDouble("LAT"));
                dto.setLnt(rs.getDouble("LNT"));
                dto.setWorkDttm(rs.getString("WORK_DTTM"));

                wifiDTOList.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        HistoryDAO historyDAO = new HistoryDAO();
        historyDAO.saveHistory(lat, lnt);
        historyDAO.close();

        return wifiDTOList;
    }

    public WifiDTO getWifiDetail(String mgrNo) {
        WifiDTO dto = new WifiDTO();

        try {
            String sql = " select *, 0 as DISTANCE from WIFI " +
                    " where X_SWIFI_MGR_NO = ? ";

            psmt = con.prepareStatement(sql);
            psmt.setString(1, mgrNo);
            rs = psmt.executeQuery();

            if (rs.next()) {
                dto.setDistance(rs.getDouble("DISTANCE"));
                dto.setMgrNo(rs.getString("X_SWIFI_MGR_NO"));
                dto.setWrdofc(rs.getString("X_SWIFI_WRDOFC"));
                dto.setMainNm(rs.getString("X_SWIFI_MAIN_NM"));
                dto.setAdres1(rs.getString("X_SWIFI_ADRES1"));
                dto.setAdres2(rs.getString("X_SWIFI_ADRES2"));
                dto.setInstlFloor(rs.getString("X_SWIFI_INSTL_FLOOR"));
                dto.setInstlTy(rs.getString("X_SWIFI_INSTL_TY"));
                dto.setInstlMby(rs.getString("X_SWIFI_INSTL_MBY"));
                dto.setSvcSe(rs.getString("X_SWIFI_SVC_SE"));
                dto.setCmcwr(rs.getString("X_SWIFI_CMCWR"));
                dto.setCnstcYear(rs.getString("X_SWIFI_CNSTC_YEAR"));
                dto.setInoutDoor(rs.getString("X_SWIFI_INOUT_DOOR"));
                dto.setRemars3(rs.getString("X_SWIFI_REMARS3"));
                dto.setLat(rs.getDouble("LAT"));
                dto.setLnt(rs.getDouble("LNT"));
                dto.setWorkDttm(rs.getString("WORK_DTTM"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
}
