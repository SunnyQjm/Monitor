import data.GroupInfo;

import java.io.IOException;
import java.util.List;

/**
 * Created by Sunny on 2017/7/14 0014.
 */

public interface CommunicateWithFileServerStrategy {
    /**
     * 获取所有节点服务器的信息
     * @return
     * @throws IOException
     */
    String getStorageInfo() throws IOException;

    /**
     * 获取所有文件的信息
     * @return
     * @throws IOException
     */
    String[] getFileInfo() throws IOException;
}
