
import java.io.IOException;

/**
 * Created by Sunny on 2017/7/14 0014.
 */
public class CommunicateWithFileServerStrategyImpl extends SocketSupport implements CommunicateWithFileServerStrategy{
    public CommunicateWithFileServerStrategyImpl(String ip, int port) throws IOException {
        super(ip, port);
    }

    @Override
    public String getStorageInfo() throws IOException {
        dos.writeInt(TransProtocol.CODE_MONITOR_GET_INFO);
        dos.writeUTF("");
        String result = dis.readUTF();
        dis.readInt();
        return result;
    }

    @Override
    public String[] getFileInfo() throws IOException {
        String[] results = new String[2];
        dos.writeInt(TransProtocol.CODE_MONITOR_GET_FILE_INFO);
        dos.writeUTF("");
        results[0] = dis.readUTF();
        results[1] = dis.readUTF();
        dis.readInt();
        return results;
    }
}
