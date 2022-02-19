import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class Jhttps {
    public static void main(String[] args) throws Exception {
        URL url = new URL(args[0]);

        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        // connection.setRequestProperty("accept", "application/json");

        InputStream is = connection.getInputStream();
        byte body [] = is.readAllBytes();
        is.close();
        System.out.println(new String(body));
    }
}
