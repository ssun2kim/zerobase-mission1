package common;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import dto.WifiDTO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ApiService {
    public String getWifiInfoJson(int pageIndex) throws IOException {
        String result = null;

        int pageSize = 1000;
        int start = pageIndex * pageSize + 1;
        int end = (pageIndex + 1) * pageSize;

        String url = String.format("http://openapi.seoul.go.kr:8088/596a4d525373756e3933685a687273/json/TbPublicWifiInfo/%d/%d/", start, end);

        try {
            HttpClient httpClient = new HttpClient();
            result = httpClient.requestGet(url);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public List<WifiDTO> jsonStringToList(String jsonString) {
        List<WifiDTO> list = new ArrayList<>();
        JsonElement jsonElement = JsonParser.parseString(jsonString);
        JsonObject jsonObject = jsonElement.getAsJsonObject();

        JsonArray jsonArray = jsonObject.getAsJsonObject("TbPublicWifiInfo")
                .getAsJsonArray("row");

        if (jsonArray != null) {
            for (int i = 0; i < jsonArray.size(); i++) {
                JsonObject object = jsonArray.get(i).getAsJsonObject();
                list.add(new WifiDTO(object));
            }
        }
        return list;
    }
}
