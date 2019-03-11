import com.google.gson.reflect.TypeToken;
import data.GroupInfo;
import util.GsonUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.List;

/**
 * Created by Sunny on 2017/7/13 0013.
 */
@WebFilter(filterName = "NodeInfoFilter", urlPatterns = "/index.jsp")
public class NodeInfoFilter implements Filter {
    public void destroy() {

    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        String data = new CommunicateWithFileServerStrategyImpl("127.0.0.1", 2533).getStorageInfo();
        List<GroupInfo> list = GsonUtil.getInstance().fromJson(data, new TypeToken<List<GroupInfo>>(){}.getType());
        req.setAttribute("data", list);
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
