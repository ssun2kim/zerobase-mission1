package dao;

import common.SqliteConnect;
import dto.BookmarkGroupDTO;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class BookmarkGroupDAO extends SqliteConnect {
    public BookmarkGroupDAO() {
        super();
    }

    public boolean saveBookmarkGroup(String name, int orderVal) {
        boolean result = false;

        try {
            String sql = " insert into BOOKMARK_GROUP " +
                    " (NAME, ORDER_VAL, REG_DT) " +
                    " values (?, ?, ?)" ;

            psmt = con.prepareStatement(sql);
            psmt.setString(1, name);
            psmt.setInt(2, orderVal);
            psmt.setString(3, LocalDateTime.now()
                    .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));

            int affected = psmt.executeUpdate();
            if (affected > 0) {
                result = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<BookmarkGroupDTO> getBookmarkGroupList() {
        List<BookmarkGroupDTO> list = new ArrayList<>();

        try {
            String sql = " select * from BOOKMARK_GROUP " +
                    " order by ORDER_VAL ";

            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();

            while (rs.next()) {
                BookmarkGroupDTO dto = new BookmarkGroupDTO();
                dto.setId(rs.getInt("ID"));
                dto.setName(rs.getString("NAME"));
                dto.setOrderVal(rs.getInt("ORDER_VAL"));
                dto.setRegDt(rs.getString("REG_DT"));
                dto.setUpdDt(rs.getString("UPD_DT"));

                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public BookmarkGroupDTO getBookmarkGroup(int id) {
        BookmarkGroupDTO dto = new BookmarkGroupDTO();

        try {
            String sql = " select * from BOOKMARK_GROUP " +
                    " where ID = ? ";

            psmt = con.prepareStatement(sql);
            psmt.setInt(1, id);
            rs = psmt.executeQuery();

            if (rs.next()) {
                dto.setId(rs.getInt("ID"));
                dto.setName(rs.getString("NAME"));
                dto.setOrderVal(rs.getInt("ORDER_VAL"));
                dto.setRegDt(rs.getString("REG_DT"));
                dto.setUpdDt(rs.getString("UPD_DT"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }

    public boolean editBookmarkGroup(int id, String name, int orderVal) {
        boolean result = false;

        try {
            String sql = " update BOOKMARK_GROUP " +
                    " set NAME = ?, ORDER_VAL = ?, UPD_DT = ? " +
                    " where ID = ? ";

            psmt = con.prepareStatement(sql);
            psmt.setString(1, name);
            psmt.setInt(2, orderVal);
            psmt.setString(3, LocalDateTime.now()
                    .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
            psmt.setInt(4, id);

            int affected = psmt.executeUpdate();
            if (affected > 0) {
                result = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean deleteBookmarkGroup(int id) {
        boolean result = false;

        try {
            String sql = " delete from BOOKMARK_GROUP " +
                    " where id = ? ";

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
