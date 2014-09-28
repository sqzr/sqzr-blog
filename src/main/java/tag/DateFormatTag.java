package tag;

import com.opensymphony.xwork2.util.ValueStack;
import org.apache.struts2.components.Component;
import org.apache.struts2.views.jsp.ComponentTagSupport;
import org.ocpsoft.prettytime.PrettyTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.io.StringWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Stack;

/**
 * Created by weiyang on 2014/9/28.
 */
public class DateFormatTag extends SimpleTagSupport {



    public void doTag() throws JspException, IOException {
        PrettyTime prettyTime = new PrettyTime();
        StringWriter sw = new StringWriter();
        JspFragment jf=this.getJspBody();
        jf.invoke(sw);
        JspWriter out = getJspContext().getOut();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date dateFormat = format.parse(sw.toString());
            out.println(prettyTime.format(dateFormat).replace(" ", ""));
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }

    // ---


}
