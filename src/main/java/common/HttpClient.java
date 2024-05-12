package common;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

import java.io.IOException;

public class HttpClient {
    public String requestGet(String url) throws IOException {
        String result = null;

        OkHttpClient client = new OkHttpClient();
        Request request = new Request.Builder().url(url).build();

        Response response = client.newCall(request).execute();
        if (response.isSuccessful()) {
            ResponseBody body = response.body();
            if (body != null) {
                result = body.string();
            }
        } else {
            System.out.println("Unexpected code " + response);
        }
        return result;
    }
}
