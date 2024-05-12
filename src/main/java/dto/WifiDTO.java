package dto;

import com.google.gson.JsonObject;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@ToString
public class WifiDTO {
    private double distance;
    private String mgrNo;
    private String wrdofc;
    private String mainNm;
    private String adres1;
    private String adres2;
    private String instlFloor;
    private String instlTy;
    private String instlMby;
    private String svcSe;
    private String cmcwr;
    private String cnstcYear;
    private String inoutDoor;
    private String remars3;
    private double lat;
    private double lnt;
    private String workDttm;

    public WifiDTO(JsonObject jsonObject) {
        this.mgrNo = jsonObject.get("X_SWIFI_MGR_NO").getAsString();
        this.wrdofc = jsonObject.get("X_SWIFI_WRDOFC").getAsString();
        this.mainNm = jsonObject.get("X_SWIFI_MAIN_NM").getAsString();
        this.adres1 = jsonObject.get("X_SWIFI_ADRES1").getAsString();
        this.adres2 = jsonObject.get("X_SWIFI_ADRES2").getAsString();
        this.instlFloor = jsonObject.get("X_SWIFI_INSTL_FLOOR").getAsString();
        this.instlTy = jsonObject.get("X_SWIFI_INSTL_TY").getAsString();
        this.instlMby = jsonObject.get("X_SWIFI_INSTL_MBY").getAsString();
        this.svcSe = jsonObject.get("X_SWIFI_SVC_SE").getAsString();
        this.cmcwr = jsonObject.get("X_SWIFI_CMCWR").getAsString();
        this.cnstcYear = jsonObject.get("X_SWIFI_CNSTC_YEAR").getAsString();
        this.inoutDoor = jsonObject.get("X_SWIFI_INOUT_DOOR").getAsString();
        this.remars3 = jsonObject.get("X_SWIFI_REMARS3").getAsString();
        this.lat = jsonObject.get("LAT").getAsDouble();
        this.lnt = jsonObject.get("LNT").getAsDouble();
        this.workDttm = jsonObject.get("WORK_DTTM").getAsString();
    }
}
