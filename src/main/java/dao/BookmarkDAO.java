package dao;

import common.SqliteConnect;
import dto.BookmarkDTO;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class BookmarkDAO extends SqliteConnect {
    public BookmarkDAO() {
        super();
    }

    public boolean saveBookmark(String mgrNo, int bgId) {
        boolean result = false;

        try {
            String sql = " insert into BOOKMARK " +
                    " (X_SWIFI_MGR_NO, BOOKMARK_ID, REG_DT) " +
                    " values (?, ?, ?) ";

            psmt = con.prepareStatement(sql);
            psmt.setString(1, mgrNo);
            psmt.setInt(2, bgId);
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

    public List<BookmarkDTO> getBookmarkList() {
        List<BookmarkDTO> list = new ArrayList<>();

        try {
            String sql = " select * from BOOKMARK " +
                    " order by REG_DT ";

            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();

            while (rs.next()) {
                BookmarkDTO dto = new BookmarkDTO();
                dto.setId(rs.getInt("ID"));
                dto.setMgrNo(rs.getString("X_SWIFI_MGR_NO"));
                dto.setBookmarkId(rs.getInt("BOOKMARK_ID"));
                dto.setRegDt(rs.getString("REG_DT"));

                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public BookmarkDTO getBookmark(int id) {
        BookmarkDTO dto = null;

        try {
            String sql = " select * from BOOKMARK " +
                    " where ID = ? ";

            psmt = con.prepareStatement(sql);
            psmt.setInt(1, id);
            rs = psmt.executeQuery();

            if (rs.next()) {
                dto = new BookmarkDTO();
                dto.setId(rs.getInt("ID"));
                dto.setMgrNo(rs.getString("X_SWIFI_MGR_NO"));
                dto.setBookmarkId(rs.getInt("BOOKMARK_ID"));
                dto.setRegDt(rs.getString("REG_DT"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }

    public boolean deleteBookmark(int id) {
        boolean result = false;

        try {
            String sql = " delete from BOOKMARK " +
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
