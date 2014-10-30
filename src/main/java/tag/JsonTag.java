package tag;

import net.sf.json.JSONObject;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * Created by weiyang on 2014/10/28.
 */
public class JsonTag  extends SimpleTagSupport {
    @Override
    public void doTag() throws JspException, IOException {
        StringWriter sw = new StringWriter();
        JspFragment jf=this.getJspBody();
        JspWriter out = getJspContext().getOut();
        jf.invoke(sw);
        String[] pairs = sw.toString().split(",");
        Map<String, Object> myMap = new HashMap<String, Object>();
        for (int i=0;i<pairs.length;i++) {
            String pair = pairs[i];
            String[] keyValue = pair.split(":");
            myMap.put(keyValue[0], keyValue[1]);
        }
        out.println(JSONObject.fromObject(myMap).toString());
    }
}
