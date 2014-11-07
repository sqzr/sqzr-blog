package tag;

import util.EncoderHandler;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.io.StringWriter;

/**
 * Created by weiyang on 2014/11/6.
 */
public class LengthTag extends SimpleTagSupport {
    private int num;
    @Override
    public void doTag() throws JspException, IOException {
        StringWriter sw = new StringWriter();
        JspFragment jf=this.getJspBody();
        JspWriter out = getJspContext().getOut();
        jf.invoke(sw);
        String content = sw.toString();
        out.println((content.length() > this.num) ? content.substring(0, this.num) + "..." : content);
    }

    // --


    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}
