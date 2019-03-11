import data.FileInfo;
import util.GsonUtil;

/**
 * Created by Sunny on 2017/7/14 0014.
 */
public class test {
    public static void main(String[] args) {
        FileInfo fileInfo = new FileInfo.Builder()
                .originalName("sadfasf")
                .build();
        System.out.println(GsonUtil.getInstance().toJson(fileInfo));
    }
}
