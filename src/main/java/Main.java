import common.SqliteConnect;

public class Main {


    public static void main(String[] args) {

        SqliteConnect sqliteConnect = new SqliteConnect();

        try {
            String sql = " insert into BOOKMARK" +
                    " (X_SWIFI_MGR_NO, BOOKMARK_ID, REG_DT) " +
                    " values (2, 3, 4) ";

            sqliteConnect.psmt = sqliteConnect.con.prepareStatement(sql);
            int affected = sqliteConnect.psmt.executeUpdate();

            if (affected > 0) {
                System.out.println("저장 성공");
            } else {
                System.out.println("저장 실패");
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
