package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SqliteConnect {

    public Connection con;
    public PreparedStatement psmt;
    public ResultSet rs;

    public SqliteConnect() {
        try {
            Class.forName("org.sqlite.JDBC");

            String url = "jdbc:sqlite:C:/Users/sun/IdeaProjects/mission1/wifi_db.sqlite";

            con = DriverManager.getConnection(url);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            if (rs != null) rs.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
